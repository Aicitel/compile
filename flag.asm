.386
.8087
.MODEL flat, stdcall

include c:\masm32\include\msvcrt.inc
includelib c:\masm32\lib\msvcrt.lib

.data
	numFmt db '%d',0
	chaFmt db '%c',0
	floFmt db '%lf',0
	spaFmt db ' ',0
	entFmt db '---',0
	FLOAT_TEMP dd 0
	BUFFER_  dword 0,0,0,0
	BUFFER_F REAL8 0.0
	szFmt db '%d, ', 0
	F_EAX REAL8 0.0
	F_EBX REAL8 0.0
	F_ECX REAL8 0.0
	F_EDX REAL8 0.0
	F_EDI REAL8 0.0
	F_ESI REAL8 0.0
	M1	REAL8 +3.0
	M2	REAL8 3.0
.code

inputnum proc
	invoke crt_scanf, addr numFmt,addr BUFFER_
	mov eax,BUFFER_[0]
	ret 
inputnum endp

inputcha proc
	invoke crt_scanf, addr chaFmt,addr BUFFER_
	mov eax,BUFFER_[0]
	ret 
inputcha endp

inputflo proc
	invoke crt_scanf, addr floFmt,addr BUFFER_F
	finit
	fld BUFFER_F
	fstp F_EAX
	ret 
inputflo endp

printspace proc
	invoke crt_printf, addr spaFmt
	ret
printspace endp

printnum proc num
	invoke crt_printf, addr numFmt, num
	ret
printnum endp

printcha proc char
	invoke crt_printf, addr chaFmt, char
	ret
printcha endp

printflo proc float:REAL8
	invoke crt_printf, addr floFmt, float
	ret
printflo endp

print proc arr, len
	mov edi, arr								;把数组起始地址给一个寄存器
    mov ecx, len								;把数组元素数(将要反复的次数)给 ECX
    xor eax, eax
 Lp:
    mov  eax, [edi]								;edi 中的地址将不断变化, 通过 [edi] 获取元素值
	push ecx
	push edi
	invoke crt_printf, addr szFmt, eax
	pop edi
	pop ecx
    add  edi, type arr								;获取下一个元素的地址
    loop Lp
	;invoke crt_printf, addr entFmt
	ret
print endp

bo_div proc des,sou
	mov eax,des
	push edx
	mov edx,0
	idiv sou
	pop edx
	ret
bo_div endp

f_add proc f1:REAL8, f2:REAL8
	finit
	fld	f1
	fld	f2
	fadd	;add and pop (f1+f2)
	fstp F_EAX
	ret
f_add endp

f_sub proc f1:REAL8, f2:REAL8
	finit
	fld	f1
	fld	f2
	fsub	;add and pop (f1-f2)
	fstp F_EAX
	ret
f_sub endp

f_imul proc f1:REAL8, f2:REAL8
	finit
	fld	f1
	fld	f2
	fmul	;add and pop (f1*f2)
	fstp F_EAX
	ret
f_imul endp

f_idiv proc f1:REAL8, f2:REAL8
	finit
	fld	f1
	fld	f2
	fdiv	;add and pop (f1/f2)
	fstp F_EAX
	ret
f_idiv endp

float2num proc f:REAL8 
	finit
	fld	f
	fistp	FLOAT_TEMP
	mov eax,FLOAT_TEMP
	ret
float2num endp

num2float proc n
	push eax
	mov eax,n
	mov FLOAT_TEMP,eax
	
	finit
	fild	FLOAT_TEMP
	fstp	F_EAX
	pop eax
	ret
num2float endp

f_BE proc f1:REAL8, f2:REAL8
	push ebx
	mov ebx,0
	fld	f1
	fcomp f2
	fstsw ax
	sahf
	jc @F
	mov ebx,1
@@:
	finit
	mov eax,ebx
	pop ebx
	ret
f_BE endp

f_LE proc f1:REAL8, f2:REAL8
	push ebx
	mov ebx,0
	fld	f2
	fcomp f1
	fstsw ax
	sahf
	jc @F
	mov ebx,1
@@:
	finit
	mov eax,ebx
	pop ebx
	ret
f_LE endp

f_LARGER proc f1:REAL8, f2:REAL8
	push ebx
	mov ebx,0
	fld	f2
	fcomp f1
	fstsw ax
	sahf
	jc @F
	mov ebx,1
@@:
	finit
	mov eax,ebx
	pop ebx
	not eax
	and eax, 1
	ret
