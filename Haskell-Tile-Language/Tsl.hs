-- Imports our token, and grammar files for interpreting our language --
import Tokens
import Grammar

-- Other imports needed for either interpreting code or making said code function --
import System.Environment ( getArgs )
import Control.Exception
import System.IO
import Data.List

---- START OF MAIN IO SECTION ----

-- Main module, calls parser/interpreter with error checking when crash occurs --
main :: IO ()
main = catch main' noParse

-- Tells the user that the program inputted isn't compatible with the interpreter when crashes occour --
noParse :: ErrorCall -> IO ()       
noParse e = do let err =  show e
               hPutStr stderr ("Invalid Input File: " ++ err)
               return ()

-- Reads parses file and interprets the code given in the input file (very clunky and could be simplified, but works for now) --
main' :: IO ()
main' = do (filename : _ ) <- getArgs
           if checkFileExtension filename ".tsl" then -- Checks for correct file type.
                do
                    sourceText <- readFile filename
                    let parsedProg = parseCalc (alexScanTokens sourceText)
                    let inputs = initialiseInputs parsedProg 
                    if not (null inputs) then -- Check to see if the program has access to the tiles it needs.
                        do
                            let filenames =  map (++ ".tl") inputs
                            fileContents <- mapM readFile filenames
                            let initialEnv = initialiseEnv inputs fileContents (addVar (addVar (Env []) "previousTile" (Helper "")) "grid" (Grids ""))
                            let finalEnv = interpret (getExp parsedProg) initialEnv
                            let (Grids grid) = extractValue (lookupVar finalEnv "grid")
                            let finalGrid = removeLastNewLine (removeEndmarkers grid)
                            --putStr finalGrid -- Final grid outputted here
                            
                            -- TESTING CODE NOT NEEDED FOR FINAL FUNCTIONALITY
                            writeFile "TileViewer\\test.tl" finalGrid
                            -- print initialEnv
                    else 
                        hPutStr stderr "No Input Tiles"                    
           else
                hPutStr stderr "Invalid File Type"

-- Takes the initial program and returns the starting expression of said program --
getExp :: TInit -> TExp
getExp (Input _ expr) = expr
getExp (TExp expr) = expr

-- Returns the initial environement to be used by the interpret function --
initialiseEnv :: [String] -> [String] -> Env -> Env
initialiseEnv [] [] env = env
initialiseEnv vars contents env = initialiseEnv (tail vars) (tail contents) (addVar env (head vars) (Tiles (head contents))) 

-- Takes initial program and returns input variable names --
initialiseInputs :: TInit -> [String]
initialiseInputs (Input inputs init2) = getInputVars inputs
initialiseInputs (TExp expr) = []

-- Returns list of input file names without the .tl (as written in our language) --
getInputVars :: TInputs -> [String]
getInputVars (F var) = [var]
getInputVars (X var inputs) = var : getInputVars inputs

-- Checks that the file extension is the correct one for the situation --
checkFileExtension :: String -> String -> Bool 
checkFileExtension filename extension = fileEnd == extension
    where fileEnd = reverse (take (length extension) (reverse filename))

-- Gets ride of endmarkers from a string --
removeEndmarkers :: String -> String
removeEndmarkers grid = filter (/='x') grid

-- Removes the last new line character from the string --
removeLastNewLine :: String -> String 
removeLastNewLine grid 
        | lastChar == "\n" = reverse (drop 1 (reverse grid)) 
        | otherwise = grid
    where
        lastChar = take 1 (reverse grid)


---- START OF ENVIRONMENT DATA TYPE ----
{-
Environment is used to store all variables including final grid which is progressively built using place.
The final grid is labelled "grid" and should be the only Var with type grid.
When the Environment is initialised (in main), it will only contain "grid" which will have the value "" and input tile variables.
-}

-- Creates the datatype which is used for storing the virtual environment of the program --
newtype Env = Env [(String, Var)] deriving (Show)

