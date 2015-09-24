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
2nd reg set to 255 supporting 240 level neted loops <<[-]-->>
3rd branch_on_break <[-]>

[ process each instruction <+> branch
 -[
   -[
     -[
       -[
         -[
           -[
             -[
               -[
                 -[
                 ]
                 <[- 0x2c scan 
                    <<+++++++++>>
                 ]>
               ] 
               <[- 0x2e print
                  <<++++++++>>
               ]>
             ] 
             <[- 0x5b while
                <[->+<]>-
                [-<+<+>>]
             ]>
           ] 
           <[- 0x5d endwhile
              <[->+<]>
              [-<+<+>>]<+>
           ]>
         ] 
         <[- 0x2b add
            <<+++++>>
         ]>
       ] 
       <[- 0x2d sub
          <<++++>>
       ]>
     ] 
     <[- 0x3c left
        <<+++>>
     ]>
   ] 
   <[- 0x3e right
      <<++>>
   ]>
 ] comments
 <[- 
    <<+>>
 ]>
<<[->+<]>> move loop counter
> next inst ] leave if null encounter

<[-]<[-]<[-]<[[->+<]<]>> at the head of program
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
                    <-> clear b3 so that a anchor is set
                    >>[>]>> at r6 
                    on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 >
                    if zero set r2 
                       [
                          
                       ]
                    
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
                  on r6 [>[-<<<+>>>]<[->+<]<[->+<]>+>-] at empty r6 ><
                  < on r5 [[-<+>]>[-<+>]<<<[->>>+<<<]>>+<-]
                  <<[<]<
                  <<++++++++>>
               ]>
             ] 
no here
             <[- 0x5b while
                <[->+<]>-
                [-<+<+>>]
             ]>
           ] 
           <[- 0x5d endwhile
              <[->+<]>
              [-<+<+>>]<+>
           ]>
no here
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
.>.>.>.>.>.>.>.>.>.>.>
