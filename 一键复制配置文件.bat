@chcp 936>nul
@echo off & title һ�����������ļ� & color F0
cd /d %~dp0

goto :start_job

:draw_line
@REM �ֲ��������ô�ӡ�ķ��ź������������ݵ�ȫ�ֻ���draw_line_chars������
setlocal enabledelayedexpansion
@REM ��ѯ��ǰ�ն˴��ڵ�������С��delims����:֮��û�пո񣬻����ж���ո���һ����Ч�������޷�trim����Ŀո񡣲���:���治�ܵ�����һ���ո񣬷����޷���ȷ��ȡ��
for /f "tokens=2 delims=:" %%c in ('mode con ^| findstr "��"') do set cols=%%c
@REM �Ƴ���������߶���Ŀո�
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
echo ��ӭʹ�á�һ�����������ļ�����������
echo.
echo �������ߣ�Mr. Kin ^<im.misterkin@gmail.com^>
echo.
call :draw_line "="
echo.
echo ��������Զ�������Ŀ�е�����С�Ǻ������ļ����Ƶ�С�Ǻ����û��ļ����£��� ��%AppData%\Rime�� ·����
echo.
echo ע�⣺��������ͬ���ļ����ļ��н���ǿ�Ƹ��ǣ����豣����������ļ����ݣ��������д�����ļ���ִ�б�����
echo.
call :draw_line "="
echo.
echo �밴�����������ɸ���
@pause>nul
echo.
call :draw_line "="
echo.

if exist "%AppData%\Rime" (
    echo �Ѽ�⵽��%AppData%\Rime��·������ʼ���и��Ʋ���
    echo.
) else (
    echo δ��⵽��%AppData%\Rime��·��
    echo.
    echo ���Ȱ�װ��С�Ǻ����뷨����֮�������б�����
    echo.
    echo �밴��������߹ر��ն˴����˳�
    echo.
    @pause>nul
    exit
)
call :draw_line "="
echo.
echo ��ǰ·��Ϊ��%cd%��
echo.
call :draw_line "="
echo.

@REM �������/i��������Ҫ�ֶ���Ŀ��·���������Ϸ�б��\���ű������Ǹ�Ŀ¼������xcopy������Ŀ¼·�����ļ������ļ���
xcopy /s /i /y .\dict "%AppData%\Rime\dict">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text ��dict���ļ���
) else (
    call :copy_failed_text ��dict���ļ���
)

xcopy /s /i /y .\dict_en "%AppData%\Rime\dict_en">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text ��dict_en���ļ���
) else (
    call :copy_failed_text ��dict_en���ļ���
)

xcopy /y .\*.yaml "%AppData%\Rime\">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text ������yaml���ļ�
) else (
    call :copy_failed_text ������yaml���ļ�
)

xcopy /y .\rime.lua "%AppData%\Rime\">nul
if "%errorlevel%" EQU "0" (
    call :copy_success_text ��rime.lua���ļ�
) else (
    call :copy_failed_text ��rime.lua���ļ�
)

call :draw_line "="
echo.
echo ����ɸ��ƣ���������5����Զ��ر�
choice /t 5 /d y /n >nul
exit

:copy_success_text
echo �ѳɹ�����%1����%AppData%\Rime��·����
echo.
exit /b

:copy_failed_text
echo �޷�����%1����%AppData%\Rime��·���£���ص��������������л����ֶ����и���
echo.
echo �밴������˳����߹ر��ն˴����˳�
echo.
@pause>nul
exit
