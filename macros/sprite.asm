!macro SET_SPRITE0_POS .PTRX, .PTRY {
        lda .PTRX
        asl
        asl
        asl
        bcs .opt2
        adc #24
        bcs .opt3
    .opt1 
        sta $d000
        lda #%00000000
        sta $d010 
        jmp .update_y
    .opt2
        adc #23
    .opt3
        sta $d000
        lda #%00000001
        sta $d010           ; sprites x position additional bit

    .update_y
        lda .PTRY
        asl
        asl
        asl
        adc #50
        sta $d001           ; sprite 0 y (50 - 242)
}
