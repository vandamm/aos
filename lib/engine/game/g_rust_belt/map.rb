# frozen_string_literal: true

module Engine
  module Game
    module GRustBelt
      module Map
        TILES = {
          '7' => 7,
          '8' => 55,
          '9' => 48,
          '16' => 3,
          '17' => 1,
          '18' => 1,
          '19' => 4,
          '20' => 4,
          '21' => 1,
          '22' => 1,
        }.freeze

        LOCATION_NAMES = {
          'A21' => 'Cansas City',
          'B6' => 'Minneapolis',
          'C1' => 'Duluth',
          'C15' => 'Des Moines',
          'E7' => 'La Crosse',
          'F14' => 'Rook Island',
          'F20' => 'St. Louis',
          'G17' => 'Springfield',
          'H4' => 'Green Bay',
          'H8' => 'Milwaukee',
          'H12' => 'Chicago',
          'I17' => 'Terre Haute',
          'J12' => 'Michigan City',
          'J20' => 'Evansville',
          'K7' => 'Grand Rapids',
          'K17' => 'Indianapolis',
          'L14' => 'Fort Wayne',
          'M11' => 'Toledo',
          'M17' => 'Cincinnati',
          'N8' => 'Detroit',
          'N20' => 'Lexington',
          'P10' => 'Cleveland',
          'Q3' => 'Toronto',
          'Q17' => 'Wheeling',
          'R6' => 'Buffalo',
          'R12' => 'Pittsburgh',
        }.freeze

        HEXES = {
          white: {
            %w[
              A1 A3 A5 A7 A9 A11 A13 A15 A17 A19
              B2 B4 B8 B10 B12 B14 B16 B18 B20
              C3 C5 C7 C9 C11 C13 C17 C19 C21
              D4 D6 D8 D10 D12 D14 D16 D18 D20
              E3 E5 E9 E19 E21
              F2 F4 F6 F8 F10 F12 F16 F18
              G1 G3 G5 G7 G9 G11 G13 G15
              H2 H6 H10 H14 H16 H18 H20
              I1 I13 I15 I19 I21
              J14 J16 J18
              K3 K5 K9 K11 K13 K15 K19
              L4 L6 L8 L10 L12 L16 L18
              M7 M9 M13 M15 M21
              N12 N14 N16
              O3 O5 O7 O11 O13 O15 O19
              P2 P4 P6 P12 P14 P16 P18
              Q1 Q9 Q11
              R2 R8
            ] => '',
            ['A21'] => 'frame=color:#723F6F;city=revenue:0;path=a:3,b:_0;path=a:4,b:_0',
            ['B6'] => 'frame=color:#1188B2;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['C15'] => 'frame=color:#1188B2;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['C1'] => 'frame=color:#723F6F;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0',
            ['F20'] => 'frame=color:#B90B1C;city=revenue:0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['H12'] => 'frame=color:#B90B1C;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:5,b:_0',
            ['J20'] => 'frame=color:#1188B2;city=revenue:0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['M17'] => 'frame=color:#1188B2;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['N8'] => 'frame=color:#B90B1C;city=revenue:0;path=a:1,b:_0;path=a:2,b:_0;path=a:4,b:_0',
            ['Q3'] => 'frame=color:#E48F13;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
            ['Q17'] => 'frame=color:#E48F13;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            ['R12'] => 'frame=color:#B90B1C;city=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0',
            %w[E7 F14 G17 H4 H8 I17 J12 K7 K17 L14 M11 N20 P10 R6] => 'town=revenue:0',
            %w[C7 D8 E9 E11 E13 E15 E17 F18 G19 G21 K21 L20 M19 N18 O17 P16 Q5 Q13 Q15] => 'upgrade=cost:20,terrain:river',
            %w[O21 P20 Q19 Q21 R10 R14 R16 R18 R20] => 'upgrade=cost:40,terrain:mountain',
          },
          blue: {
            %w[D2 E1 I3 I5 I7 I9 I11 J2 J4 J6 J8 J10 K1 L2 M1 M3 M5 N2 N4 N6 N10 O1 O9 P8 Q7 R4] => '',
          }
        }.freeze

        # Purple: #723F6F
        # Blue: #1188B2
        # Red: #B90B1C
        # Yellow: #E48F13
        # Black: #000000

        LAYOUT = :flat
      end
    end
  end
end
