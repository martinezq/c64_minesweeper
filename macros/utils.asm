!macro RESET_16 PTR {
        lda #$00
        sta PTR
        sta PTR+1
}

!macro SET_16 PTR, VAL {
        lda #<VAL      ; low byte
        sta PTR
        lda #>VAL      ; high byte
        sta PTR+1
}

!macro COPY_16 PTR, SPTR {
        lda SPTR
        sta PTR
        lda SPTR+1
        sta PTR+1
}