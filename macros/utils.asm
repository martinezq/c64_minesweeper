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

!macro INIT_RND {
        lda #$ff        ; maximum frequency value
        sta $d40e       ; voice 3 frequency low byte
        sta $d40f       ; voice 3 frequency high byte
        lda #$80        ; noise waveform, gate bit off
        sta $d412       ; voice 3 control register
}

!macro RND {
        lda $d41b       ; get random value from 0-255
}