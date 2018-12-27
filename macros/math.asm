!macro add16a .PTR {
        clc
        adc .PTR
        sta .PTR

        lda .PTR+1
        adc #0
        sta .PTR+1
}

!macro add16v .PTR, .SPTR {
        clc
        lda .SPTR
        adc .PTR
        sta .PTR
        lda .SPTR+1
        adc .PTR+1
        sta .PTR+1
}

!macro mult16a .PTR {
    tax
    .check_zero
        cmp #$00
        bne .check_one
        +reset16 .PTR
        jmp .end
    .check_one
        txa
        cmp #$01
        beq .end
    .mult
        dex
        +copy16 buf16mult, .PTR
    .loop
        +add16v .PTR, buf16mult
        dex
        cpx #$00
        bne .loop
    .end
}
