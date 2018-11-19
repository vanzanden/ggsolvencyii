## GNU General Public License version 3 , see file LICENCE ============== =====
##
##    sourcefile of package 'ggsolvencyii'
##    Copyright (C) <2018>  < Marco van Zanden , git@vanzanden.nl >
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.
##
##
## test ================================================================= =====
library(ggsolvencyii)
context("sii_debug_geom")

    testdata <- sii_z_ex1_data$description  ; td <- testdata
    teststructure <- sii_structure_sf16_eng ; ts <- teststructure # default value
    testsuffix <- "other"                   ; tt <- testsuffix #"test text"
    testlevelmaxA <- 99                     ; tla <- testlevelmaxA
    testlevelmaxB <- sii_levelmax_sf16_993  ; tlb <- testlevelmaxB
    testplotdetails <- sii_plotdetails_sf16 ; tp <- testplotdetails
    testfill <- sii_x_fillcolors_sf16_eng   ; tf <- testfill
    testcolor <- sii_x_edgecolors_sf16_eng  ; te <- testcolor



testresult_01 <- sii_debug_geom(td, ts, tt,  tla   , tp, tf, te); expected_d_01 <- 7; expected_l_01 <- 3
testresult_02 <- sii_debug_geom(td, ts, tt,     tlb, tp, tf, te); expected_d_02 <- 7; expected_l_02 <- 4
testresult_03 <- sii_debug_geom(td, ts, tt,  tla   , tp, tf,   ); expected_d_03 <- 6; expected_l_03 <- 3
testresult_04 <- sii_debug_geom(td, ts, tt,     tlb, tp, tf,   ); expected_d_04 <- 6; expected_l_04 <- 4
testresult_05 <- sii_debug_geom(td, ts, tt,  tla   , tp,   , te); expected_d_05 <- 6; expected_l_05 <- 3
## -----
testresult_06 <- sii_debug_geom(td, ts, tt,     tlb, tp,   , te); expected_d_06 <- 6; expected_l_06 <- 4
testresult_07 <- sii_debug_geom(td, ts, tt,  tla   , tp,   ,   ); expected_d_07 <- 5; expected_l_07 <- 3
testresult_08 <- sii_debug_geom(td, ts, tt,     tlb, tp,   ,   ); expected_d_08 <- 5; expected_l_08 <- 4
testresult_09 <- sii_debug_geom(td, ts, tt,  tla   ,   , tf, te); expected_d_09 <- 6; expected_l_09 <- 2
testresult_10 <- sii_debug_geom(td, ts, tt,     tlb,   , tf, te); expected_d_10 <- 6; expected_l_10 <- 3
testresult_11 <- sii_debug_geom(td, ts, tt,  tla   ,   , tf,   ); expected_d_11 <- 5; expected_l_11 <- 2
testresult_12 <- sii_debug_geom(td, ts, tt,     tlb,   , tf,   ); expected_d_12 <- 5; expected_l_12 <- 3
testresult_13 <- sii_debug_geom(td, ts, tt,  tla   ,   ,   , te); expected_d_13 <- 5; expected_l_13 <- 2
testresult_14 <- sii_debug_geom(td, ts, tt,     tlb,   ,   , te); expected_d_14 <- 5; expected_l_14 <- 3
testresult_15 <- sii_debug_geom(td, ts, tt,  tla   ,   ,   ,   ); expected_d_15 <- 4; expected_l_15 <- 2
testresult_16 <- sii_debug_geom(td, ts, tt,     tlb,   ,   ,   ); expected_d_16 <- 4; expected_l_16 <- 3
testresult_17 <- sii_debug_geom(td, ts, tt,       , tp, tf, te); expected_d_17 <- 7; expected_l_17 <- 3
testresult_18 <- sii_debug_geom(td, ts, tt,       , tp, tf, te); expected_d_18 <- 7; expected_l_18 <- 3
testresult_19 <- sii_debug_geom(td, ts, tt,       , tp, tf,   ); expected_d_19 <- 6; expected_l_19 <- 3
testresult_20 <- sii_debug_geom(td, ts, tt,       , tp, tf,   ); expected_d_20 <- 6; expected_l_20 <- 3
testresult_21 <- sii_debug_geom(td, ts, tt,       , tp,   , te); expected_d_21 <- 6; expected_l_21 <- 3
testresult_22 <- sii_debug_geom(td, ts, tt,       , tp,   , te); expected_d_22 <- 6; expected_l_22 <- 3
testresult_23 <- sii_debug_geom(td, ts, tt,       , tp,   ,   ); expected_d_23 <- 5; expected_l_23 <- 3
testresult_24 <- sii_debug_geom(td, ts, tt,       , tp,   ,   ); expected_d_24 <- 5; expected_l_24 <- 3
testresult_25 <- sii_debug_geom(td, ts, tt,       ,   , tf, te); expected_d_25 <- 6; expected_l_25 <- 2
testresult_26 <- sii_debug_geom(td, ts, tt,       ,   , tf, te); expected_d_26 <- 6; expected_l_26 <- 2
testresult_27 <- sii_debug_geom(td, ts, tt,       ,   , tf,   ); expected_d_27 <- 5; expected_l_27 <- 2
testresult_28 <- sii_debug_geom(td, ts, tt,       ,   , tf,   ); expected_d_28 <- 5; expected_l_28 <- 2
testresult_29 <- sii_debug_geom(td, ts, tt,       ,   ,   , te); expected_d_29 <- 5; expected_l_29 <- 2
testresult_30 <- sii_debug_geom(td, ts, tt,       ,   ,   , te); expected_d_30 <- 5; expected_l_30 <- 2
testresult_31 <- sii_debug_geom(td, ts, tt,       ,   ,   ,   ); expected_d_31 <- 4; expected_l_31 <- 2
testresult_32 <- sii_debug_geom(td, ts, tt,       ,   ,   ,   ); expected_d_32 <- 4; expected_l_32 <- 2
testresult_33 <- sii_debug_geom(td, ts,   ,  tla   , tp, tf, te); expected_d_33 <- 7; expected_l_33 <- 3
testresult_34 <- sii_debug_geom(td, ts,   ,     tlb, tp, tf, te); expected_d_34 <- 7; expected_l_34 <- 4
testresult_35 <- sii_debug_geom(td, ts,   ,  tla   , tp, tf,   ); expected_d_35 <- 6; expected_l_35 <- 3
testresult_36 <- sii_debug_geom(td, ts,   ,     tlb, tp, tf,   ); expected_d_36 <- 6; expected_l_36 <- 4
testresult_37 <- sii_debug_geom(td, ts,   ,  tla   , tp,   , te); expected_d_37 <- 6; expected_l_37 <- 3
testresult_38 <- sii_debug_geom(td, ts,   ,     tlb, tp,   , te); expected_d_38 <- 6; expected_l_38 <- 4
testresult_39 <- sii_debug_geom(td, ts,   ,  tla   , tp,   ,   ); expected_d_39 <- 5; expected_l_39 <- 3
testresult_40 <- sii_debug_geom(td, ts,   ,     tlb, tp,   ,   ); expected_d_40 <- 5; expected_l_40 <- 4
testresult_41 <- sii_debug_geom(td, ts,   ,  tla   ,   , tf, te); expected_d_41 <- 6; expected_l_41 <- 2
testresult_42 <- sii_debug_geom(td, ts,   ,     tlb,   , tf, te); expected_d_42 <- 6; expected_l_42 <- 3
testresult_43 <- sii_debug_geom(td, ts,   ,  tla   ,   , tf,   ); expected_d_43 <- 5; expected_l_43 <- 2
testresult_44 <- sii_debug_geom(td, ts,   ,     tlb,   , tf,   ); expected_d_44 <- 5; expected_l_44 <- 3
testresult_45 <- sii_debug_geom(td, ts,   ,  tla   ,   ,   , te); expected_d_45 <- 5; expected_l_45 <- 2
testresult_46 <- sii_debug_geom(td, ts,   ,     tlb,   ,   , te); expected_d_46 <- 5; expected_l_46 <- 3
testresult_47 <- sii_debug_geom(td, ts,   ,  tla   ,   ,   ,   ); expected_d_47 <- 4; expected_l_47 <- 2
testresult_48 <- sii_debug_geom(td, ts,   ,     tlb,   ,   ,   ); expected_d_48 <- 4; expected_l_48 <- 3
testresult_49 <- sii_debug_geom(td, ts,   ,       , tp, tf, te); expected_d_49 <- 7; expected_l_49 <- 3
testresult_50 <- sii_debug_geom(td, ts,   ,       , tp, tf, te); expected_d_50 <- 7; expected_l_50 <- 3
testresult_51 <- sii_debug_geom(td, ts,   ,       , tp, tf,   ); expected_d_51 <- 6; expected_l_51 <- 3
testresult_52 <- sii_debug_geom(td, ts,   ,       , tp, tf,   ); expected_d_52 <- 6; expected_l_52 <- 3
testresult_53 <- sii_debug_geom(td, ts,   ,       , tp,   , te); expected_d_53 <- 6; expected_l_53 <- 3
testresult_54 <- sii_debug_geom(td, ts,   ,       , tp,   , te); expected_d_54 <- 6; expected_l_54 <- 3
testresult_55 <- sii_debug_geom(td, ts,   ,       , tp,   ,   ); expected_d_55 <- 5; expected_l_55 <- 3
testresult_56 <- sii_debug_geom(td, ts,   ,       , tp,   ,   ); expected_d_56 <- 5; expected_l_56 <- 3
testresult_57 <- sii_debug_geom(td, ts,   ,       ,   , tf, te); expected_d_57 <- 6; expected_l_57 <- 2
testresult_58 <- sii_debug_geom(td, ts,   ,       ,   , tf, te); expected_d_58 <- 6; expected_l_58 <- 2
testresult_59 <- sii_debug_geom(td, ts,   ,       ,   , tf,   ); expected_d_59 <- 5; expected_l_59 <- 2
testresult_60 <- sii_debug_geom(td, ts,   ,       ,   , tf,   ); expected_d_60 <- 5; expected_l_60 <- 2
testresult_61 <- sii_debug_geom(td, ts,   ,       ,   ,   , te); expected_d_61 <- 5; expected_l_61 <- 2
testresult_62 <- sii_debug_geom(td, ts,   ,       ,   ,   , te); expected_d_62 <- 5; expected_l_62 <- 2
testresult_63 <- sii_debug_geom(td, ts,   ,       ,   ,   ,   ); expected_d_63 <- 4; expected_l_63 <- 2
testresult_64 <- sii_debug_geom(td, ts,   ,       ,   ,   ,   ); expected_d_64 <- 4; expected_l_64 <- 2
testresult_65 <- sii_debug_geom(td,   , tt,  tla   , tp, tf, te); expected_d_65 <- 7; expected_l_65 <- 3
testresult_66 <- sii_debug_geom(td,   , tt,     tlb, tp, tf, te); expected_d_66 <- 7; expected_l_66 <- 4
testresult_67 <- sii_debug_geom(td,   , tt,  tla   , tp, tf,   ); expected_d_67 <- 6; expected_l_67 <- 3
testresult_68 <- sii_debug_geom(td,   , tt,     tlb, tp, tf,   ); expected_d_68 <- 6; expected_l_68 <- 4
testresult_69 <- sii_debug_geom(td,   , tt,  tla   , tp,   , te); expected_d_69 <- 6; expected_l_69 <- 3
testresult_70 <- sii_debug_geom(td,   , tt,     tlb, tp,   , te); expected_d_70 <- 6; expected_l_70 <- 4
testresult_71 <- sii_debug_geom(td,   , tt,  tla   , tp,   ,   ); expected_d_71 <- 5; expected_l_71 <- 3
testresult_72 <- sii_debug_geom(td,   , tt,     tlb, tp,   ,   ); expected_d_72 <- 5; expected_l_72 <- 4
testresult_73 <- sii_debug_geom(td,   , tt,  tla   ,   , tf, te); expected_d_73 <- 6; expected_l_73 <- 2
testresult_74 <- sii_debug_geom(td,   , tt,     tlb,   , tf, te); expected_d_74 <- 6; expected_l_74 <- 3
testresult_75 <- sii_debug_geom(td,   , tt,  tla   ,   , tf,   ); expected_d_75 <- 5; expected_l_75 <- 2
testresult_76 <- sii_debug_geom(td,   , tt,     tlb,   , tf,   ); expected_d_76 <- 5; expected_l_76 <- 3
testresult_77 <- sii_debug_geom(td,   , tt,  tla   ,   ,   , te); expected_d_77 <- 5; expected_l_77 <- 2
testresult_78 <- sii_debug_geom(td,   , tt,     tlb,   ,   , te); expected_d_78 <- 5; expected_l_78 <- 3
testresult_79 <- sii_debug_geom(td,   , tt,  tla   ,   ,   ,   ); expected_d_79 <- 4; expected_l_79 <- 2
testresult_80 <- sii_debug_geom(td,   , tt,     tlb,   ,   ,   ); expected_d_80 <- 4; expected_l_80 <- 3
testresult_81 <- sii_debug_geom(td,   , tt,       , tp, tf, te); expected_d_81 <- 7; expected_l_81 <- 3
testresult_82 <- sii_debug_geom(td,   , tt,       , tp, tf, te); expected_d_82 <- 7; expected_l_82 <- 3
testresult_83 <- sii_debug_geom(td,   , tt,       , tp, tf,   ); expected_d_83 <- 6; expected_l_83 <- 3
testresult_84 <- sii_debug_geom(td,   , tt,       , tp, tf,   ); expected_d_84 <- 6; expected_l_84 <- 3
testresult_85 <- sii_debug_geom(td,   , tt,       , tp,   , te); expected_d_85 <- 6; expected_l_85 <- 3
testresult_86 <- sii_debug_geom(td,   , tt,       , tp,   , te); expected_d_86 <- 6; expected_l_86 <- 3
testresult_87 <- sii_debug_geom(td,   , tt,       , tp,   ,   ); expected_d_87 <- 5; expected_l_87 <- 3
testresult_88 <- sii_debug_geom(td,   , tt,       , tp,   ,   ); expected_d_88 <- 5; expected_l_88 <- 3
testresult_89 <- sii_debug_geom(td,   , tt,       ,   , tf, te); expected_d_89 <- 6; expected_l_89 <- 2
testresult_90 <- sii_debug_geom(td,   , tt,       ,   , tf, te); expected_d_90 <- 6; expected_l_90 <- 2
testresult_91 <- sii_debug_geom(td,   , tt,       ,   , tf,   ); expected_d_91 <- 5; expected_l_91 <- 2
testresult_92 <- sii_debug_geom(td,   , tt,       ,   , tf,   ); expected_d_92 <- 5; expected_l_92 <- 2
testresult_93 <- sii_debug_geom(td,   , tt,       ,   ,   , te); expected_d_93 <- 5; expected_l_93 <- 2
testresult_94 <- sii_debug_geom(td,   , tt,       ,   ,   , te); expected_d_94 <- 5; expected_l_94 <- 2
testresult_95 <- sii_debug_geom(td,   , tt,       ,   ,   ,   ); expected_d_95 <- 4; expected_l_95 <- 2
testresult_96 <- sii_debug_geom(td,   , tt,       ,   ,   ,   ); expected_d_96 <- 4; expected_l_96 <- 2
testresult_97 <- sii_debug_geom(td,   ,   ,  tla   , tp, tf, te); expected_d_97 <- 7; expected_l_97 <- 3
testresult_98 <- sii_debug_geom(td,   ,   ,     tlb, tp, tf, te); expected_d_98 <- 7; expected_l_98 <- 4
testresult_99 <- sii_debug_geom(td,   ,   ,  tla   , tp, tf,   ); expected_d_99 <- 6; expected_l_99 <- 3
testresult_100 <- sii_debug_geom(td,   ,   ,     tlb, tp, tf,   ); expected_d_100 <- 6; expected_l_100 <- 4
testresult_101 <- sii_debug_geom(td,   ,   ,  tla   , tp,   , te); expected_d_101 <- 6; expected_l_101 <- 3
testresult_102 <- sii_debug_geom(td,   ,   ,     tlb, tp,   , te); expected_d_102 <- 6; expected_l_102 <- 4
testresult_103 <- sii_debug_geom(td,   ,   ,  tla   , tp,   ,   ); expected_d_103 <- 5; expected_l_103 <- 3
testresult_104 <- sii_debug_geom(td,   ,   ,     tlb, tp,   ,   ); expected_d_104 <- 5; expected_l_104 <- 4
testresult_105 <- sii_debug_geom(td,   ,   ,  tla   ,   , tf, te); expected_d_105 <- 6; expected_l_105 <- 2
testresult_106 <- sii_debug_geom(td,   ,   ,     tlb,   , tf, te); expected_d_106 <- 6; expected_l_106 <- 3
testresult_107 <- sii_debug_geom(td,   ,   ,  tla   ,   , tf,   ); expected_d_107 <- 5; expected_l_107 <- 2
testresult_108 <- sii_debug_geom(td,   ,   ,     tlb,   , tf,   ); expected_d_108 <- 5; expected_l_108 <- 3
testresult_109 <- sii_debug_geom(td,   ,   ,  tla   ,   ,   , te); expected_d_109 <- 5; expected_l_109 <- 2
testresult_110 <- sii_debug_geom(td,   ,   ,     tlb,   ,   , te); expected_d_110 <- 5; expected_l_110 <- 3
testresult_111 <- sii_debug_geom(td,   ,   ,  tla   ,   ,   ,   ); expected_d_111 <- 4; expected_l_111 <- 2
testresult_112 <- sii_debug_geom(td,   ,   ,     tlb,   ,   ,   ); expected_d_112 <- 4; expected_l_112 <- 3
testresult_113 <- sii_debug_geom(td,   ,   ,       , tp, tf, te); expected_d_113 <- 7; expected_l_113 <- 3
testresult_114 <- sii_debug_geom(td,   ,   ,       , tp, tf, te); expected_d_114 <- 7; expected_l_114 <- 3
testresult_115 <- sii_debug_geom(td,   ,   ,       , tp, tf,   ); expected_d_115 <- 6; expected_l_115 <- 3
testresult_116 <- sii_debug_geom(td,   ,   ,       , tp, tf,   ); expected_d_116 <- 6; expected_l_116 <- 3
testresult_117 <- sii_debug_geom(td,   ,   ,       , tp,   , te); expected_d_117 <- 6; expected_l_117 <- 3
testresult_118 <- sii_debug_geom(td,   ,   ,       , tp,   , te); expected_d_118 <- 6; expected_l_118 <- 3
testresult_119 <- sii_debug_geom(td,   ,   ,       , tp,   ,   ); expected_d_119 <- 5; expected_l_119 <- 3
testresult_120 <- sii_debug_geom(td,   ,   ,       , tp,   ,   ); expected_d_120 <- 5; expected_l_120 <- 3
testresult_121 <- sii_debug_geom(td,   ,   ,       ,   , tf, te); expected_d_121 <- 6; expected_l_121 <- 2
testresult_122 <- sii_debug_geom(td,   ,   ,       ,   , tf, te); expected_d_122 <- 6; expected_l_122 <- 2
testresult_123 <- sii_debug_geom(td,   ,   ,       ,   , tf,   ); expected_d_123 <- 5; expected_l_123 <- 2
testresult_124 <- sii_debug_geom(td,   ,   ,       ,   , tf,   ); expected_d_124 <- 5; expected_l_124 <- 2
testresult_125 <- sii_debug_geom(td,   ,   ,       ,   ,   , te); expected_d_125 <- 5; expected_l_125 <- 2
testresult_126 <- sii_debug_geom(td,   ,   ,       ,   ,   , te); expected_d_126 <- 5; expected_l_126 <- 2
testresult_127 <- sii_debug_geom(td,   ,   ,       ,   ,   ,   ); expected_d_127 <- 4; expected_l_127 <- 2
testresult_128 <- sii_debug_geom(td,   ,   ,       ,   ,   ,   ); expected_d_128 <- 4; expected_l_128 <- 2

