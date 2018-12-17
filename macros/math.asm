!macro add16 .ptr16,.val8 {
    !set lo = .ptr16
    !set hi = .ptr16+1
    
    pha
    
    lda lo
    clc
    adc #(.val8)
    sta lo

    lda hi
    adc #0          ; use carry from previous operation
    sta hi
    
    pla
}

!macro add16a .ptr16 {
    !set lo = .ptr16
    !set hi = .ptr16+1
    
    pha
    
    clc
    adc lo
    sta lo

    lda hi
    adc #0
    sta hi
    
    pla
}