-- The different data types which are used by the enviroment --
data Var = Grids String | Tiles String | Nums Int | Bools Bool | Helper String
    deriving (Show, Eq)

-- Tries to look up a variable inside the program environment via its possible name --
lookupVar :: Env -> String -> Maybe Var
lookupVar (Env env) name = lookup name env

-- Used to extract the raw value from a maybe construct --
extractValue :: Maybe a -> a
extractValue (Just x) = x
extractValue Nothing = error "Variable is empty!"

-- Used to add a variable to the environment with a given name and value --
addVar :: Env -> String -> Var -> Env
addVar (Env env) name value = Env ((name, value) : env)

-- Used to edit a particular variable in the environment with a new value if said variable exists --
editVar :: Env -> String -> Var -> Env
editVar (Env env) name value = Env (map updateVar env)
    where updateVar (n, v) | (n == name) = (n, value)
                           | otherwise = (n, v)

-- Used to remove a variable with a given name from the environment if it exists  --
deleteVar :: Env -> String -> Env
deleteVar (Env env) name = Env (filter (\(n, _) -> n /= name) env)

-- A function which is used for ease of use (used instead of distinguishing between add and edit) --
updateVar :: Env -> String -> Var -> Env
updateVar env name value | (lookupVar env name == Nothing) = addVar env name value
                         | otherwise = editVar env name value


---- START OF TEXP INTERPRETER FUNCTIONALITY ----

-- A recursive function for TExp which is used to run all the code parsed from the program --
interpret :: TExp -> Env -> Env

-- Tile based commands, used for interacting with the output grid.
interpret (Place tile) env = iPlace (interpretTile tile env) env
interpret NewLine env = iNewLine env

-- Loop based commands which allow for a group of expressions to be repeated.
interpret (Repeat n exp) env = iRepeat (interpretNum n env) 1 exp env
interpret (For x start final exp) env = deleteVar (iFor x (interpretNum final env) (interpretNum start env) exp (updateVar env x (Nums (interpretNum start env)))) x -- needs testing but should work hopefully

-- Logical checks which need to passed to allow for a particular set of expressions to be ran.
interpret (IfElse boolExp exp1 exp2) env | interpretBool boolExp env = interpret exp1 env 
                                         | otherwise = interpret exp2 env
interpret (If boolExp exp) env | interpretBool boolExp env = interpret exp env
                               | otherwise = env

-- All code used for dealing with different variables and parsing them into there own interpreters where needed.
interpret (Assign name (Num tNum)) env = updateVar env name (Nums (interpretNum tNum env))
interpret (Assign name (Tile tTile)) env = updateVar env name (Tiles (interpretTile tTile env))
interpret (Assign name (Bool tBool)) env = updateVar env name (Bools (interpretBool tBool env))
interpret (Assign leftVar (UVar rightVar)) env = updateVar env leftVar var
    where var = extractValue (lookupVar env rightVar)

-- Code used to allow the interpreter to continue executing lines of code (stops being called when the program ends).
interpret (Seq exp1 exp2) env = interpret exp2 (interpret exp1 env)

-- Update previous tile and place --
iPlace :: String -> Env -> Env
iPlace tile env
        | grid == "" = updateVar previousTileEnv "grid" (Grids (grid ++ tile)) --empty grid
        | isAllMarked (lines grid) = updateVar previousTileEnv "grid" (Grids (grid ++ tile)) --grid with all lines end marked
        | otherwise = updateVar previousTileEnv "grid" (Grids appendedGrid)
    where 
        (Grids grid) = extractValue (lookupVar env "grid")
        previousTileEnv = updateVar env "previousTile" (Helper tile)
        firstUnmarked = getFirstUnmarked (getXList (lines grid)) 0
        appendedGrid = unlines (appendExisting (lines tile) (lines grid) firstUnmarked)


-- Checks if all lines in grid have end markers --
isAllMarked :: [String] -> Bool
isAllMarked grid = all (== "x") (getXList grid)

