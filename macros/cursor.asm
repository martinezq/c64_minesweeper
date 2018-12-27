!macro setAtCursor .val {
        +SET_16 buf16a, SCREEN   ; store address of the SCREEN memory in buf16a
        +SET_16 buf16b, 0040 

        lda CURSOR_X
        +ADD_16_A buf16a

        lda CURSOR_Y
        +MULT_16_A buf16b

        +ADD_16_V buf16a, buf16b

        ldy #$00
        lda .val
        sta (buf16a),y
}