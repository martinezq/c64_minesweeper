cursor_press
            +setAtCursor $01
            rts

cursor_up   
            lda cursor_y
            cmp #$00        ; check Y-coord whether we are too high
            beq skip        ; if top of screen reached, skip
            dec cursor_y       ; decrease y-coord for sprite 1
            rts

cursor_down             
            lda cursor_y       ; increase y-coord for sprite 1
            cmp #24        ; check Y-coord whether whether we are too low
            beq skip        ; if bottom of border was reached, skip
            inc cursor_y
            rts

cursor_left             
            lda cursor_x
            cmp #$00        
            beq skip        
            dec cursor_x       
            rts

cursor_right            
            lda cursor_x
            cmp #39        
            beq skip        
            inc cursor_x       
            rts