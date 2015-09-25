/* interpreter_b a self_hosted interpreter for brainfuck
   Copyright 2015 Quey_Liang Kao

   This program is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by the
   Free Software Foundation; either version 2 or (at your option) any
   later version

   This program is distributed in the hope that it will be useful
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE  See the
   GNU General Public License for more details

   You should have received a copy of the GNU General Public License
   along with this program; if not write to the Free Software
   Foundation 51 Franklin Street Fifth Floor Boston MA 02110_1301 USA*/

>>[>]

>[-]>[-]>[-]<<<
<[ at tail of code

--------------------------------------------------------------[
                                                            ++[
                                             +++++++++++++++[
                                           ++[
                                           --------------------------------------------------[
                                                                                           ++[
                                              +++++++++++++++++++++++++++++++++++++++++++++[
                                            ++[
                [-]
                >--------< 1 for comment
              ]0x2c
              >+<  9 for scan
            ]0x2e
            >+<  8 for print
          ]0x5b
          >+<  7 for while
        ]0x5d
        >+<  6 for endwhile
      ]0x2b
      >+<  5 for add
    ]0x2d
    >+<  4 for sub
  ]0x3c
  >+<  3 for left
]0x3e
>++< 2 for right
<
]

FIXME: remove comments
FIXME: set loop pair

>> at head of preprocessed code
three_blank_cursor move right

1st reg <<<[-]>>> 
2nd reg <<[-]>>
3rd blank(branch on break)  <[-]>
5_6th reg: the position of tape

         r1 r2 b3             b4 r5 r6
layout:  {} {} {} the pregram {} {} {} the tape

[ process each instruction <+>
 -[
   -[
     -[
       -[
         -[
           -[
             -[
               -[
                 -[
                    <-> should not be here
                    [-<<<+>>>]<<<+++++++++>>>
                 ]
                 <[- 0x2c scan 
                    >>[>]>> at r6
                    on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 >,<
                    < on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-]
                    <<[<]<
                    <<+++++++++>>
                 ]>
               ] 
               <[- 0x2e print
                  >>[>]>> at r6
                  on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 >.<
                  < on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-]
                  <<[<]<
                  <<++++++++>>
               ]>
             ] 
             <[- 0x5b while: set r2 if zero / jump if r2 
                 >>[>]>> at r6
                 on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 

                     >[ if not zero
                       << on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-] 
                       <<[<]< on b3 <->
                       >>[>]>> 
                       on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 >
                       [-<+>]
                     ]
                  <[->+<] at empty r6

                 < on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-]
                 <<[<]< at b3 <+>

                 <<+++++++>>
                 < at r2[-
                     set b3 loop count >+<
                     > at b3 [ >> at next inst; set now break <+>
                  r1 r2 b3 now  v        
layout:  inst before {} {} {}  i0 i1 i2 
                         -------[ 
                                  +[ others
                                     [-<<<+>>>]<<<++++++>>>
                                     <->
                                  ]
                                  < now [- following endwhiles
                                      <-> decrease loop count; continue if zero
                                      <<++++++>>
                                  ]>
                         ]
                         < now [- following whiles
                             <+> increase loop count
                             <<+++++>>
                         ]>
                         << [->+<] > b3: move next
                     ] b3 < 
                 ] r2 > 
             ]>
           ] 
           <[- 0x5d endwhile: go check and jmp if not zero
              <<++++++>>
           ]>
         ] 
         <[- 0x2b add
            >>[>]>> at r6
                     b4 r5 r6
layout:  the pregram {} {} {} the tape
            on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 >+<
            < on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-]
            <<[<]<
            <<+++++>>
         ]>
       ] 
       <[- 0x2d sub
          >>[>]>> at r6
          on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 >-<
          < on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-]
          <<[<]<
          <<++++>>
       ]>
     ] 
     <[- 0x3c left
        >>[>]>>
        -
        <<<[<]<
        <<+++>>
     ]>
   ] 
   <[- 0x3e right
      >>[>]>>
      +
      <<<[<]<
      <<++>>
   ]>
 ] comments
 <[- 
    <<+>>
 ]>
> next inst ] at b4

.>.>.> at r6
.>.>.>
