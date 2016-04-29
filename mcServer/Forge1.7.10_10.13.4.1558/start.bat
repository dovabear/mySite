@echo off

SET retryCount=0

:Start
SET isError=false

java -jar -Xms512m -Xmx4096m forge-1.7.10-10.13.4.1558-1.7.10-universal.jar
IF ERRORLEVEL 1	SET isError=true

IF %isError%==false GOTO End

echo ERRORLEVEL=%ERRORLEVEL%
echo Error=%isError%

IF %isError%==true SET /a retryCount+=1

echo Retry taske: %retryCount%

IF %retryCount% LSS 5 GOTO Wait_30_Seconds

IF %retryCount% LSS 7 GOTO Wait_60_Seconds

IF %retryCount% LSS 9 GOTO Wait_5_Minutes 

IF %retryCount% LSS 12 GOTO Wait_15_Minutes

SET retryCount=0
COLOR 7

:Wait_30_Seconds
	echo Restart In 30 Seconds ...
	Timeout /t 30 /nobreak
	COLOR E
	GOTO Start

:Wait_60_Seconds
	echo Restart In 60 Seconds ...
	Timeout /t 60 /nobreak
	COLOR E
	GOTO Start

:Wait_5_Minutes
	echo Restart In 5 Minutes ...
	Timeout /t 300 /nobreak
	COLOR C
	GOTO Start

:Wait_15_Minutes
	echo Restart In 15 Minutes ...
	Timeout /t 900 /nobreak
	COLOR C
	GOTO Start

:End
	PAUSE
	::EXIT