-- Returns list of "x" or "" --
getXList :: [String] -> [String]
getXList = map (filter (=='x')) 

-- Returns index of first "" in an x list --
getFirstUnmarked :: [String] -> Int -> Int
getFirstUnmarked xList i 
    | head xList == "" = i 
    | otherwise = getFirstUnmarked (tail xList) (i+1)

-- Places to end of an existing line --
appendExisting :: [String] -> [String] -> Int -> [String]
appendExisting tile grid y = markedGrid ++ (zipWith (++) unmarkedGrid tile)
    where
        markedGrid = take y grid
        unmarkedGrid = drop y grid

-- The new line interpreter function (appends 'x' endmarker to end of previous n times with n being the size of the previous tile) --
iNewLine :: Env -> Env
iNewLine env = updateVar env "grid" (Grids (unlines (oldMarked ++ markedGrid)))
    where
        (Helper previousTile) = extractValue (lookupVar env "previousTile")
        n = iSizeY previousTile
        (Grids grid) = extractValue (lookupVar env "grid")

        unmarkedGrid = getUnmarkedGrid (lines grid)
        oldMarked = reverse (drop (length unmarkedGrid) (reverse (lines grid)))
        markedGrid = map (++"x") (take n unmarkedGrid) ++ drop n unmarkedGrid

-- Returns lines of grid without end markers --
getUnmarkedGrid :: [String] -> [String]
getUnmarkedGrid [] = []
getUnmarkedGrid grid
        | lastChar == "x" = getUnmarkedGrid (tail grid)
        | otherwise = grid
    where
        lastChar = take 1 (reverse (head grid))

-- Repeats an interpreter function a given number of times --
iRepeat :: Int -> Int -> TExp -> Env -> Env
iRepeat f i exp env
    | f < i = env
    | otherwise = iRepeat f (i + 1) exp (interpret exp env)

-- Repeats an interpreter function a given number of times keeping track of said times in an assigned variable --
iFor :: String -> Int -> Int -> TExp -> Env -> Env
iFor x f i  exp env 
    | f < i = env
    | otherwise = iFor x f (i + 1) exp (interpret exp (updateVar env x (Nums i)))


---- START OF TTILE INTERPRETER FUNCTIONALITY ----

-- A recursive function for TTile which is used to run all tile related code from the program --
interpretTile :: TTile -> Env -> String

-- Tile based code used for manipulating a given number of inputted tiles.
interpretTile (Rotate i exp) env = iRotate (interpretNum i env) (interpretTile exp env)
interpretTile (Scale i exp) env = iScale (interpretNum i env) (interpretTile exp env)
interpretTile (ReflectX exp) env = iReflect 'x' (interpretTile exp env)
interpretTile (ReflectY exp) env = iReflect 'y' (interpretTile exp env)
interpretTile (Conjugate exp1 exp2) env = iConjugate (interpretTile exp1 env) (interpretTile exp2 env)
interpretTile (Negate exp) env = iNegate (interpretTile exp env)
interpretTile (Subtile exp x y size) env = iSubtile (interpretTile exp env) (interpretNum x env) (interpretNum y env) (interpretNum size env)

-- Other functions to do with tiles without manipulating a given inputted tile.
interpretTile (Fill colour size) env = iFill colour (interpretNum size env)
interpretTile (Build exp) env = iBuild exp (updateVar env "grid" (Grids ""))
interpretTile (TileVar var) env = value
    where (Tiles value) = extractValue (lookupVar env var)

-- Used for rotating a given tile by a given angle --
iRotate :: Int -> String -> String
iRotate n grid = unlines ( rotate ( lines grid))
    where 
        r90 = map reverse . transpose
        r180 = map reverse . reverse
        r270 = transpose . map reverse
        rotate = case mod n 360 of
            0 -> id
            90 -> r90
            180 -> r180
            270 -> r270
            _ -> error "Invalid rotation angle (enter multiple of 90)"

