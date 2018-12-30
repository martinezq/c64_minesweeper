!macro CURSOR_UP {   
        lda CURSOR_Y
        cmp #$00
        beq .skip
        dec CURSOR_Y
        +UPDATE_CURSOR_PTR
        +READ_CURSOR_VAL
    .skip
}

!macro CURSOR_DOWN {   
        lda CURSOR_Y
        cmp #24
        beq .skip
        inc CURSOR_Y
        +UPDATE_CURSOR_PTR
        +READ_CURSOR_VAL
    .skip
}

!macro CURSOR_LEFT {   
        lda CURSOR_X
        cmp #$00        
        beq .skip        
        dec CURSOR_X
        +UPDATE_CURSOR_PTR
        +READ_CURSOR_VAL       
    .skip
}

!macro CURSOR_RIGHT {   
        lda CURSOR_X
        cmp #39        
        beq .skip        
        inc CURSOR_X
        +UPDATE_CURSOR_PTR
        +READ_CURSOR_VAL
    .skip
}

!macro MOVE_CURSOR .X, .Y {
        lda #.X
        sta CURSOR_X
        lda #.Y
        sta CURSOR_Y
        +UPDATE_CURSOR_PTR
        +READ_CURSOR_VAL
}

!macro MOVE_CURSOR_XY {
        txa
        sta CURSOR_X
        tya
        sta CURSOR_Y
        +UPDATE_CURSOR_PTR
        +READ_CURSOR_VAL
}

!macro UPDATE_CURSOR_PTR {
        +PUSH_REGS
        +SET_16 buf16a, SCREEN   ; store address of the SCREEN memory in buf16a
        +SET_16 buf16b, 0040 

        lda CURSOR_X
        +ADD_16_A buf16a

        lda CURSOR_Y
        +MULT_16_A buf16b

        +ADD_16_V buf16a, buf16b
        +COPY_16 CURSOR_PTR16, buf16a
        +POP_REGS
}

!macro SET_AT_CURSOR .val {
        tya
        pha
        ldy #$00
        lda #.val
        sta (CURSOR_PTR16),y
        sta CURSOR_VAL
        pla
        tay
}

!macro INC_AT_CURSOR {
        tya
        pha
        ldy #$00
        lda (CURSOR_PTR16),y
        adc #$01
        sta (CURSOR_PTR16),y
        sta CURSOR_VAL
        pla
        tay
}

!macro TOGGLE_AT_CURSOR {
        tya
        pha
        ldy #$00
        lda (CURSOR_PTR16),y
        eor #%00010000           ; toggle bit
        sta (CURSOR_PTR16),y
        sta CURSOR_VAL
        pla
        tay
}

!macro UNCOVER_AT_CURSOR {
        tya
        pha
        ldy #$00
        lda (CURSOR_PTR16),y
        cmp #CHAR_COVER_OFFSET
        bcc .skip
        sbc #CHAR_COVER_OFFSET
        sta (CURSOR_PTR16),y
        sta CURSOR_VAL
    .skip
        pla
        tay
}

!macro READ_CURSOR_VAL {
        tya
        pha
        ldy #$00
        lda (CURSOR_PTR16),y
        sta CURSOR_VAL
        pla
        tay
}

!macro CURSOR_PRESS {
    +UNCOVER_AT_CURSOR
}
            