## ----
test_that("sii_debug_geom" ,{
expect_equal(dim(testresult_01$debug_description)[2], expected_d_01) ;   expect_equal(dim(testresult_01$debug_level)[2], expected_l_01)
expect_equal(dim(testresult_02$debug_description)[2], expected_d_02) ;   expect_equal(dim(testresult_02$debug_level)[2], expected_l_02)
expect_equal(dim(testresult_03$debug_description)[2], expected_d_03) ;   expect_equal(dim(testresult_03$debug_level)[2], expected_l_03)
expect_equal(dim(testresult_04$debug_description)[2], expected_d_04) ;   expect_equal(dim(testresult_04$debug_level)[2], expected_l_04)
expect_equal(dim(testresult_05$debug_description)[2], expected_d_05) ;   expect_equal(dim(testresult_05$debug_level)[2], expected_l_05)
expect_equal(dim(testresult_06$debug_description)[2], expected_d_06) ;   expect_equal(dim(testresult_06$debug_level)[2], expected_l_06)
expect_equal(dim(testresult_07$debug_description)[2], expected_d_07) ;   expect_equal(dim(testresult_07$debug_level)[2], expected_l_07)
expect_equal(dim(testresult_08$debug_description)[2], expected_d_08) ;   expect_equal(dim(testresult_08$debug_level)[2], expected_l_08)
expect_equal(dim(testresult_09$debug_description)[2], expected_d_09) ;   expect_equal(dim(testresult_09$debug_level)[2], expected_l_09)
expect_equal(dim(testresult_10$debug_description)[2], expected_d_10) ;   expect_equal(dim(testresult_10$debug_level)[2], expected_l_10)
expect_equal(dim(testresult_11$debug_description)[2], expected_d_11) ;   expect_equal(dim(testresult_11$debug_level)[2], expected_l_11)
expect_equal(dim(testresult_12$debug_description)[2], expected_d_12) ;   expect_equal(dim(testresult_12$debug_level)[2], expected_l_12)
expect_equal(dim(testresult_13$debug_description)[2], expected_d_13) ;   expect_equal(dim(testresult_13$debug_level)[2], expected_l_13)
expect_equal(dim(testresult_14$debug_description)[2], expected_d_14) ;   expect_equal(dim(testresult_14$debug_level)[2], expected_l_14)
expect_equal(dim(testresult_15$debug_description)[2], expected_d_15) ;   expect_equal(dim(testresult_15$debug_level)[2], expected_l_15)
expect_equal(dim(testresult_16$debug_description)[2], expected_d_16) ;   expect_equal(dim(testresult_16$debug_level)[2], expected_l_16)
expect_equal(dim(testresult_17$debug_description)[2], expected_d_17) ;   expect_equal(dim(testresult_17$debug_level)[2], expected_l_17)
expect_equal(dim(testresult_18$debug_description)[2], expected_d_18) ;   expect_equal(dim(testresult_18$debug_level)[2], expected_l_18)
expect_equal(dim(testresult_19$debug_description)[2], expected_d_19) ;   expect_equal(dim(testresult_19$debug_level)[2], expected_l_19)
expect_equal(dim(testresult_20$debug_description)[2], expected_d_20) ;   expect_equal(dim(testresult_20$debug_level)[2], expected_l_20)
expect_equal(dim(testresult_21$debug_description)[2], expected_d_21) ;   expect_equal(dim(testresult_21$debug_level)[2], expected_l_21)
expect_equal(dim(testresult_22$debug_description)[2], expected_d_22) ;   expect_equal(dim(testresult_22$debug_level)[2], expected_l_22)
expect_equal(dim(testresult_23$debug_description)[2], expected_d_23) ;   expect_equal(dim(testresult_23$debug_level)[2], expected_l_23)
expect_equal(dim(testresult_24$debug_description)[2], expected_d_24) ;   expect_equal(dim(testresult_24$debug_level)[2], expected_l_24)
expect_equal(dim(testresult_25$debug_description)[2], expected_d_25) ;   expect_equal(dim(testresult_25$debug_level)[2], expected_l_25)
expect_equal(dim(testresult_26$debug_description)[2], expected_d_26) ;   expect_equal(dim(testresult_26$debug_level)[2], expected_l_26)
expect_equal(dim(testresult_27$debug_description)[2], expected_d_27) ;   expect_equal(dim(testresult_27$debug_level)[2], expected_l_27)
expect_equal(dim(testresult_28$debug_description)[2], expected_d_28) ;   expect_equal(dim(testresult_28$debug_level)[2], expected_l_28)
expect_equal(dim(testresult_29$debug_description)[2], expected_d_29) ;   expect_equal(dim(testresult_29$debug_level)[2], expected_l_29)
expect_equal(dim(testresult_30$debug_description)[2], expected_d_30) ;   expect_equal(dim(testresult_30$debug_level)[2], expected_l_30)
expect_equal(dim(testresult_31$debug_description)[2], expected_d_31) ;   expect_equal(dim(testresult_31$debug_level)[2], expected_l_31)
expect_equal(dim(testresult_32$debug_description)[2], expected_d_32) ;   expect_equal(dim(testresult_32$debug_level)[2], expected_l_32)
expect_equal(dim(testresult_33$debug_description)[2], expected_d_33) ;   expect_equal(dim(testresult_33$debug_level)[2], expected_l_33)
expect_equal(dim(testresult_34$debug_description)[2], expected_d_34) ;   expect_equal(dim(testresult_34$debug_level)[2], expected_l_34)
expect_equal(dim(testresult_35$debug_description)[2], expected_d_35) ;   expect_equal(dim(testresult_35$debug_level)[2], expected_l_35)
expect_equal(dim(testresult_36$debug_description)[2], expected_d_36) ;   expect_equal(dim(testresult_36$debug_level)[2], expected_l_36)
expect_equal(dim(testresult_37$debug_description)[2], expected_d_37) ;   expect_equal(dim(testresult_37$debug_level)[2], expected_l_37)
expect_equal(dim(testresult_38$debug_description)[2], expected_d_38) ;   expect_equal(dim(testresult_38$debug_level)[2], expected_l_38)
expect_equal(dim(testresult_39$debug_description)[2], expected_d_39) ;   expect_equal(dim(testresult_39$debug_level)[2], expected_l_39)
expect_equal(dim(testresult_40$debug_description)[2], expected_d_40) ;   expect_equal(dim(testresult_40$debug_level)[2], expected_l_40)
expect_equal(dim(testresult_41$debug_description)[2], expected_d_41) ;   expect_equal(dim(testresult_41$debug_level)[2], expected_l_41)
expect_equal(dim(testresult_42$debug_description)[2], expected_d_42) ;   expect_equal(dim(testresult_42$debug_level)[2], expected_l_42)
expect_equal(dim(testresult_43$debug_description)[2], expected_d_43) ;   expect_equal(dim(testresult_43$debug_level)[2], expected_l_43)
expect_equal(dim(testresult_44$debug_description)[2], expected_d_44) ;   expect_equal(dim(testresult_44$debug_level)[2], expected_l_44)
expect_equal(dim(testresult_45$debug_description)[2], expected_d_45) ;   expect_equal(dim(testresult_45$debug_level)[2], expected_l_45)
expect_equal(dim(testresult_46$debug_description)[2], expected_d_46) ;   expect_equal(dim(testresult_46$debug_level)[2], expected_l_46)
expect_equal(dim(testresult_47$debug_description)[2], expected_d_47) ;   expect_equal(dim(testresult_47$debug_level)[2], expected_l_47)
expect_equal(dim(testresult_48$debug_description)[2], expected_d_48) ;   expect_equal(dim(testresult_48$debug_level)[2], expected_l_48)
expect_equal(dim(testresult_49$debug_description)[2], expected_d_49) ;   expect_equal(dim(testresult_49$debug_level)[2], expected_l_49)
expect_equal(dim(testresult_50$debug_description)[2], expected_d_50) ;   expect_equal(dim(testresult_50$debug_level)[2], expected_l_50)
expect_equal(dim(testresult_51$debug_description)[2], expected_d_51) ;   expect_equal(dim(testresult_51$debug_level)[2], expected_l_51)
expect_equal(dim(testresult_52$debug_description)[2], expected_d_52) ;   expect_equal(dim(testresult_52$debug_level)[2], expected_l_52)
expect_equal(dim(testresult_53$debug_description)[2], expected_d_53) ;   expect_equal(dim(testresult_53$debug_level)[2], expected_l_53)
expect_equal(dim(testresult_54$debug_description)[2], expected_d_54) ;   expect_equal(dim(testresult_54$debug_level)[2], expected_l_54)
expect_equal(dim(testresult_55$debug_description)[2], expected_d_55) ;   expect_equal(dim(testresult_55$debug_level)[2], expected_l_55)
expect_equal(dim(testresult_56$debug_description)[2], expected_d_56) ;   expect_equal(dim(testresult_56$debug_level)[2], expected_l_56)
expect_equal(dim(testresult_57$debug_description)[2], expected_d_57) ;   expect_equal(dim(testresult_57$debug_level)[2], expected_l_57)
expect_equal(dim(testresult_58$debug_description)[2], expected_d_58) ;   expect_equal(dim(testresult_58$debug_level)[2], expected_l_58)
expect_equal(dim(testresult_59$debug_description)[2], expected_d_59) ;   expect_equal(dim(testresult_59$debug_level)[2], expected_l_59)
expect_equal(dim(testresult_60$debug_description)[2], expected_d_60) ;   expect_equal(dim(testresult_60$debug_level)[2], expected_l_60)
expect_equal(dim(testresult_61$debug_description)[2], expected_d_61) ;   expect_equal(dim(testresult_61$debug_level)[2], expected_l_61)
expect_equal(dim(testresult_62$debug_description)[2], expected_d_62) ;   expect_equal(dim(testresult_62$debug_level)[2], expected_l_62)
expect_equal(dim(testresult_63$debug_description)[2], expected_d_63) ;   expect_equal(dim(testresult_63$debug_level)[2], expected_l_63)
expect_equal(dim(testresult_64$debug_description)[2], expected_d_64) ;   expect_equal(dim(testresult_64$debug_level)[2], expected_l_64)
expect_equal(dim(testresult_65$debug_description)[2], expected_d_65) ;   expect_equal(dim(testresult_65$debug_level)[2], expected_l_65)
expect_equal(dim(testresult_66$debug_description)[2], expected_d_66) ;   expect_equal(dim(testresult_66$debug_level)[2], expected_l_66)
expect_equal(dim(testresult_67$debug_description)[2], expected_d_67) ;   expect_equal(dim(testresult_67$debug_level)[2], expected_l_67)
expect_equal(dim(testresult_68$debug_description)[2], expected_d_68) ;   expect_equal(dim(testresult_68$debug_level)[2], expected_l_68)
expect_equal(dim(testresult_69$debug_description)[2], expected_d_69) ;   expect_equal(dim(testresult_69$debug_level)[2], expected_l_69)
expect_equal(dim(testresult_70$debug_description)[2], expected_d_70) ;   expect_equal(dim(testresult_70$debug_level)[2], expected_l_70)
expect_equal(dim(testresult_71$debug_description)[2], expected_d_71) ;   expect_equal(dim(testresult_71$debug_level)[2], expected_l_71)
expect_equal(dim(testresult_72$debug_description)[2], expected_d_72) ;   expect_equal(dim(testresult_72$debug_level)[2], expected_l_72)
expect_equal(dim(testresult_73$debug_description)[2], expected_d_73) ;   expect_equal(dim(testresult_73$debug_level)[2], expected_l_73)
expect_equal(dim(testresult_74$debug_description)[2], expected_d_74) ;   expect_equal(dim(testresult_74$debug_level)[2], expected_l_74)
expect_equal(dim(testresult_75$debug_description)[2], expected_d_75) ;   expect_equal(dim(testresult_75$debug_level)[2], expected_l_75)
expect_equal(dim(testresult_76$debug_description)[2], expected_d_76) ;   expect_equal(dim(testresult_76$debug_level)[2], expected_l_76)
expect_equal(dim(testresult_77$debug_description)[2], expected_d_77) ;   expect_equal(dim(testresult_77$debug_level)[2], expected_l_77)
expect_equal(dim(testresult_78$debug_description)[2], expected_d_78) ;   expect_equal(dim(testresult_78$debug_level)[2], expected_l_78)
expect_equal(dim(testresult_79$debug_description)[2], expected_d_79) ;   expect_equal(dim(testresult_79$debug_level)[2], expected_l_79)
expect_equal(dim(testresult_80$debug_description)[2], expected_d_80) ;   expect_equal(dim(testresult_80$debug_level)[2], expected_l_80)
expect_equal(dim(testresult_81$debug_description)[2], expected_d_81) ;   expect_equal(dim(testresult_81$debug_level)[2], expected_l_81)
expect_equal(dim(testresult_82$debug_description)[2], expected_d_82) ;   expect_equal(dim(testresult_82$debug_level)[2], expected_l_82)
expect_equal(dim(testresult_83$debug_description)[2], expected_d_83) ;   expect_equal(dim(testresult_83$debug_level)[2], expected_l_83)
expect_equal(dim(testresult_84$debug_description)[2], expected_d_84) ;   expect_equal(dim(testresult_84$debug_level)[2], expected_l_84)
expect_equal(dim(testresult_85$debug_description)[2], expected_d_85) ;   expect_equal(dim(testresult_85$debug_level)[2], expected_l_85)
expect_equal(dim(testresult_86$debug_description)[2], expected_d_86) ;   expect_equal(dim(testresult_86$debug_level)[2], expected_l_86)
expect_equal(dim(testresult_87$debug_description)[2], expected_d_87) ;   expect_equal(dim(testresult_87$debug_level)[2], expected_l_87)
expect_equal(dim(testresult_88$debug_description)[2], expected_d_88) ;   expect_equal(dim(testresult_88$debug_level)[2], expected_l_88)
expect_equal(dim(testresult_89$debug_description)[2], expected_d_89) ;   expect_equal(dim(testresult_89$debug_level)[2], expected_l_89)
expect_equal(dim(testresult_90$debug_description)[2], expected_d_90) ;   expect_equal(dim(testresult_90$debug_level)[2], expected_l_90)
expect_equal(dim(testresult_91$debug_description)[2], expected_d_91) ;   expect_equal(dim(testresult_91$debug_level)[2], expected_l_91)
expect_equal(dim(testresult_92$debug_description)[2], expected_d_92) ;   expect_equal(dim(testresult_92$debug_level)[2], expected_l_92)
expect_equal(dim(testresult_93$debug_description)[2], expected_d_93) ;   expect_equal(dim(testresult_93$debug_level)[2], expected_l_93)
expect_equal(dim(testresult_94$debug_description)[2], expected_d_94) ;   expect_equal(dim(testresult_94$debug_level)[2], expected_l_94)
expect_equal(dim(testresult_95$debug_description)[2], expected_d_95) ;   expect_equal(dim(testresult_95$debug_level)[2], expected_l_95)
expect_equal(dim(testresult_96$debug_description)[2], expected_d_96) ;   expect_equal(dim(testresult_96$debug_level)[2], expected_l_96)
expect_equal(dim(testresult_97$debug_description)[2], expected_d_97) ;   expect_equal(dim(testresult_97$debug_level)[2], expected_l_97)
expect_equal(dim(testresult_98$debug_description)[2], expected_d_98) ;   expect_equal(dim(testresult_98$debug_level)[2], expected_l_98)
expect_equal(dim(testresult_99$debug_description)[2], expected_d_99) ;   expect_equal(dim(testresult_99$debug_level)[2], expected_l_99)
expect_equal(dim(testresult_100$debug_description)[2], expected_d_100) ;   expect_equal(dim(testresult_100$debug_level)[2], expected_l_100)
expect_equal(dim(testresult_101$debug_description)[2], expected_d_101) ;   expect_equal(dim(testresult_101$debug_level)[2], expected_l_101)
expect_equal(dim(testresult_102$debug_description)[2], expected_d_102) ;   expect_equal(dim(testresult_102$debug_level)[2], expected_l_102)
expect_equal(dim(testresult_103$debug_description)[2], expected_d_103) ;   expect_equal(dim(testresult_103$debug_level)[2], expected_l_103)
expect_equal(dim(testresult_104$debug_description)[2], expected_d_104) ;   expect_equal(dim(testresult_104$debug_level)[2], expected_l_104)
expect_equal(dim(testresult_105$debug_description)[2], expected_d_105) ;   expect_equal(dim(testresult_105$debug_level)[2], expected_l_105)
expect_equal(dim(testresult_106$debug_description)[2], expected_d_106) ;   expect_equal(dim(testresult_106$debug_level)[2], expected_l_106)
expect_equal(dim(testresult_107$debug_description)[2], expected_d_107) ;   expect_equal(dim(testresult_107$debug_level)[2], expected_l_107)
expect_equal(dim(testresult_108$debug_description)[2], expected_d_108) ;   expect_equal(dim(testresult_108$debug_level)[2], expected_l_108)
expect_equal(dim(testresult_109$debug_description)[2], expected_d_109) ;   expect_equal(dim(testresult_109$debug_level)[2], expected_l_109)
expect_equal(dim(testresult_110$debug_description)[2], expected_d_110) ;   expect_equal(dim(testresult_110$debug_level)[2], expected_l_110)
expect_equal(dim(testresult_111$debug_description)[2], expected_d_111) ;   expect_equal(dim(testresult_111$debug_level)[2], expected_l_111)
expect_equal(dim(testresult_112$debug_description)[2], expected_d_112) ;   expect_equal(dim(testresult_112$debug_level)[2], expected_l_112)
expect_equal(dim(testresult_113$debug_description)[2], expected_d_113) ;   expect_equal(dim(testresult_113$debug_level)[2], expected_l_113)
expect_equal(dim(testresult_114$debug_description)[2], expected_d_114) ;   expect_equal(dim(testresult_114$debug_level)[2], expected_l_114)
expect_equal(dim(testresult_115$debug_description)[2], expected_d_115) ;   expect_equal(dim(testresult_115$debug_level)[2], expected_l_115)
expect_equal(dim(testresult_116$debug_description)[2], expected_d_116) ;   expect_equal(dim(testresult_116$debug_level)[2], expected_l_116)
expect_equal(dim(testresult_117$debug_description)[2], expected_d_117) ;   expect_equal(dim(testresult_117$debug_level)[2], expected_l_117)
expect_equal(dim(testresult_118$debug_description)[2], expected_d_118) ;   expect_equal(dim(testresult_118$debug_level)[2], expected_l_118)
expect_equal(dim(testresult_119$debug_description)[2], expected_d_119) ;   expect_equal(dim(testresult_119$debug_level)[2], expected_l_119)
expect_equal(dim(testresult_120$debug_description)[2], expected_d_120) ;   expect_equal(dim(testresult_120$debug_level)[2], expected_l_120)
expect_equal(dim(testresult_121$debug_description)[2], expected_d_121) ;   expect_equal(dim(testresult_121$debug_level)[2], expected_l_121)
expect_equal(dim(testresult_122$debug_description)[2], expected_d_122) ;   expect_equal(dim(testresult_122$debug_level)[2], expected_l_122)
expect_equal(dim(testresult_123$debug_description)[2], expected_d_123) ;   expect_equal(dim(testresult_123$debug_level)[2], expected_l_123)
expect_equal(dim(testresult_124$debug_description)[2], expected_d_124) ;   expect_equal(dim(testresult_124$debug_level)[2], expected_l_124)
expect_equal(dim(testresult_125$debug_description)[2], expected_d_125) ;   expect_equal(dim(testresult_125$debug_level)[2], expected_l_125)
expect_equal(dim(testresult_126$debug_description)[2], expected_d_126) ;   expect_equal(dim(testresult_126$debug_level)[2], expected_l_126)
expect_equal(dim(testresult_127$debug_description)[2], expected_d_127) ;   expect_equal(dim(testresult_127$debug_level)[2], expected_l_127)
expect_equal(dim(testresult_128$debug_description)[2], expected_d_128) ;   expect_equal(dim(testresult_128$debug_level)[2], expected_l_128)
})
