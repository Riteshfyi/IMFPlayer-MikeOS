	
	%INCLUDE "mikedev.inc"
	
	ORG 32768


     
      
START:	    
     mov si, msg          ;importing the file 
     
     call os_print_string
                
     call os_file_selector		; Get filename

	 mov bx, ax 
    
    
    
    mov ax, bx
	mov cx, 36864			; Load  at  (4K after program start)
	call os_load_file
	
	
	
	   
  mov si, 0                    ;earlier implemented audio player
    L1: 
        mov dx, 388h  
		mov al, [si+music+0]
		call os_port_byte_out 
		mov dx, 389h
		mov al, [si+music+1]
	    call os_port_byte_out
		mov bx, [si+ music +2]
	    add si, 4   

        delay:	           
            mov cx,500 
            l2: loop l2
            dec bx
        jg delay 

 
        cmp si,size
    jb L1   

   call os_clear_screen
    ret
    	   
	        
 
msg db 'Select Audio',0

music dw 36864
size dw 9999
