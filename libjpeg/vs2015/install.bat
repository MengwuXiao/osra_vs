@pushd "%~dp0"
@if not "%VisualStudioVersion%" == "" Set HAS_VSDEV=TRUE
@if not "%HAS_VSDEV%" == "TRUE" CALL "%VS140COMNTOOLS%VsDevCmd.bat" %1
@Set $PLATFORM=x86
@if "%Platform%" == "X64" Set $PLATFORM=x64

if "%INSTALL_BASE%" == "" Set INSTALL_BASE=%PUBLIC%
if "%INSTALL_PREFIX%" == "" (
	if /I "%Platform%" == "X64" (
		Set INSTALL_PREFIX=%INSTALL_BASE%\x64
	) else (
		Set INSTALL_PREFIX=%INSTALL_BASE%
	)
)


Set Config=Release
MSBuild jpeg.sln /p:Configuration=%Config%,Platform=%$PLATFORM%

Set STATIC_LIB_RELEASE=
Set STATIC_LIB_DEBUG=
Set SHARED_DLL=jpeg\%Config%\jpeg.dll
Set SHARED_LIB=jpeg\%Config%\jpeg.lib
Set INCLUDES=..\jpeglib.h ..\jerror.h jpeg\jconfig.h jpeg\jmorecfg.h
Set EXES=cjpeg\%Config%\cjpeg.exe djpeg\%Config%\djpeg.exe jpegtran\%Config%\jpegtran.exe rdjpgcom\%Config%\rdjpgcom.exe wrjpgcom\%Config%\wrjpgcom.exe

Set STATIC_LIB=%STATIC_LIB_RELEASE%
for %%i in ( %INCLUDES% ) do XCOPY /Y /D /I "%%i" "%INSTALL_PREFIX%\include"
if not "%STATIC_LIB%" == "" XCOPY /Y /D /I "%STATIC_LIB%" "%INSTALL_PREFIX%\lib"
if not "%SHARED_LIB%" == ""  XCOPY /Y /D /I "%SHARED_LIB%" "%INSTALL_PREFIX%\lib"
if not "%SHARED_DLL%" == ""  XCOPY /Y /D /I "%SHARED_DLL%" "%INSTALL_PREFIX%\bin"
for %%i in ( %EXES% ) do XCOPY /Y /D /I "%%i" "%INSTALL_PREFIX%\bin"



@Set $PLATFORM=
@popd
@if not "%HAS_VSDEV%" == "TRUE" pause
