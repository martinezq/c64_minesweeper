VIC_MEM = $4000

SCREEN = VIC_MEM + $400
CHARACTER = VIC_MEM + $800
SPRITE_FRAMES = VIC_MEM
SPRITE_POINTERS = SCREEN + $03f8

;---------------------------------

PORT_REG_A  =  $dc00            ; CIA#1 (Port Register A)
PORT_REG_B  =  $dc01            ; CIA#1 (Port Register B)

DATA_DIR_REG_A =  $dc02         ; CIA#1 (Data Direction Register A)
DATA_DIR_REG_B =  $dc03         ; CIA#1 (Data Direction Register B)

;---------------------------------

CURSOR_COLOR = $01
TILE_COLOR = $04
BACKGROUND_COLOR = $00

;---------------------------------

CURSOR_X = $a0
CURSOR_Y = $a1
CURSOR_PTR16 = $a2
CURSOR_VAL = $a4

;---------------------------------

buf8a = $b0
buf8b = buf8a + 1

buf16a = buf8b + 1
buf16b = buf16a + 2
buf16mult = buf16b + 2