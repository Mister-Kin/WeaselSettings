@chcp 936>nul
@echo off & title 一键删除残留的用户文件夹 & color F0
cd /d %~dp0

goto :start_job

:draw_line
@REM 局部环境设置打印的符号和数量，并传递到全局环境draw_line_chars变量中
setlocal enabledelayedexpansion
@REM 查询当前终端窗口的列数大小，delims后面:之后没有空格，或者有多个空格都是一样的效果，它无法trim多余的空格。并且:后面不能单独加一个空格，否则无法正确获取。
for /f "tokens=2 delims=:" %%c in ('mode con ^| findstr "列"') do set cols=%%c
@REM 移除变量中左边多余的空格
for /f "tokens=* delims=: " %%c in ('echo %cols%') do set cols=%%c
set "char=%~1"
set /a "count=%cols%"
set "line="
for /l %%i in (1,1,%count%) do set "line=!line!%char%"
endlocal & set "draw_line_chars=%line%"
echo %draw_line_chars%
exit /b

:start_job
cls
call :draw_line "="
echo.
echo 欢迎使用「一键删除残留的用户文件夹」自助程序
echo.
echo 程序作者：Mr. Kin ^<im.misterkin@gmail.com^>
echo.
call :draw_line "="
echo.
echo 本程序用于卸载小狼毫输入法程序后，自动删除残留的用户文件夹，即 「%AppData%\Rime」 路径
echo.
echo 注意：数据无价，若需保存相关配置文件数据，请先自行处理好文件再执行本程序
echo.
call :draw_line "="
echo.
echo 请按任意键继续完成删除
@pause>nul
echo.
call :draw_line "="
echo.

if exist "%AppData%\Rime" (
    echo 已检测到「%AppData%\Rime」路径，开始进行删除操作
    echo.
    rmdir /s /q "%AppData%\Rime"
    if "%errorlevel%" EQU "0" (
        echo 已删除「%AppData%\Rime」文件夹
        echo.
        call :draw_line "="
        echo.
        echo 本程序将于5秒后自动关闭
        choice /t 5 /d y /n >nul
    ) else (
        echo 无法删除「%AppData%\Rime」文件夹，请关掉程序尝试重新运行或者手动进行删除
        echo.
        echo 请按任意键或者关闭终端窗口退出
        echo.
        @pause>nul
    )
) else (
    echo 未检测到「%AppData%\Rime」路径
    echo.
    echo 无需执行删除
    echo.
    echo 请按任意键或者关闭终端窗口退出
    echo.
    @pause>nul
)
exit
