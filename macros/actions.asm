!macro CURSOR_UP {   
        lda CURSOR_Y
        cmp #$00
        beq .skip
        dec CURSOR_Y
    .skip
}

!macro CURSOR_DOWN {   
        lda CURSOR_Y
        cmp #24
        beq .skip
        inc CURSOR_Y
    .skip
}

!macro CURSOR_LEFT {   
        lda CURSOR_X
        cmp #$00        
        beq .skip        
        dec CURSOR_X       
    .skip
}

!macro CURSOR_RIGHT {   
        lda CURSOR_X
        cmp #39        
        beq .skip        
        inc CURSOR_X       
    .skip
}

!macro CURSOR_PRESS {
        +SET_16 buf16a, SCREEN   ; store address of the SCREEN memory in buf16a
        +SET_16 buf16b, 0040 

        lda CURSOR_X
        +ADD_16_A buf16a

        lda CURSOR_Y
        +MULT_16_A buf16b

        +ADD_16_V buf16a, buf16b

        ldy #$00
        lda (buf16a),y
        eor #%00010000           ; toggle bit
        sta (buf16a),y
}
            