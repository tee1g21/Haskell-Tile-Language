{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    input       { TokenInput _ }
    place       { TokenPlace _ }
    newLine     { TokenNewLine _ }
    repeat      { TokenRepeat _ }
    for         { TokenFor _ }
    if          { TokenIf _ }
    else        { TokenElse _ }
    rotate      { TokenRotate _ }
    scale       { TokenScale _ }
    size        { TokenSize _ }
    reflectX    { TokenReflectX _ }
    reflectY    { TokenReflectY _ }
    conjugate   { TokenConjugate _ }
    negate      { TokenNegate _ }
    subtile     { TokenSubtile _ }
    fill        { TokenFill _ }
    build       { TokenBuild _}
    '{'         { TokenLeftCurly _ }
    '}'         { TokenRightCurly _ }
    '('         { TokenLeftParen _ }
    ')'         { TokenRightParen _ }
    ','         { TokenComma _ }
    '+'         { TokenPlus _ }
    '-'         { TokenMinus _ }
    '/'         { TokenDivide _ }
    '*'         { TokenMultiply _ }
    '%'         { TokenMod _ }
    '='         { TokenEq _ }
    '<'         { TokenLessThan _ }
    '>'         { TokenGreaterThan _ }
    ';'         { TokenSemiColon _ }
    '~'         { TokenTilde _ }
    true        { TokenTrue _ }
    false       { TokenFalse _ }
    AND         { TokenAnd _ }
    OR          { TokenOr _ }
    NOT         { TokenNot _ } 
    int         { TokenInt _ $$ } 
    var         { TokenVar _ $$ }
    white       { TokenWhite _ }
    black       { TokenBlack _ }

%nonassoc if
%nonassoc else
%nonassoc '<' '>'
%nonassoc COMP
%left AND OR
%right NOT
%right '='
%left '+' '-'
%left '*' '/' '%'
%left NEG 
%left ','
%left ';'
%left UVAR

%% 
Init   : input Inps ';' Exp                                        {Input $2 $4} 
       | Exp                                                       {TExp $1}                                              

Exp    : place Tile                                                {Place $2}
       | newLine                                                   {NewLine}
       | repeat '(' Num ')' '{' Exp '}'                            {Repeat $3 $6}
       | for '(' var ',' Num ',' Num ')' '{' Exp '}'               {For $3 $5 $7 $10}
       | if  '(' Bool ')' '{' Exp '}' else '{' Exp '}'             {IfElse $3 $6 $10}
       | if  '(' Bool ')' '{' Exp '}'                              {If $3 $6}
       | var '=' Vars                                              {Assign $1 $3}
       | Exp ';' Exp                                               {Seq $1 $3}
       | Exp ';'                                                   {$1}

Tile   : rotate '(' Num ',' Tile ')'                               {Rotate $3 $5}
       | scale '(' Num ',' Tile ')'                                {Scale $3 $5}
       | reflectX '(' Tile ')'                                     {ReflectX $3}
       | reflectY '(' Tile ')'                                     {ReflectY $3}
       | conjugate '(' Tile ',' Tile ')'                           {Conjugate $3 $5}
       | negate '(' Tile ')'                                       {Negate $3}
       | subtile '(' Tile ',' Num ',' Num ',' Num ')'              {Subtile $3 $5 $7 $9}
       | fill '(' Colour ',' Num ')'                               {Fill $3 $5}
       | build '{' Exp '}'                                         {Build $3 }                            
       | var                                                       {TileVar $1} 
       | '(' Tile ')'                                              {$2}

Num    : size '(' Tile ')'                                         {Size $3}
       | Num '+' Num                                               {Plus $1 $3}
       | Num '-' Num                                               {Subtract $1 $3}
       | Num '*' Num                                               {Multiply $1 $3}
       | Num '/' Num                                               {IntDiv $1 $3}
       | Num '%' Num                                               {Mod $1 $3}
       | '-' Num %prec NEG                                         {Negative $2}
       | int                                                       {Int $1}
       | var                                                       {NumVar $1}
       | '(' Num ')'                                               {$2}

Bool   : true                                                      {TTrue}
       | false                                                      {TFalse}
       | Bool AND Bool                                             {And $1 $3}
       | Bool OR Bool                                              {Or $1 $3}
       | NOT Bool                                                  {Not $2}
       | Num '<' Num                                               {LessThan $1 $3}
       | Num '>' Num                                               {GreaterThan $1 $3}
       | Num '<' '=' Num %prec COMP                                {LessEqThan $1 $4}
       | Num '>' '=' Num %prec COMP                                {GreaterEqThan $1 $4}
       | var                                                       {BoolVar $1}
       | Vars '=' '=' Vars %prec COMP                              {EqualTo $1 $4}
       | '(' Bool ')'                                              {$2}

Vars   : Num                                                       {Num $1}
       | Bool                                                      {Bool $1}
       | Tile                                                      {Tile $1}
       | '~' var                                                   {UVar $2} 
    
Inps   : var                                                       {F $1}
       | var ',' Inps                                              {X $1 $3}

Colour : white                                                     {White}
       | black                                                     {Black}

{
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t) ++ " - " ++ (show t))


data TInit = Input TInputs TExp | TExp TExp
    deriving (Show, Eq)

data TExp = Place TTile | NewLine | Repeat TNum TExp | For String TNum TNum TExp 
          | IfElse TBool TExp TExp | If TBool TExp | Assign String Vars  
          | Seq TExp TExp
    deriving (Show, Eq)

data TTile = Rotate TNum TTile | Scale TNum TTile | ReflectX TTile | ReflectY TTile 
          | Conjugate TTile TTile | Negate TTile | Subtile TTile TNum TNum TNum
          | Fill Colour TNum | Build TExp | TileVar String 
    deriving (Show, Eq)

data TNum = Size TTile | Plus TNum TNum | Subtract TNum TNum | Multiply TNum TNum
          | IntDiv TNum TNum | Mod TNum TNum | Negative TNum | Int Int | NumVar String
    deriving (Show, Eq)

data TBool = TTrue | TFalse | And TBool TBool | Or TBool TBool | Not TBool
             | LessThan TNum TNum | GreaterThan TNum TNum | LessEqThan TNum TNum
             | GreaterEqThan TNum TNum | EqualTo Vars Vars | BoolVar String
    deriving (Show, Eq)

data Vars = Num TNum | Tile TTile | Bool TBool | UVar String
    deriving (Show, Eq)

data TInputs = F String | X String TInputs 
    deriving (Show, Eq)

data Colour = White | Black
    deriving (Show, Eq)


}