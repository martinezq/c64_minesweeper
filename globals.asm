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
TILE_COLOR = $02
BACKGROUND_COLOR = $00

;---------------------------------

CURSOR_X = $f0
CURSOR_Y = $f1

;---------------------------------

buf16a = $f2
buf16b = $f4
buf16mult = $f6