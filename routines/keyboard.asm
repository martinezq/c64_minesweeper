
pra  =  $dc00            ; CIA#1 (Port Register A)
prb  =  $dc01            ; CIA#1 (Port Register B)

ddra =  $dc02            ; CIA#1 (Data Direction Register A)
ddrb =  $dc03            ; CIA#1 (Data Direction Register B)


check_keyboard              
                        lda #%11111111  ; CIA#1 Port A set to output 
                        sta ddra             
                        lda #%00000000  ; CIA#1 Port B set to inputt
                        sta ddrb             
            
check_space             lda #%01111111  ; select row 8
                        sta pra 
                        lda prb         ; load column information
                        and #%00010000  ; test 'space' key to exit 
                        beq cursor_press

check_s                 lda #%11111101  ; select row 2
                        sta pra 
                        lda prb         ; load column information
                        and #%00100000  ; test 's' key  
                        beq cursor_down

check_w                 lda #%11111101  ; select row 2
                        sta pra 
                        lda prb         ; load column information
                        and #%00000010  ; test 'w' key 
                        beq cursor_up    

check_a                 lda #%11111101  ; select row 2
                        sta pra 
                        lda prb         ; load column information
                        and #%00000100  ; test 'a' key 
                        beq cursor_left 

check_d                 lda #%11111011  ; select row 3
                        sta pra 
                        lda prb         ; load column information
                        and #%00000100  ; test 'd' key 
                        beq cursor_right
                        
                        rts             ; return 

skip                    rts              ; don't change Y-Coordinate