-- Used for scaling up a given tile by a given int value in both vertical and horizontal directions. --
iScale :: Int -> String -> String 
iScale i tile = lineDupe (concatMap (\c -> if c == '\n' then [c] else replicate i c) tile) -- duplicating each character i times (ignoring newlines), then duplicating each line
    where lineDupe x = intercalate "\n" (concatMap (replicate i) (lines x))

-- Used to reflect the values of an inputted tile on either plane --
iReflect :: Char -> String -> String 
iReflect 'x' tile = unlines (reverse (lines tile)) -- reflect x = reverse order of string lines
iReflect 'y' tile = unlines (map reverse (lines tile)) -- reflect y = reverse string characters in tile. same but uses map
iReflect _ tile = error "Invalid reflection direction"

-- Used to perform AND operations on corresponding values between two tiles --
iConjugate :: String -> String -> String 
iConjugate tile1 tile2 | ((length tile1) /= (length tile2)) = error ("Tiles trying to be conjugated are of different sizes (Tile1: " ++ show (length tile1) ++ "  Tile2: " ++ show (length tile2) ++ ")")                       
                       | otherwise = iterativeConjugate tile1 tile2

-- Uses recursion to perform the given conjugation after initial error checking --
iterativeConjugate :: String -> String -> String 
iterativeConjugate "" "" = ""
iterativeConjugate (x:tile1) (y:tile2) | x == y = [x] ++ (iterativeConjugate tile1 tile2) -- when char is equal then same char is returned.
                                       | otherwise = "0" ++ (iterativeConjugate tile1 tile2) -- char not equal always a 0 and 1 so gets a 0.

-- Used to return a tile with opposite values to that initially inputted (is iterative) --
iNegate :: String -> String
iNegate "" = ""
iNegate ('0':tile) = "1" ++ (iNegate tile)
iNegate ('1':tile) = "0" ++ (iNegate tile)
iNegate (x:tile) = [x] ++ (iNegate tile)

-- Takes a tile and only returns the parts that the user wants. --
iSubtile :: String -> Int -> Int -> Int -> String
iSubtile tile x y size = combineSplitTile (map (subList x size) (subList y size (lines tile)))

-- Subs a list based on the first point you want values from and how many values you want. --
subList :: Int -> Int -> [a] -> [a]
subList firstPos size list = take size (drop firstPos list)

-- Used to take a split tile (string list) and turn it back into a regular tile --
combineSplitTile :: [String] -> String
combineSplitTile [] = []
combineSplitTile (x:xs) = x ++ "\n" ++ (combineSplitTile xs) 

-- Creates an new tile of a given square size with a given colour --
iFill :: Colour -> Int -> String
iFill White size = concat (replicate size ((replicate size '0') ++ "\n"))
iFill Black size = concat (replicate size ((replicate size '1') ++ "\n"))

-- Used to build and return a string representing the current version of the grid --
iBuild :: TExp -> Env -> String
iBuild exp freshEnv = removeLastNewLine (removeEndmarkers returnGrid)
    where (Grids returnGrid) = extractValue (lookupVar (interpret exp freshEnv) "grid")


---- START OF TNUM INTERPRETER FUNCTIONALITY ----

-- A recursive function for TNum which is used to run all number related code from the program --
interpretNum :: TNum -> Env -> Int

-- Used to get the size of a tile.
interpretNum (Size tileExp) env = iSizeX (interpretTile tileExp env)

-- Used for manipulating different numbers.
interpretNum (Plus num1 num2) env = interpretNum num1 env + interpretNum num2 env
interpretNum (Subtract num1 num2) env = interpretNum num1 env - interpretNum num2 env
interpretNum (Multiply num1 num2) env = interpretNum num1 env * interpretNum num2 env
interpretNum (IntDiv num1 num2) env = interpretNum num1 env `div` interpretNum num2 env  
interpretNum (Mod num1 num2) env = interpretNum num1 env `mod` interpretNum num2 env

