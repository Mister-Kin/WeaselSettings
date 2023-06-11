@chcp 65001>nul
@echo off & title 一键复制配置文件 & color F0
cd /d %~dp0

@REM 查询当前终端窗口的列数大小
for /f "tokens=2 delims=: " %%c in ('mode con ^| findstr Columns') do set cols=%%c

@REM 局部环境设置打印的符号和数量，并传递到全局环境draw_line变量中
setlocal enabledelayedexpansion
set "char=="
set /a "count=%cols%"
set "line="
for /l %%i in (1,1,%count%) do set "line=!line!%char%"
endlocal & set "draw_line=%line%"

cls
echo %draw_line%
echo.
echo 欢迎使用「一键复制配置文件」自助程序
echo.
echo 程序作者：Mr. Kin ^<im.misterkin@gmail.com^>
echo.
echo %draw_line%
echo.
echo 本程序会自动将本项目中的所有小狼毫配置文件复制到小狼毫的用户文件夹下，即 「%AppData%\Rime」 路径下
echo.
echo 注意：本程序会对同名文件及文件夹进行强制覆盖，若需保存相关配置文件数据，请先自行处理好文件再执行本程序
echo.
echo %draw_line%
echo.
echo 请按任意键继续完成复制
@pause>nul
echo.
echo %draw_line%
echo.

if exist "%AppData%\Rime" (
    echo 已检测到「%AppData%\Rime」路径，开始进行复制操作
    echo.
) else (
    echo 未检测到「%AppData%\Rime」路径
    echo.
    echo 请先安装好小狼毫输入法程序，之后再运行本程序
    echo.
    echo 请按任意键或者关闭终端窗口退出
    echo.
    @pause>nul
    exit
)
echo %draw_line%
echo.
echo 当前路径为「%cd%」
echo.
echo %draw_line%
echo.

@REM 如果不加/i参数，需要手动在目标路径的最后加上反斜杠\符号表明这是个目录，否则xcopy会提问目录路径是文件还是文件夹
xcopy /s /i /y .\dict "%AppData%\Rime\dict">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text 「dict」文件夹
) else (
    call :copy_failed_text 「dict」文件夹
)

xcopy /s /i /y .\dict_en "%AppData%\Rime\dict_en">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text 「dict_en」文件夹
) else (
    call :copy_failed_text 「dict_en」文件夹
)

xcopy /y .\*.yaml "%AppData%\Rime\">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text 「所有yaml」文件
) else (
    call :copy_failed_text 「所有yaml」文件
)

xcopy /y .\rime.lua "%AppData%\Rime\">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text 「rime.lua」文件
) else (
    call :copy_failed_text 「rime.lua」文件
)

echo %draw_line%
echo.
echo 已完成复制，本程序将于5秒后自动关闭
choice /t 5 /d y /n >nul
exit

:copy_success_text
echo 已成功复制%1到「%AppData%\Rime」路径下
echo.
exit /b

:copy_failed_text
echo 无法复制%1到「%AppData%\Rime」路径下，请关掉程序尝试重新运行或者手动进行复制
echo.
echo 请按任意键退出或者关闭终端窗口退出
echo.
@pause>nul
exit
