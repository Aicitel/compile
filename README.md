# compile
boooooom language because it would boom anytime

#BOOM LANGUAGE
@(Defined by:|Aicitel|Ncnxj5|HaperJJ )[Complier| @SJTU_SE|]
>**Entrance** : The function : fuse
<<<<<<< HEAD
>- **Def.** 
>>DEF fuse() AS NUM! { }! 
>
>- **Meaning:  **A fuse is a device on a bomb or firework which delays the explosion so that people can move a safe distance away
****
**MORE [USAGE]:**

>**VARIABLE DEFINE** 
>>**DEF |VARIABLE NAME| AS |TYPE| !**
>>
>>>DEF i AS NUM!
>>
>>>DEF f AS FLOAT!
>>
>>>DEF c  AS CHARACTER!
****

>**FUNCTION DEFINE** 
>>**DEF |FUCTION NAME|    ( |PARAMETER| ) AS | FUNCTION TYPE |  {  |BODY|  }!**
>>
>>>DEF func() AS NUM{...}!

>>**Meaning:  **
>****

>**FUNCTION CALL** 
>>**|FUCTION NAME|( |PARAMETER| )!**
>>
>>>func(i,j)!

>>**Meaning:  **
****

>**LET** 
>>**LET |VARIABLE NAME|   AS  |VALUE|**
>>
>>>LET i AS 1!
>>>
>>>LET a AS func(1,2)!
>>>
>>>LET m AS 2+b!

>>**Meaning:  **
****

>**IF** 
>>**?( |CONDITION| ){ |BODY| }!**
>>
>>>?(   line[i]=j   ){   printcha(81)!   }!

>>**Meaning:  **
****

>**LOOP** 
>>**LOOP( |CONDITION| ){ |BODY| }!**
>>
>>>LOOP(a<n)  {  LET a AS a+1!   }!

>>**Meaning:  **
****

>**BREAK** 
>>**BOOM!**
>>
>>>LOOP(a<n)  {  LET a AS a+1! BOOM!  }!

>>**Meaning:  **

****


**Demo:**  Eight Queen
``` python
	DEF line AS NUM[8]!
	DEF answer AS NUM!
	
	DEF show() AS NUM    # the func for show the Queens
	{ 
		DEF i AS NUM! 
		DEF j AS NUM! 
		LET i AS 0! 
		LET j AS 0! 
		LOOP(i<8) 
		{  
			LOOP(j<8)  
			{
			
				 ?(line[i]=j             ) {printcha(81)!}!#print 'Q'
				 ?(line[i]>j OR line[i]<j) {printcha(42)!}!#print '*'  
				  
				 LET j AS j+1! 
			}!  
				 LET j AS 0!  
				 printcha(10)!  # print '\n'
				 LET i AS i+1! 
		}! 
		LET answer AS answer+1! 
		printnum(answer)! 
		printcha(10)! 
		inputcha()! 
		RET 0!
	}!
	
	DEF judge(NUM n) AS NUM
	{ 
		DEF i AS NUM! 
		LET i AS 0! LOOP(i<n) 
		{
			  ?(line[n]=line[i]    ) {RET 1!}!  
			  ?(line[n]-n=line[i]-i) {RET 1!}!  
			  ?(line[n]+n=line[i]+i) {RET 1!}!  
			  LET i AS i+1! 
		}! 
		RET 0!
	}!
	
	DEF control(NUM n) AS NUM
	{ 
		DEF k AS NUM! 
		LET k AS 8! 
		DEF temp AS NUM! 
		LET line[n] AS 0! 
		LOOP(line[n]<k) 
		{  
			LET temp AS judge(n)!  
			?(temp =0)  {?(n>7 OR n<7){control(n+1)!}!
			?(n=7    )  {show()!}!  
		}!  
		LET line[n] AS line[n]+1! }! 
		RET 0!
	}!
	
	DEF fuse() AS NUM{ control(0)! RET 0!}!
	# fuse ,the main entrance to the bomb :)
	@BOOM!
```

**Result:** : Eight Queen
``` python
	...
	Q*******
	******Q*
	***Q****
	*****Q**
	*******Q
	*Q******
	****Q***
	**Q*****
	3
	...
```
**MASM:** Microsoft MASM 6.1 Programmer's Guide 
TIPS:MASM in CMD
------------------------------------------
>;ml /c /coff a.asm
>;link /subsystem:windows a.obj
``` python
.386 .model flat,stdcall 
option casemap:none 
include e:\masm32\include\windows.inc 
include e:\masm32\include\user32.inc 
includelib e:\masm32\lib\user32.lib 
include e:\masm32\include\kernel32.inc 
includelib e:\masm32\lib\kernel32.lib 
.data 
szCaption db 'A MessageBox',0 
szText db 'Hello!',0  
.code 
start:   
	invoke MessageBox,NULL,offset szText,offset szCaption,MB_OK   
	invoke ExitProcess,NULL 
end start
```

>ml /c /coff a.asm
>link /subsystem:console a.obj

``` python
.386 
.model flat,stdcall
include  e:\masm32\include\msvcrt.inc
includelib e:\masm32\lib\msvcrt.lib

.data 
	szFmt db 'HelloWorld -1:%d| ', 0

.code

main proc 
	mov eax,-1 
	invoke crt_printf, addr szFmt, eax 
	invoke crt_scanf    
	ret
main endp

end main
``` 

## contrust
- mail?￡?oncnxj5@163.com
- github

