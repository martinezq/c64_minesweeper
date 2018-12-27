!macro INIT_BOARD {
        ldx #$00
    .loop
        +FIELD
        sta SCREEN,x
        +FIELD
        sta SCREEN+$ff,x
        +FIELD
        sta SCREEN+$1ff,x
        +FIELD
        sta SCREEN+$2ff,x
        inx
        bne .loop
}

!macro FIELD {
        +RND
        and #%10000101
        bne .zero
        lda #CHAR_BOMB
        jmp .end
    .zero    
        lda #CHAR_00
    .end
}