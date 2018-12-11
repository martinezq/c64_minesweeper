counter = $fa ; a zeropage address to be used as a counter

loop:
        lda #$00    ; reset
        sta counter ; counter

        sei         ; enable interrupts

loop1:  lda #$fb  ; wait for vertical retrace
loop2:  cmp $d012 ; until it reaches 251th raster line ($fb)
        bne loop2 ; which is out of the inner screen area

        inc counter ; increase frame counter
        lda counter ; check if counter
        cmp #05
        bne out

        lda #$00    ; reset
        sta counter ; counter

        jsr check_keyboard
        jsr update_screen

out:
        lda $d012 ; make sure we reached
loop3:  cmp $d012 ; the next raster line so next time we
        beq loop3 ; should catch the same line next frame

        jmp loop1 ; jump to main loop