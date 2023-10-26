import Tokens
import Grammar
import System.Environment ( getArgs )
import Control.Exception
import System.IO
import Data.List


main :: IO ()
main = catch main' noParse

main' :: IO ()
main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           putStrLn ("Parsing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))

noParse :: ErrorCall -> IO ()       
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

-- for testing Tokens inside ghci
testTokens :: String -> IO()
testTokens input = do 
    contents <- readFile input
    tokens <- mapM print (alexScanTokens contents)
    print tokens

testParse :: String -> IO()
testParse input = do  
           sourceText <- readFile input
           putStrLn ("Parsing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ show parsedProg)










