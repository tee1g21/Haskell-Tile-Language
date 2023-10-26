{ 
module Tokens where 
}
%wrapper "posn"

-- digits
$digit = 0-9

-- alpha chars
$alpha = [a-zA-Z]    

tokens :-
  $white+            ;
  "--".*             ;
  input                            { \p s -> TokenInput p }
  place                            { \p s -> TokenPlace p }
  newLine                          { \p s -> TokenNewLine p }
  repeat                           { \p s -> TokenRepeat p }
  for                              { \p s -> TokenFor p }
  if                               { \p s -> TokenIf p }
  else                             { \p s -> TokenElse p }
  rotate                           { \p s -> TokenRotate p }
  scale                            { \p s -> TokenScale p }
  size                             { \p s -> TokenSize p }
  reflectX                         { \p s -> TokenReflectX p }
  reflectY                         { \p s -> TokenReflectY p }
  conjugate                        { \p s -> TokenConjugate p }
  negate                           { \p s -> TokenNegate p }
  subtile                          { \p s -> TokenSubtile p }
  fill                             { \p s -> TokenFill p }
  build                            { \p s -> TokenBuild p }
  \{                               { \p s -> TokenLeftCurly p }
  \}                               { \p s -> TokenRightCurly p }
  \(                               { \p s -> TokenLeftParen p }
  \)                               { \p s -> TokenRightParen p }
  \,                               { \p s -> TokenComma p }
  \+                               { \p s -> TokenPlus p }
  \-                               { \p s -> TokenMinus p }
  \/                               { \p s -> TokenDivide p }
  \*                               { \p s -> TokenMultiply p }
  \%                               { \p s -> TokenMod p }
  \=                               { \p s -> TokenEq p }
  \<                               { \p s -> TokenLessThan p}
  \>                               { \p s -> TokenGreaterThan p }
  \;                               { \p s -> TokenSemiColon p }
  \~                               { \p s -> TokenTilde p}
  true                             { \p s -> TokenTrue p }
  false                            { \p s -> TokenFalse p }
  AND                              { \p s -> TokenAnd p }
  OR                               { \p s -> TokenOr p }
  NOT                              { \p s -> TokenNot p }
  white                            { \p s -> TokenWhite p }
  black                            { \p s -> TokenBlack p }
  $digit $digit*                   { \p s -> TokenInt p (read s) }
  $alpha [$alpha $digit \_ \']*    { \p s -> TokenVar p s }



{
data Token =
  TokenInput AlexPosn         |
  TokenPlace AlexPosn         |
  TokenNewLine AlexPosn       |
  TokenRepeat AlexPosn        |
  TokenFor AlexPosn           |
  TokenIf AlexPosn            |
  TokenElse AlexPosn          |
  TokenRotate AlexPosn        |
  TokenScale AlexPosn         |
  TokenSize AlexPosn          |
  TokenReflectX AlexPosn      |
  TokenReflectY AlexPosn      |
  TokenConjugate AlexPosn     |
  TokenNegate AlexPosn        |
  TokenSubtile AlexPosn       |
  TokenFill AlexPosn          |
  TokenBuild AlexPosn         |
  TokenLeftCurly AlexPosn     |
  TokenRightCurly AlexPosn    |
  TokenLeftParen AlexPosn     |
  TokenRightParen AlexPosn    |
  TokenComma AlexPosn         |
  TokenPlus AlexPosn          |
  TokenMinus AlexPosn         |
  TokenDivide AlexPosn        |
  TokenMultiply AlexPosn      |
  TokenMod AlexPosn           |
  TokenEq AlexPosn            |
  TokenLessThan AlexPosn      |
  TokenGreaterThan AlexPosn   |
  TokenSemiColon AlexPosn     |
  TokenTilde AlexPosn         |
  TokenTrue AlexPosn          |
  TokenFalse AlexPosn         |
  TokenAnd AlexPosn           |
  TokenOr AlexPosn            |
  TokenNot AlexPosn           |
  TokenInt AlexPosn Int       |
  TokenVar AlexPosn String    |
  TokenWhite AlexPosn         |
  TokenBlack AlexPosn          
  deriving (Eq,Show)
    
tokenPosn (TokenInput (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenPlace (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenNewLine (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenRepeat (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenFor (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenIf (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenElse (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenRotate (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenScale (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenSize (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenReflectX (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenReflectY (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenConjugate (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenNegate (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenFill (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenComma (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenLessThan (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenGreaterThan (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenPlus (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenMinus (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenMultiply (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenDivide (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenLeftParen (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenRightParen (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenLeftCurly (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenRightCurly (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenAnd (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenOr (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenEq (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenTrue (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenFalse (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenNot (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenInt (AlexPn _ x y) _) = show x ++ ":" ++ show y
tokenPosn (TokenVar (AlexPn _ x y) _) = show x ++ ":" ++ show y
tokenPosn (TokenSemiColon (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenWhite (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenBlack (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenMod (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenBuild (AlexPn _ x y)) = show x ++ ":" ++ show y
tokenPosn (TokenTilde (AlexPn _ x y)) = show x ++ ":" ++ show y

}