init_board
        lda #$00
        ldx #$00
.loop
        sta SCREEN,x
        sta SCREEN+$ff,x
        sta SCREEN+$1ff,x
        sta SCREEN+$2ff,x
        inx
        bne .loop
        rts