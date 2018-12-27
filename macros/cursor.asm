!macro setAtCursor .val {
        +set16 buf16a, SCREEN   ; store address of the SCREEN memory in buf16a
        +set16 buf16b, 0040 

        lda CURSOR_X
        +add16a buf16a

        lda CURSOR_Y
        +mult16a buf16b

        +add16v buf16a, buf16b

        ldy #$00
        lda .val
        sta (buf16a),y
}