@echo off

setlocal enableDelayedExpansion

if [%1] NEQ [] (
	if [%1]==[hoje] (
		set filename=%date:~-4,4%%date:~-7,2%%date:~-10,2%
	) else (
		set filename=%~1
		if [%2] NEQ [] (set filename=!filename! %~2)
		if [%3] NEQ [] (set filename=!filename! %~3)
		if [%4] NEQ [] (set filename=!filename! %~4)
		if [%5] NEQ [] (set filename=!filename! %~5)
		if [%6] NEQ [] (set filename=!filename! %~6)
		if [%7] NEQ [] (set filename=!filename! %~7)
		if [%8] NEQ [] (set filename=!filename! %~8)
		if [%9] NEQ [] (set filename=!filename! %~9)
	)
) else (
	:: o primeiro parametro nao eh vazio
	set filename=ss
)
set PATHinteiro="%userprofile%\Desktop\%filename%.jpg"

if exist %PATHinteiro% (
	echo O arquivo "%filename%" ja existe, deseja sobrescreve-lo?

	:DigitarYN
	set /p ans= "Digite [S/N]"
	
	if [!ans!]==[n] (
		endLocal
		goto:eof
	)

	if [!ans!] NEQ [s] (
		goto:DigitarYN
	)
)

start /b nircmd.exe cmdwait 220 savescreenshot %PATHinteiro%
nircmd clipboard set %PATHinteiro%
endLocal