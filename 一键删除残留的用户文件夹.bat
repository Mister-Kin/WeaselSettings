@chcp 936>nul
@echo off & title һ��ɾ���������û��ļ��� & color F0
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
echo ��ӭʹ�á�һ��ɾ���������û��ļ��С���������
echo.
echo �������ߣ�Mr. Kin ^<im.misterkin@gmail.com^>
echo.
call :draw_line "="
echo.
echo ����������ж��С�Ǻ����뷨������Զ�ɾ���������û��ļ��У��� ��%AppData%\Rime�� ·��
echo.
echo ע�⣺�����޼ۣ����豣����������ļ����ݣ��������д�����ļ���ִ�б�����
echo.
call :draw_line "="
echo.
echo �밴������������ɾ��
@pause>nul
echo.
call :draw_line "="
echo.

if exist "%AppData%\Rime" (
    echo �Ѽ�⵽��%AppData%\Rime��·������ʼ����ɾ������
    echo.
    rmdir /s /q "%AppData%\Rime"
    if "%errorlevel%" EQU "0" (
        echo ��ɾ����%AppData%\Rime���ļ���
        echo.
        call :draw_line "="
        echo.
        echo ��������5����Զ��ر�
        choice /t 5 /d y /n >nul
    ) else (
        echo �޷�ɾ����%AppData%\Rime���ļ��У���ص��������������л����ֶ�����ɾ��
        echo.
        echo �밴��������߹ر��ն˴����˳�
        echo.
        @pause>nul
    )
) else (
    echo δ��⵽��%AppData%\Rime��·��
    echo.
    echo ����ִ��ɾ��
    echo.
    echo �밴��������߹ر��ն˴����˳�
    echo.
    @pause>nul
)
exit
