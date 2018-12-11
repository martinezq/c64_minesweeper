init_screen:
    lda $dd00
    and #%11111100
    ora #%00000010
    sta $dd00           ; vicII mem from $4000

    lda $d018
    and #%11110001      ; char mem $4800
    ora #%00010010      ; screen mem $4400
    sta $d018

    lda #background_color 
    sta $d020           ; border color

    lda #background_color
    sta $d021           ; background color

    lda #$00
    sta SPRITE_POINTERS ; sprite 0 pointer

    lda #$ff
    sta $d015           ; show all sprites

    lda #cursor_color
    sta $d027           ; sprite 0 white

    lda #tile_color
    ldx #$00
 .update_color:   
    sta $d800,x
    sta $d900,x
    sta $da00,x
    sta $db00,x
    inx
    bne .update_color

    lda #0
    sta cursor_x
    lda #0
    sta cursor_y

    rts

update_screen:
update_x:
    lda cursor_x
    asl
    asl
    asl
    bcs opt2
    adc #24
    bcs opt3
opt1: 
    sta $d000
    lda #%00000000
    sta $d010 
    jmp update_y
opt2:
    adc #23
opt3:
    sta $d000
    lda #%00000001
    sta $d010           ; sprites x position additional bit

update_y:
    lda cursor_y
    asl
    asl
    asl
    adc #50
    sta $d001           ; sprite 0 y (50 - 242)

    rts