f_LARGER endp

f_LESS proc f1:REAL8, f2:REAL8
	push ebx
	mov ebx,0
	fld	f1
	fcomp f2
	fstsw ax
	sahf
	jc @F
	mov ebx,1
@@:
	finit
	mov eax,ebx
	pop ebx
	not eax
	and eax, 1
	ret
f_LESS endp

f_EQUAL proc f1:REAL8, f2:REAL8
	LOCAL a:DWORD
	invoke f_LE,f1,f2
	mov a,eax
	invoke f_BE,f1,f2
	and eax,a
	ret
f_EQUAL endp
.data
    foreach_count DWORD 0
     
    _FLOAT1 REAL8 0.0
    _FLOAT0 REAL8 0.0
    _NUM1 DWORD 0
    _NUM0 DWORD 0
    .code
        fuse proc 
    LOCAL result_1[40]:DWORD
    LOCAL numa_1[40]:DWORD
    LOCAL numb_1[40]:DWORD
    LOCAL i_1:DWORD
    LOCAL plus_1:DWORD
    LOCAL r_2:DWORD
    LOCAL c_2:DWORD
    mov esi,1
    mov numa_1[0*4],esi
    mov ebx,2
    mov numa_1[1*4],ebx
    mov ecx,3
    mov numa_1[2*4],ecx
    mov edx,9
    mov numa_1[3*4],edx
    mov edi,0
    mov numa_1[4*4],edi
    mov esi,9
    mov numb_1[0*4],esi
    mov ebx,3
    mov numb_1[1*4],ebx
    mov ecx,2
    mov numb_1[2*4],ecx
    mov edx,1
    mov numb_1[3*4],edx
    mov edi,0
    mov numb_1[4*4],edi
    mov esi,0
    mov i_1,esi
    mov ebx,0
    mov plus_1,ebx
    mov ecx,i_1
    mov edx,5
    push ecx
    push ebx
    push ecx
    push edx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov ecx,eax
    mov eax,ecx
    .WHILE eax>0
    mov edi,i_1
    mov edi,numa_1[edi*4]
    mov esi,i_1
    mov esi,numb_1[esi*4]
    add edi,esi
    mov ebx,plus_1
    add edi,ebx
    mov r_2,edi
    mov ecx,i_1
    mov ecx,numa_1[ecx*4]
    mov _NUM0,ecx
    invoke printnum,_NUM0
    mov edx,i_1
    mov edx,numb_1[edx*4]
    mov _NUM0,edx
    invoke printnum,_NUM0
    mov edi,r_2
    mov _NUM0,edi
    invoke printnum,_NUM0
    mov esi,plus_1
    mov _NUM0,esi
    invoke printnum,_NUM0
    mov ebx,10
    mov c_2,ebx
    mov ecx,c_2
    mov _NUM0,ecx
    invoke printcha,_NUM0
    mov edx,0
    mov plus_1,edx
    mov edi,r_2
    mov esi,10
    push ecx
    push ebx
    push esi
    push edi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jl @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov edi,eax
    mov eax,edi
    .IF eax>0
    mov ebx,1
    mov plus_1,ebx
    mov ecx,r_2
    mov edx,10
    sub ecx,edx
    mov r_2,ecx
    .ENDIF
    mov edi,r_2
    mov esi,i_1
    mov result_1[esi*4],edi
    mov ebx,i_1
    mov ecx,1
    add ebx,ecx
    mov i_1,ebx
    mov edx,i_1
    mov edi,5
    push ecx
    push ebx
    push edx
    push edi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov edx,eax
    mov eax,edx
    .ENDW
    mov esi,0
    mov i_1,esi
    mov ebx,i_1
    mov ecx,5
    push ecx
    push ebx
    push ebx
    push ecx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov ebx,eax
    mov eax,ebx
    .WHILE eax>0
    mov edx,i_1
    mov edx,result_1[edx*4]
    mov _NUM0,edx
    invoke printnum,_NUM0
    mov edi,i_1
    mov esi,1
    add edi,esi
    mov i_1,edi
    mov ebx,i_1
    mov ecx,5
    push ecx
    push ebx
    push ebx
    push ecx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov ebx,eax
    mov eax,ebx
    .ENDW
    mov edx,1
    mov eax,edx
    ret
    fuse endp
    main proc
	invoke fuse
	;invoke print_num,eax
	invoke inputcha
	invoke inputcha
	ret
main endp

end main
