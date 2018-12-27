!macro INIT_SCREEN {
        lda $dd00
        and #%11111100
        ora #%00000010
        sta $dd00           ; vicII mem from $4000

        lda $d018
        and #%11110001      ; char mem $4800
        ora #%00010010      ; screen mem $4400
        sta $d018

        lda #BACKGROUND_COLOR 
        sta $d020           ; border color

        lda #BACKGROUND_COLOR
        sta $d021           ; background color

        lda #$00
        sta SPRITE_POINTERS ; sprite 0 pointer

        lda #$ff
        sta $d015           ; show all sprites

        lda #CURSOR_COLOR
        sta $d027           ; sprite 0 white

        lda #TILE_COLOR
        ldx #$00
        
    .update_color:   
        sta $d800,x
        sta $d900,x
        sta $da00,x
        sta $db00,x
        inx
        bne .update_color

        lda #0
        sta CURSOR_X
        lda #0
        sta CURSOR_Y
}