-- Other bits of code for number manipulation including variable value extraction.
interpretNum (Negative num) env = - (interpretNum num env)
interpretNum (Int i) env = i
interpretNum (NumVar var) env = value
    where (Nums value) = extractValue (lookupVar env var)

-- Used to get the size of a given tile (USING FIRST LINE OF THE TILE) --
iSizeX :: String -> Int
iSizeX exp = length (head (lines exp))

-- Used to get the size of a given tile (USING NUMBER OF LINES IN THE TILE) --
iSizeY :: String -> Int
iSizeY exp = length (lines exp)


---- START OF TBOOL INTERPRETER FUNCTIONALITY ----

-- A recursive function for TBool which is used to run all boolean related code from the program --
interpretBool :: TBool -> Env -> Bool

-- Values used in code to store the different boolean states.
interpretBool TTrue env = True
interpretBool TFalse env = False

-- Different ways in which we work with booleans to get a value.
interpretBool (And exp1 exp2) env = interpretBool exp1 env && interpretBool exp2 env
interpretBool (Or exp1 exp2) env = interpretBool exp1 env || interpretBool exp2 env
interpretBool (Not exp) env = not (interpretBool exp env)
interpretBool (LessThan num1 num2) env = interpretNum num1 env < interpretNum num2 env
interpretBool (GreaterThan num1 num2) env = interpretNum num1 env > interpretNum num2 env
interpretBool (LessEqThan num1 num2) env = interpretNum num1 env <= interpretNum num2 env
interpretBool (GreaterEqThan num1 num2) env = interpretNum num1  env >= interpretNum num2 env

-- Equalality Comparrisons returns bool
interpretBool (EqualTo (Num tNum1) (Num tNum2)) env = interpretNum tNum1 env == interpretNum tNum2 env -- if both are nums, does a comparison and returns the result
interpretBool (EqualTo (Num tNum) (UVar var)) env = interpretNum tNum env == x -- compares a Num type with an unknown variable
    where (Nums x) = extractValue (lookupVar env var) -- lookup for the unknown variable

interpretBool (EqualTo (Tile tTile1) (Tile tTile2)) env = interpretTile tTile1 env == interpretTile tTile2 env -- if both are tiles, does a comparison and returns the result
interpretBool (EqualTo (Tile tTile) (UVar var)) env = interpretTile tTile env == x -- compares a Tile type with an unknown variable
    where (Tiles x) = extractValue (lookupVar env var) -- lookup for the unknown variable

interpretBool (EqualTo (Bool tBool1) (Bool tBool2)) env = interpretBool tBool1 env == interpretBool tBool2 env -- if both are booleans, perform a comparison and return the result
interpretBool (EqualTo (Bool tBool) (UVar var)) env = interpretBool tBool env == x -- compares a Bool type with an unknown variable
    where (Bools x) = extractValue (lookupVar env var) -- lookup for the unknown variable

-- Does the same checks for unassigned variables as before but for when unassigneds are the first.
interpretBool (EqualTo (UVar var) (Num tNum)) env = x == interpretNum tNum env
    where (Nums x) = extractValue (lookupVar env var)
interpretBool (EqualTo (UVar var) (Bool tBool)) env = x == interpretBool tBool env
    where (Bools x) = extractValue (lookupVar env var)
interpretBool (EqualTo (UVar var) (Tile tTile)) env = x == interpretTile tTile env
    where (Tiles x) = extractValue (lookupVar env var)

-- When types are unassigned it just checks for equal values and if so it.
interpretBool (EqualTo (UVar var1) (UVar var2)) env = extractValue (lookupVar env var1) == extractValue (lookupVar env var2)

-- If no previous pattern matching is met then it returns false.
interpretBool (EqualTo _ _) env = False

-- Extracts the boolean value from a boolean variable.
interpretBool (BoolVar var) env = value
    where (Bools value) = extractValue (lookupVar env var)