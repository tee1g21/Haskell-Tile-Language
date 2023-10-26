{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,333) ([63488,1,0,2,1,0,0,0,0,2048,0,0,0,0,0,8192,0,55296,159,1024,0,0,0,0,0,2,0,0,64,0,0,2048,0,0,0,256,0,65024,551,462,49152,17663,14784,0,0,0,4,1024,272,192,0,0,0,0,16384,0,0,0,8,0,0,256,0,0,8192,0,0,0,4,0,0,128,0,0,4096,0,0,0,2,0,0,16,0,32768,2557,16384,0,0,0,0,248,0,256,0,0,32,0,0,2,0,0,0,128,3968,0,4096,0,0,0,0,0,16,0,1984,0,2048,0,0,0,6,65216,4,32,55296,159,1024,0,5115,32768,0,32608,2,16,60416,79,512,0,34818,24576,0,64,17,12,0,8000,0,0,1024,0,0,32800,8,6,1024,272,192,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,223,0,0,8,6,0,32768,0,0,5119,59137,0,0,0,16,0,0,0,0,0,0,0,16368,28689,14,0,0,0,0,0,0,0,0,128,0,0,4096,0,57344,8831,7392,0,20476,39940,3,0,0,0,0,0,0,0,16384,0,0,0,7144,0,0,256,192,0,1024,0,0,128,34,24,4096,1088,768,0,34818,24576,0,64,17,12,2048,544,384,0,17409,12292,0,32800,136,6,1024,272,192,0,0,0,0,32768,62,0,64896,9,64,0,64,0,0,32768,31,0,0,1008,0,0,256,0,0,8192,0,0,0,8,0,0,128,0,0,8192,0,0,0,4,0,0,0,0,0,0,0,0,16384,1024,0,0,0,0,0,0,16,0,0,0,0,0,0,0,16384,4352,3072,0,8200,32770,1,0,0,0,55296,159,1024,0,0,0,0,0,0,0,60416,79,512,32768,2557,16384,49152,7,0,8,0,64,0,0,0,0,0,0,126,0,0,3968,0,32768,8704,6144,0,0,62,0,512,136,96,0,0,0,0,0,0,0,0,0,0,0,28672,0,0,0,14,32768,15,0,16,0,0,0,0,0,0,0,0,0,0,65024,551,462,0,0,4,0,16384,1024,0,0,3968,0,0,61440,1,0,16400,4,3,0,0,0,0,128,8,0,16384,0,0,0,8,0,0,256,0,0,49152,15,0,0,500,0,0,0,0,0,34818,24576,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000,0,4096,0,0,0,4096,0,0,0,2,0,0,64512,0,0,8200,32770,1,31,0,32,992,0,1024,0,2048,128,0,0,4097,0,0,16000,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Init","Exp","Tile","Num","Bool","Vars","Inps","Colour","input","place","newLine","repeat","for","if","else","rotate","scale","size","reflectX","reflectY","conjugate","negate","subtile","fill","build","'{'","'}'","'('","')'","','","'+'","'-'","'/'","'*'","'%'","'='","'<'","'>'","';'","'~'","true","false","AND","OR","NOT","int","var","white","black","%eof"]
        bit_start = st Prelude.* 53
        bit_end = (st Prelude.+ 1) Prelude.* 53
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..52]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (12) = happyShift action_2
action_0 (13) = happyShift action_5
action_0 (14) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (50) = happyShift action_10
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (50) = happyShift action_29
action_2 (10) = happyGoto action_28
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (53) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (42) = happyShift action_27
action_4 _ = happyReduce_2

action_5 (19) = happyShift action_16
action_5 (20) = happyShift action_17
action_5 (22) = happyShift action_18
action_5 (23) = happyShift action_19
action_5 (24) = happyShift action_20
action_5 (25) = happyShift action_21
action_5 (26) = happyShift action_22
action_5 (27) = happyShift action_23
action_5 (28) = happyShift action_24
action_5 (31) = happyShift action_25
action_5 (50) = happyShift action_26
action_5 (6) = happyGoto action_15
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_4

action_7 (31) = happyShift action_14
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (31) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (31) = happyShift action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (39) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (19) = happyShift action_16
action_11 (20) = happyShift action_17
action_11 (21) = happyShift action_44
action_11 (22) = happyShift action_18
action_11 (23) = happyShift action_19
action_11 (24) = happyShift action_20
action_11 (25) = happyShift action_21
action_11 (26) = happyShift action_22
action_11 (27) = happyShift action_23
action_11 (28) = happyShift action_24
action_11 (31) = happyShift action_54
action_11 (35) = happyShift action_46
action_11 (43) = happyShift action_55
action_11 (44) = happyShift action_56
action_11 (45) = happyShift action_57
action_11 (48) = happyShift action_58
action_11 (49) = happyShift action_47
action_11 (50) = happyShift action_59
action_11 (6) = happyGoto action_50
action_11 (7) = happyGoto action_51
action_11 (8) = happyGoto action_60
action_11 (9) = happyGoto action_61
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_16
action_12 (20) = happyShift action_17
action_12 (21) = happyShift action_44
action_12 (22) = happyShift action_18
action_12 (23) = happyShift action_19
action_12 (24) = happyShift action_20
action_12 (25) = happyShift action_21
action_12 (26) = happyShift action_22
action_12 (27) = happyShift action_23
action_12 (28) = happyShift action_24
action_12 (31) = happyShift action_54
action_12 (35) = happyShift action_46
action_12 (43) = happyShift action_55
action_12 (44) = happyShift action_56
action_12 (45) = happyShift action_57
action_12 (48) = happyShift action_58
action_12 (49) = happyShift action_47
action_12 (50) = happyShift action_59
action_12 (6) = happyGoto action_50
action_12 (7) = happyGoto action_51
action_12 (8) = happyGoto action_52
action_12 (9) = happyGoto action_53
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (50) = happyShift action_49
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (21) = happyShift action_44
action_14 (31) = happyShift action_45
action_14 (35) = happyShift action_46
action_14 (49) = happyShift action_47
action_14 (50) = happyShift action_48
action_14 (7) = happyGoto action_43
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_3

action_16 (31) = happyShift action_42
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (31) = happyShift action_41
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (31) = happyShift action_40
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (31) = happyShift action_39
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (31) = happyShift action_38
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (31) = happyShift action_37
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (31) = happyShift action_36
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (31) = happyShift action_35
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (29) = happyShift action_34
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (19) = happyShift action_16
action_25 (20) = happyShift action_17
action_25 (22) = happyShift action_18
action_25 (23) = happyShift action_19
action_25 (24) = happyShift action_20
action_25 (25) = happyShift action_21
action_25 (26) = happyShift action_22
action_25 (27) = happyShift action_23
action_25 (28) = happyShift action_24
action_25 (31) = happyShift action_25
action_25 (50) = happyShift action_26
action_25 (6) = happyGoto action_33
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_21

action_27 (13) = happyShift action_5
action_27 (14) = happyShift action_6
action_27 (15) = happyShift action_7
action_27 (16) = happyShift action_8
action_27 (17) = happyShift action_9
action_27 (50) = happyShift action_10
action_27 (5) = happyGoto action_32
action_27 _ = happyReduce_11

action_28 (42) = happyShift action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (33) = happyShift action_30
action_29 _ = happyReduce_49

action_30 (50) = happyShift action_29
action_30 (10) = happyGoto action_96
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (13) = happyShift action_5
action_31 (14) = happyShift action_6
action_31 (15) = happyShift action_7
action_31 (16) = happyShift action_8
action_31 (17) = happyShift action_9
action_31 (50) = happyShift action_10
action_31 (5) = happyGoto action_95
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_10

action_33 (32) = happyShift action_94
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (13) = happyShift action_5
action_34 (14) = happyShift action_6
action_34 (15) = happyShift action_7
action_34 (16) = happyShift action_8
action_34 (17) = happyShift action_9
action_34 (50) = happyShift action_10
action_34 (5) = happyGoto action_93
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (51) = happyShift action_91
action_35 (52) = happyShift action_92
action_35 (11) = happyGoto action_90
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (19) = happyShift action_16
action_36 (20) = happyShift action_17
action_36 (22) = happyShift action_18
action_36 (23) = happyShift action_19
action_36 (24) = happyShift action_20
action_36 (25) = happyShift action_21
action_36 (26) = happyShift action_22
action_36 (27) = happyShift action_23
action_36 (28) = happyShift action_24
action_36 (31) = happyShift action_25
action_36 (50) = happyShift action_26
action_36 (6) = happyGoto action_89
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (19) = happyShift action_16
action_37 (20) = happyShift action_17
action_37 (22) = happyShift action_18
action_37 (23) = happyShift action_19
action_37 (24) = happyShift action_20
action_37 (25) = happyShift action_21
action_37 (26) = happyShift action_22
action_37 (27) = happyShift action_23
action_37 (28) = happyShift action_24
action_37 (31) = happyShift action_25
action_37 (50) = happyShift action_26
action_37 (6) = happyGoto action_88
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (19) = happyShift action_16
action_38 (20) = happyShift action_17
action_38 (22) = happyShift action_18
action_38 (23) = happyShift action_19
action_38 (24) = happyShift action_20
action_38 (25) = happyShift action_21
action_38 (26) = happyShift action_22
action_38 (27) = happyShift action_23
action_38 (28) = happyShift action_24
action_38 (31) = happyShift action_25
action_38 (50) = happyShift action_26
action_38 (6) = happyGoto action_87
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (19) = happyShift action_16
action_39 (20) = happyShift action_17
action_39 (22) = happyShift action_18
action_39 (23) = happyShift action_19
action_39 (24) = happyShift action_20
action_39 (25) = happyShift action_21
action_39 (26) = happyShift action_22
action_39 (27) = happyShift action_23
action_39 (28) = happyShift action_24
action_39 (31) = happyShift action_25
action_39 (50) = happyShift action_26
action_39 (6) = happyGoto action_86
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (19) = happyShift action_16
action_40 (20) = happyShift action_17
action_40 (22) = happyShift action_18
action_40 (23) = happyShift action_19
action_40 (24) = happyShift action_20
action_40 (25) = happyShift action_21
action_40 (26) = happyShift action_22
action_40 (27) = happyShift action_23
action_40 (28) = happyShift action_24
action_40 (31) = happyShift action_25
action_40 (50) = happyShift action_26
action_40 (6) = happyGoto action_85
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (21) = happyShift action_44
action_41 (31) = happyShift action_45
action_41 (35) = happyShift action_46
action_41 (49) = happyShift action_47
action_41 (50) = happyShift action_48
action_41 (7) = happyGoto action_84
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (21) = happyShift action_44
action_42 (31) = happyShift action_45
action_42 (35) = happyShift action_46
action_42 (49) = happyShift action_47
action_42 (50) = happyShift action_48
action_42 (7) = happyGoto action_83
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (32) = happyShift action_82
action_43 (34) = happyShift action_71
action_43 (35) = happyShift action_72
action_43 (36) = happyShift action_73
action_43 (37) = happyShift action_74
action_43 (38) = happyShift action_75
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (31) = happyShift action_81
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (21) = happyShift action_44
action_45 (31) = happyShift action_45
action_45 (35) = happyShift action_46
action_45 (49) = happyShift action_47
action_45 (50) = happyShift action_48
action_45 (7) = happyGoto action_80
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (21) = happyShift action_44
action_46 (31) = happyShift action_45
action_46 (35) = happyShift action_46
action_46 (49) = happyShift action_47
action_46 (50) = happyShift action_48
action_46 (7) = happyGoto action_79
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_30

action_48 _ = happyReduce_31

action_49 (33) = happyShift action_78
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_47

action_51 (34) = happyShift action_71
action_51 (35) = happyShift action_72
action_51 (36) = happyShift action_73
action_51 (37) = happyShift action_74
action_51 (38) = happyShift action_75
action_51 (40) = happyShift action_76
action_51 (41) = happyShift action_77
action_51 _ = happyReduce_45

action_52 (32) = happyShift action_70
action_52 (46) = happyShift action_63
action_52 (47) = happyShift action_64
action_52 _ = happyReduce_46

action_53 (39) = happyShift action_62
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_16
action_54 (20) = happyShift action_17
action_54 (21) = happyShift action_44
action_54 (22) = happyShift action_18
action_54 (23) = happyShift action_19
action_54 (24) = happyShift action_20
action_54 (25) = happyShift action_21
action_54 (26) = happyShift action_22
action_54 (27) = happyShift action_23
action_54 (28) = happyShift action_24
action_54 (31) = happyShift action_54
action_54 (35) = happyShift action_46
action_54 (43) = happyShift action_55
action_54 (44) = happyShift action_56
action_54 (45) = happyShift action_57
action_54 (48) = happyShift action_58
action_54 (49) = happyShift action_47
action_54 (50) = happyShift action_59
action_54 (6) = happyGoto action_67
action_54 (7) = happyGoto action_68
action_54 (8) = happyGoto action_69
action_54 (9) = happyGoto action_53
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (50) = happyShift action_66
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_33

action_57 _ = happyReduce_34

action_58 (19) = happyShift action_16
action_58 (20) = happyShift action_17
action_58 (21) = happyShift action_44
action_58 (22) = happyShift action_18
action_58 (23) = happyShift action_19
action_58 (24) = happyShift action_20
action_58 (25) = happyShift action_21
action_58 (26) = happyShift action_22
action_58 (27) = happyShift action_23
action_58 (28) = happyShift action_24
action_58 (31) = happyShift action_54
action_58 (35) = happyShift action_46
action_58 (43) = happyShift action_55
action_58 (44) = happyShift action_56
action_58 (45) = happyShift action_57
action_58 (48) = happyShift action_58
action_58 (49) = happyShift action_47
action_58 (50) = happyShift action_59
action_58 (6) = happyGoto action_50
action_58 (7) = happyGoto action_51
action_58 (8) = happyGoto action_65
action_58 (9) = happyGoto action_53
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyReduce_42
action_59 (32) = happyReduce_42
action_59 (39) = happyReduce_42
action_59 (42) = happyReduce_42
action_59 (46) = happyReduce_42
action_59 (47) = happyReduce_42
action_59 (53) = happyReduce_42
action_59 _ = happyReduce_31

action_60 (46) = happyShift action_63
action_60 (47) = happyShift action_64
action_60 _ = happyReduce_46

action_61 (39) = happyShift action_62
action_61 _ = happyReduce_9

action_62 (39) = happyShift action_123
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (19) = happyShift action_16
action_63 (20) = happyShift action_17
action_63 (21) = happyShift action_44
action_63 (22) = happyShift action_18
action_63 (23) = happyShift action_19
action_63 (24) = happyShift action_20
action_63 (25) = happyShift action_21
action_63 (26) = happyShift action_22
action_63 (27) = happyShift action_23
action_63 (28) = happyShift action_24
action_63 (31) = happyShift action_54
action_63 (35) = happyShift action_46
action_63 (43) = happyShift action_55
action_63 (44) = happyShift action_56
action_63 (45) = happyShift action_57
action_63 (48) = happyShift action_58
action_63 (49) = happyShift action_47
action_63 (50) = happyShift action_59
action_63 (6) = happyGoto action_50
action_63 (7) = happyGoto action_51
action_63 (8) = happyGoto action_122
action_63 (9) = happyGoto action_53
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (19) = happyShift action_16
action_64 (20) = happyShift action_17
action_64 (21) = happyShift action_44
action_64 (22) = happyShift action_18
action_64 (23) = happyShift action_19
action_64 (24) = happyShift action_20
action_64 (25) = happyShift action_21
action_64 (26) = happyShift action_22
action_64 (27) = happyShift action_23
action_64 (28) = happyShift action_24
action_64 (31) = happyShift action_54
action_64 (35) = happyShift action_46
action_64 (43) = happyShift action_55
action_64 (44) = happyShift action_56
action_64 (45) = happyShift action_57
action_64 (48) = happyShift action_58
action_64 (49) = happyShift action_47
action_64 (50) = happyShift action_59
action_64 (6) = happyGoto action_50
action_64 (7) = happyGoto action_51
action_64 (8) = happyGoto action_121
action_64 (9) = happyGoto action_53
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (39) = happyReduce_46
action_65 _ = happyReduce_37

action_66 _ = happyReduce_48

action_67 (32) = happyShift action_94
action_67 _ = happyReduce_47

action_68 (32) = happyShift action_108
action_68 (34) = happyShift action_71
action_68 (35) = happyShift action_72
action_68 (36) = happyShift action_73
action_68 (37) = happyShift action_74
action_68 (38) = happyShift action_75
action_68 (40) = happyShift action_76
action_68 (41) = happyShift action_77
action_68 _ = happyReduce_45

action_69 (32) = happyShift action_120
action_69 (46) = happyShift action_63
action_69 (47) = happyShift action_64
action_69 _ = happyReduce_46

action_70 (29) = happyShift action_119
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (21) = happyShift action_44
action_71 (31) = happyShift action_45
action_71 (35) = happyShift action_46
action_71 (49) = happyShift action_47
action_71 (50) = happyShift action_48
action_71 (7) = happyGoto action_118
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (21) = happyShift action_44
action_72 (31) = happyShift action_45
action_72 (35) = happyShift action_46
action_72 (49) = happyShift action_47
action_72 (50) = happyShift action_48
action_72 (7) = happyGoto action_117
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (21) = happyShift action_44
action_73 (31) = happyShift action_45
action_73 (35) = happyShift action_46
action_73 (49) = happyShift action_47
action_73 (50) = happyShift action_48
action_73 (7) = happyGoto action_116
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (21) = happyShift action_44
action_74 (31) = happyShift action_45
action_74 (35) = happyShift action_46
action_74 (49) = happyShift action_47
action_74 (50) = happyShift action_48
action_74 (7) = happyGoto action_115
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (21) = happyShift action_44
action_75 (31) = happyShift action_45
action_75 (35) = happyShift action_46
action_75 (49) = happyShift action_47
action_75 (50) = happyShift action_48
action_75 (7) = happyGoto action_114
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (21) = happyShift action_44
action_76 (31) = happyShift action_45
action_76 (35) = happyShift action_46
action_76 (39) = happyShift action_113
action_76 (49) = happyShift action_47
action_76 (50) = happyShift action_48
action_76 (7) = happyGoto action_112
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (21) = happyShift action_44
action_77 (31) = happyShift action_45
action_77 (35) = happyShift action_46
action_77 (39) = happyShift action_111
action_77 (49) = happyShift action_47
action_77 (50) = happyShift action_48
action_77 (7) = happyGoto action_110
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (21) = happyShift action_44
action_78 (31) = happyShift action_45
action_78 (35) = happyShift action_46
action_78 (49) = happyShift action_47
action_78 (50) = happyShift action_48
action_78 (7) = happyGoto action_109
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_29

action_80 (32) = happyShift action_108
action_80 (34) = happyShift action_71
action_80 (35) = happyShift action_72
action_80 (36) = happyShift action_73
action_80 (37) = happyShift action_74
action_80 (38) = happyShift action_75
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (19) = happyShift action_16
action_81 (20) = happyShift action_17
action_81 (22) = happyShift action_18
action_81 (23) = happyShift action_19
action_81 (24) = happyShift action_20
action_81 (25) = happyShift action_21
action_81 (26) = happyShift action_22
action_81 (27) = happyShift action_23
action_81 (28) = happyShift action_24
action_81 (31) = happyShift action_25
action_81 (50) = happyShift action_26
action_81 (6) = happyGoto action_107
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (29) = happyShift action_106
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (33) = happyShift action_105
action_83 (34) = happyShift action_71
action_83 (35) = happyShift action_72
action_83 (36) = happyShift action_73
action_83 (37) = happyShift action_74
action_83 (38) = happyShift action_75
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (33) = happyShift action_104
action_84 (34) = happyShift action_71
action_84 (35) = happyShift action_72
action_84 (36) = happyShift action_73
action_84 (37) = happyShift action_74
action_84 (38) = happyShift action_75
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (32) = happyShift action_103
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (32) = happyShift action_102
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (33) = happyShift action_101
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (32) = happyShift action_100
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (33) = happyShift action_99
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (33) = happyShift action_98
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_51

action_92 _ = happyReduce_52

action_93 (30) = happyShift action_97
action_93 (42) = happyShift action_27
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_22

action_95 (42) = happyShift action_27
action_95 _ = happyReduce_1

action_96 _ = happyReduce_50

action_97 _ = happyReduce_20

action_98 (21) = happyShift action_44
action_98 (31) = happyShift action_45
action_98 (35) = happyShift action_46
action_98 (49) = happyShift action_47
action_98 (50) = happyShift action_48
action_98 (7) = happyGoto action_135
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (21) = happyShift action_44
action_99 (31) = happyShift action_45
action_99 (35) = happyShift action_46
action_99 (49) = happyShift action_47
action_99 (50) = happyShift action_48
action_99 (7) = happyGoto action_134
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_17

action_101 (19) = happyShift action_16
action_101 (20) = happyShift action_17
action_101 (22) = happyShift action_18
action_101 (23) = happyShift action_19
action_101 (24) = happyShift action_20
action_101 (25) = happyShift action_21
action_101 (26) = happyShift action_22
action_101 (27) = happyShift action_23
action_101 (28) = happyShift action_24
action_101 (31) = happyShift action_25
action_101 (50) = happyShift action_26
action_101 (6) = happyGoto action_133
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_15

action_103 _ = happyReduce_14

action_104 (19) = happyShift action_16
action_104 (20) = happyShift action_17
action_104 (22) = happyShift action_18
action_104 (23) = happyShift action_19
action_104 (24) = happyShift action_20
action_104 (25) = happyShift action_21
action_104 (26) = happyShift action_22
action_104 (27) = happyShift action_23
action_104 (28) = happyShift action_24
action_104 (31) = happyShift action_25
action_104 (50) = happyShift action_26
action_104 (6) = happyGoto action_132
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (19) = happyShift action_16
action_105 (20) = happyShift action_17
action_105 (22) = happyShift action_18
action_105 (23) = happyShift action_19
action_105 (24) = happyShift action_20
action_105 (25) = happyShift action_21
action_105 (26) = happyShift action_22
action_105 (27) = happyShift action_23
action_105 (28) = happyShift action_24
action_105 (31) = happyShift action_25
action_105 (50) = happyShift action_26
action_105 (6) = happyGoto action_131
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (13) = happyShift action_5
action_106 (14) = happyShift action_6
action_106 (15) = happyShift action_7
action_106 (16) = happyShift action_8
action_106 (17) = happyShift action_9
action_106 (50) = happyShift action_10
action_106 (5) = happyGoto action_130
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (32) = happyShift action_129
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_32

action_109 (33) = happyShift action_128
action_109 (34) = happyShift action_71
action_109 (35) = happyShift action_72
action_109 (36) = happyShift action_73
action_109 (37) = happyShift action_74
action_109 (38) = happyShift action_75
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (34) = happyShift action_71
action_110 (35) = happyShift action_72
action_110 (36) = happyShift action_73
action_110 (37) = happyShift action_74
action_110 (38) = happyShift action_75
action_110 _ = happyReduce_39

action_111 (21) = happyShift action_44
action_111 (31) = happyShift action_45
action_111 (35) = happyShift action_46
action_111 (49) = happyShift action_47
action_111 (50) = happyShift action_48
action_111 (7) = happyGoto action_127
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (34) = happyShift action_71
action_112 (35) = happyShift action_72
action_112 (36) = happyShift action_73
action_112 (37) = happyShift action_74
action_112 (38) = happyShift action_75
action_112 _ = happyReduce_38

action_113 (21) = happyShift action_44
action_113 (31) = happyShift action_45
action_113 (35) = happyShift action_46
action_113 (49) = happyShift action_47
action_113 (50) = happyShift action_48
action_113 (7) = happyGoto action_126
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_28

action_115 _ = happyReduce_26

action_116 _ = happyReduce_27

action_117 (36) = happyShift action_73
action_117 (37) = happyShift action_74
action_117 (38) = happyShift action_75
action_117 _ = happyReduce_25

action_118 (36) = happyShift action_73
action_118 (37) = happyShift action_74
action_118 (38) = happyShift action_75
action_118 _ = happyReduce_24

action_119 (13) = happyShift action_5
action_119 (14) = happyShift action_6
action_119 (15) = happyShift action_7
action_119 (16) = happyShift action_8
action_119 (17) = happyShift action_9
action_119 (50) = happyShift action_10
action_119 (5) = happyGoto action_125
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_44

action_121 (39) = happyReduce_46
action_121 _ = happyReduce_36

action_122 (39) = happyReduce_46
action_122 _ = happyReduce_35

action_123 (19) = happyShift action_16
action_123 (20) = happyShift action_17
action_123 (21) = happyShift action_44
action_123 (22) = happyShift action_18
action_123 (23) = happyShift action_19
action_123 (24) = happyShift action_20
action_123 (25) = happyShift action_21
action_123 (26) = happyShift action_22
action_123 (27) = happyShift action_23
action_123 (28) = happyShift action_24
action_123 (31) = happyShift action_54
action_123 (35) = happyShift action_46
action_123 (43) = happyShift action_55
action_123 (44) = happyShift action_56
action_123 (45) = happyShift action_57
action_123 (48) = happyShift action_58
action_123 (49) = happyShift action_47
action_123 (50) = happyShift action_59
action_123 (6) = happyGoto action_50
action_123 (7) = happyGoto action_51
action_123 (8) = happyGoto action_60
action_123 (9) = happyGoto action_124
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (39) = happyShift action_62
action_124 _ = happyReduce_43

action_125 (30) = happyShift action_143
action_125 (42) = happyShift action_27
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (34) = happyShift action_71
action_126 (35) = happyShift action_72
action_126 (36) = happyShift action_73
action_126 (37) = happyShift action_74
action_126 (38) = happyShift action_75
action_126 _ = happyReduce_40

action_127 (34) = happyShift action_71
action_127 (35) = happyShift action_72
action_127 (36) = happyShift action_73
action_127 (37) = happyShift action_74
action_127 (38) = happyShift action_75
action_127 _ = happyReduce_41

action_128 (21) = happyShift action_44
action_128 (31) = happyShift action_45
action_128 (35) = happyShift action_46
action_128 (49) = happyShift action_47
action_128 (50) = happyShift action_48
action_128 (7) = happyGoto action_142
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_23

action_130 (30) = happyShift action_141
action_130 (42) = happyShift action_27
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (32) = happyShift action_140
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (32) = happyShift action_139
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (32) = happyShift action_138
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (33) = happyShift action_137
action_134 (34) = happyShift action_71
action_134 (35) = happyShift action_72
action_134 (36) = happyShift action_73
action_134 (37) = happyShift action_74
action_134 (38) = happyShift action_75
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (32) = happyShift action_136
action_135 (34) = happyShift action_71
action_135 (35) = happyShift action_72
action_135 (36) = happyShift action_73
action_135 (37) = happyShift action_74
action_135 (38) = happyShift action_75
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_19

action_137 (21) = happyShift action_44
action_137 (31) = happyShift action_45
action_137 (35) = happyShift action_46
action_137 (49) = happyShift action_47
action_137 (50) = happyShift action_48
action_137 (7) = happyGoto action_146
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_16

action_139 _ = happyReduce_13

action_140 _ = happyReduce_12

action_141 _ = happyReduce_5

action_142 (32) = happyShift action_145
action_142 (34) = happyShift action_71
action_142 (35) = happyShift action_72
action_142 (36) = happyShift action_73
action_142 (37) = happyShift action_74
action_142 (38) = happyShift action_75
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (18) = happyShift action_144
action_143 _ = happyReduce_8

action_144 (29) = happyShift action_149
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (29) = happyShift action_148
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (33) = happyShift action_147
action_146 (34) = happyShift action_71
action_146 (35) = happyShift action_72
action_146 (36) = happyShift action_73
action_146 (37) = happyShift action_74
action_146 (38) = happyShift action_75
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (21) = happyShift action_44
action_147 (31) = happyShift action_45
action_147 (35) = happyShift action_46
action_147 (49) = happyShift action_47
action_147 (50) = happyShift action_48
action_147 (7) = happyGoto action_152
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (13) = happyShift action_5
action_148 (14) = happyShift action_6
action_148 (15) = happyShift action_7
action_148 (16) = happyShift action_8
action_148 (17) = happyShift action_9
action_148 (50) = happyShift action_10
action_148 (5) = happyGoto action_151
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (13) = happyShift action_5
action_149 (14) = happyShift action_6
action_149 (15) = happyShift action_7
action_149 (16) = happyShift action_8
action_149 (17) = happyShift action_9
action_149 (50) = happyShift action_10
action_149 (5) = happyGoto action_150
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (30) = happyShift action_155
action_150 (42) = happyShift action_27
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (30) = happyShift action_154
action_151 (42) = happyShift action_27
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (32) = happyShift action_153
action_152 (34) = happyShift action_71
action_152 (35) = happyShift action_72
action_152 (36) = happyShift action_73
action_152 (37) = happyShift action_74
action_152 (38) = happyShift action_75
action_152 _ = happyFail (happyExpListPerState 152)

action_153 _ = happyReduce_18

action_154 _ = happyReduce_6

action_155 _ = happyReduce_7

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Input happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (TExp happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Place happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn5
		 (NewLine
	)

happyReduce_5 = happyReduce 7 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Repeat happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 11 5 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (For happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 11 5 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IfElse happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 7 5 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  5 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 6 6 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Rotate happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 6 6 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Scale happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ReflectX happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 6 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ReflectY happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 6 6 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Conjugate happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 6 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Negate happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 10 6 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Subtile happy_var_3 happy_var_5 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 6 6 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Fill happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 6 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Build happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  6 happyReduction_21
happyReduction_21 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (TileVar happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  6 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 7 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Size happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Subtract happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Multiply happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (IntDiv happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  7 happyReduction_29
happyReduction_29 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Negative happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  7 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn7
		 (Int happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  7 happyReduction_31
happyReduction_31 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (NumVar happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  7 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  8 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn8
		 (TTrue
	)

happyReduce_34 = happySpecReduce_1  8 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn8
		 (TFalse
	)

happyReduce_35 = happySpecReduce_3  8 happyReduction_35
happyReduction_35 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (And happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  8 happyReduction_36
happyReduction_36 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Or happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  8 happyReduction_37
happyReduction_37 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Not happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  8 happyReduction_38
happyReduction_38 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (LessThan happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  8 happyReduction_39
happyReduction_39 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (GreaterThan happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happyReduce 4 8 happyReduction_40
happyReduction_40 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LessEqThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 4 8 happyReduction_41
happyReduction_41 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (GreaterEqThan happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_1  8 happyReduction_42
happyReduction_42 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (BoolVar happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happyReduce 4 8 happyReduction_43
happyReduction_43 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (EqualTo happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_3  8 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  9 happyReduction_45
happyReduction_45 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn9
		 (Num happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  9 happyReduction_46
happyReduction_46 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (Bool happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  9 happyReduction_47
happyReduction_47 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn9
		 (Tile happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  9 happyReduction_48
happyReduction_48 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn9
		 (UVar happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  10 happyReduction_49
happyReduction_49 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn10
		 (F happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  10 happyReduction_50
happyReduction_50 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn10
		 (X happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  11 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn11
		 (White
	)

happyReduce_52 = happySpecReduce_1  11 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn11
		 (Black
	)

happyNewToken action sts stk [] =
	action 53 53 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInput _ -> cont 12;
	TokenPlace _ -> cont 13;
	TokenNewLine _ -> cont 14;
	TokenRepeat _ -> cont 15;
	TokenFor _ -> cont 16;
	TokenIf _ -> cont 17;
	TokenElse _ -> cont 18;
	TokenRotate _ -> cont 19;
	TokenScale _ -> cont 20;
	TokenSize _ -> cont 21;
	TokenReflectX _ -> cont 22;
	TokenReflectY _ -> cont 23;
	TokenConjugate _ -> cont 24;
	TokenNegate _ -> cont 25;
	TokenSubtile _ -> cont 26;
	TokenFill _ -> cont 27;
	TokenBuild _ -> cont 28;
	TokenLeftCurly _ -> cont 29;
	TokenRightCurly _ -> cont 30;
	TokenLeftParen _ -> cont 31;
	TokenRightParen _ -> cont 32;
	TokenComma _ -> cont 33;
	TokenPlus _ -> cont 34;
	TokenMinus _ -> cont 35;
	TokenDivide _ -> cont 36;
	TokenMultiply _ -> cont 37;
	TokenMod _ -> cont 38;
	TokenEq _ -> cont 39;
	TokenLessThan _ -> cont 40;
	TokenGreaterThan _ -> cont 41;
	TokenSemiColon _ -> cont 42;
	TokenTilde _ -> cont 43;
	TokenTrue _ -> cont 44;
	TokenFalse _ -> cont 45;
	TokenAnd _ -> cont 46;
	TokenOr _ -> cont 47;
	TokenNot _ -> cont 48;
	TokenInt _ happy_dollar_dollar -> cont 49;
	TokenVar _ happy_dollar_dollar -> cont 50;
	TokenWhite _ -> cont 51;
	TokenBlack _ -> cont 52;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 53 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
