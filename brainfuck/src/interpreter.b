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

>[>]

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
                >--------<
              ]0x2c
              >+<
            ]0x2e
            >+<
          ]0x5b
          >+<
        ]0x5d
        >+<
      ]0x2b
      >+<
    ]0x2d
    >+<
  ]0x3c
  >+<
]0x3e
>++.< 
<
]

>> at head of preprocessed code
[[<+>-]>]
<<[<]> at head of preprocessed code

[ process each instruction
-[
  -[
    -[
      -[
        -[
          -[
            -[
              -[
                -[
                ] 0x2c scan
                >[>]> move to c0
                [ >>[-<<<+>>>] <[->+<] <[->+<] >->+< ] ready
                >>,< 
                [ <[-<+>] >[-<+>] <<<[->>>+<<<] >>-<+> ] back to c1
                < to c0 <<[<]
                <+>
              ] 0x2e print
              <-[>
                >[>]> move to c0
                [ >>[-<<<+>>>] <[->+<] <[->+<] >->+< ] ready
                >>.< 
                [ <[-<+>] >[-<+>] <<<[->>>+<<<] >>-<+> ] back to c1
                < to c0 <<[<]
                <]
              +>
              <+>
            ] 0x5b ???
            <+>
          ] 0x5d ???
          <+>
        ] 0x2b add 2 
        >[>]> move to c0
        [ >>[-<<<+>>>] <[->+<] <[->+<] >->+< ] ready
        >>++< 
        [ <[-<+>] >[-<+>] <<<[->>>+<<<] >>-<+> ] back to c1
        < to c0 <<[<]
        <+>
      ] 0x2d dec and inc c0      
      >[>]> move to c0
      [ >>[-<<<+>>>] <[->+<] <[->+<] >->+< ] ready
      >>-< 
      [ <[-<+>] >[-<+>] <<<[->>>+<<<] >>-<+> ] back to c1
      < to c0 + <<[<]
      <+>
    ] 0x3c sub 2 c0
    >[>]> -- <<[<]
    <+>
  ] 0x3e inc c0
  >[>]> + <<[<]
  <+>
] comments
<+>
> next inst ] leave if null encounter
