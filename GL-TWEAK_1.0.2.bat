@echo off
setlocal enabledelayedexpansion
cls

:: =====================================================
::  GL-TWEAK 1.0.2 - Windows Optimizer Tieng Viet
::  PHIEN BAN CAI TIEN - THAN THIEN VOI NGUOI MOI
:: =====================================================

title GL-TWEAK 1.0.2 - Windows Optimizer Pro
color 0B

:: Kiem tra quyen Administrator
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    echo [CANH BAO] Can chay voi quyen Administrator!
    echo Dang yeu cau quyen Admin...
    timeout 2 > nul
    Powershell -NoProfile Start -Verb RunAs '%0'
    exit /b 0
)

:: Tao thu muc Log
if not exist "C:\GL-TWEAK_Logs" mkdir "C:\GL-TWEAK_Logs" >nul 2>&1
echo [%DATE% %TIME%] Bat dau GL-TWEAK 1.0.2 >> "C:\GL-TWEAK_Logs\Log.txt"

:: =====================================================
:: DOI WALLPAPER GL-TWEAK
:: =====================================================
echo.
echo  [INFO] Dang tai wallpaper GL-TWEAK...

if not exist "C:\GL-TWEAK_Logs\Wallpaper" mkdir "C:\GL-TWEAK_Logs\Wallpaper" >nul 2>&1

for /f "tokens=2*" %%a in ('reg query "HKCU\Control Panel\Desktop" /v Wallpaper 2^>nul ^| findstr Wallpaper') do set "OLD_WALLPAPER=%%b"
if defined OLD_WALLPAPER (
    echo %OLD_WALLPAPER%> "C:\GL-TWEAK_Logs\Wallpaper\old_wallpaper.txt"
)

set "WALLPAPER_URL=https://i.ibytecdn.org/img/image_2026010636163c5085a7d6a66f4a4527b93e724a.jpg"
set "WALLPAPER_PATH=C:\GL-TWEAK_Logs\Wallpaper\GL-TWEAK_Wallpaper.jpg"

if not exist "%WALLPAPER_PATH%" (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%WALLPAPER_URL%', '%WALLPAPER_PATH%')" >nul 2>&1
)

if exist "%WALLPAPER_PATH%" (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%WALLPAPER_PATH%" /f >nul 2>&1
    reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "10" /f >nul 2>&1
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True >nul 2>&1
    echo  [OK] Da doi wallpaper GL-TWEAK!
) else (
    echo  [SKIP] Khong the tai wallpaper (can ket noi internet)
)
timeout 1 >nul

:: =====================================================
:: MENU CHINH - PHIEN BAN 1.0.2 VOI MO TA CHI TIET
:: =====================================================
:menu_chinh
@echo off
cls
echo.
echo  +==============================================================================+
echo  ^|                                                                              ^|
echo  ^|     ######   ##            ########  ##      ##  ########    ###    ##  ##   ^|
echo  ^|    ##        ##               ##     ##      ##  ##         ## ##   ## ##    ^|
echo  ^|   ##   ####  ##      #####    ##     ##  ##  ##  ######    ##   ##  ####     ^|
echo  ^|   ##     ##  ##               ##     ## #### ##  ##       #########  ## ##   ^|
echo  ^|    #######   ########         ##      ###  ###   ########  ##   ##  ##  ##   ^|
echo  ^|                                                                              ^|
echo  ^|                      PHIEN BAN 1.0.2 - THAN THIEN NGUOI MOI                  ^|
echo  ^|                                                                              ^|
echo  +==============================================================================+
echo  ^|                    === TINH NANG MOI PHIEN BAN 1.0.2 ===                     ^|
echo  +==============================================================================+
echo  ^|   [S] QUET HE THONG - Xem phan nao chua toi uu, chon toi uu tung cai        ^|
echo  ^|   [A] TU DONG TOI UU - Hoi tung buoc, ban chon CPU/GPU cua minh             ^|
echo  +==============================================================================+
echo  ^|                         === TOI UU CO BAN ===                                ^|
echo  +==============================================================================+
echo  ^|   [1] TAO DIEM KHOI PHUC      - Backup he thong truoc khi tweak             ^|
echo  ^|   [2] TOI UU GIAO DIEN        - Tat hieu ung, tang toc menu, giao dien      ^|
echo  ^|   [3] TOI UU HE THONG         - Tat thong bao, background apps, mouse lag   ^|
echo  ^|   [4] XOA TELEMETRY           - Tat thu thap du lieu, bao ve rieng tu       ^|
echo  ^|   [5] VO HIEU SERVICES        - Tat dich vu khong can, giam RAM, tang toc   ^|
echo  ^|   [6] TOI UU CPU              - Tang hieu suat CPU Intel/AMD                ^|
echo  ^|   [7] TOI UU GPU              - Tang FPS game NVIDIA/AMD/Intel              ^|
echo  ^|   [8] TOI UU MANG             - Giam ping, tang toc download/upload         ^|
echo  ^|   [9] XOA APPS MICROSOFT      - Xoa bloatware, giai phong dung luong        ^|
echo  ^|   [10] TAT STARTUP            - Tat app khoi dong cung Win, boot nhanh hon  ^|
echo  +==============================================================================+
echo  ^|                         === TOI UU NANG CAO ===                              ^|
echo  +==============================================================================+
echo  ^|   [11] TIMER RESOLUTION       - Giam do tre he thong, muot hon khi choi game^|
echo  ^|   [12] PRIORITY SEPARATION    - Uu tien CPU cho game/ung dung dang chay     ^|
echo  ^|   [13] DON DEP FILE TAM       - Xoa file rac, giai phong o cung             ^|
echo  ^|   [14] DON DEP MANG           - Reset DNS, xoa cache mang                   ^|
echo  ^|   [15] NVIDIA NANG CAO        - Tweak sau cho card NVIDIA (50+ tweaks)      ^|
echo  ^|   [16] SERVICES NANG CAO      - Tat them nhieu dich vu an                   ^|
echo  ^|   [17] TAT SCHEDULED TASKS    - Tat tac vu nen cua Windows                  ^|
echo  ^|   [18] BCDEDIT TWEAKS         - Toi uu boot, timer, kernel                  ^|
echo  ^|   [19] XOA EDGE/ONEDRIVE      - Xoa trinh duyet Edge, OneDrive              ^|
echo  ^|   [20] RAM OPTIMIZER          - Giai phong RAM, tang toc bo nho             ^|
echo  ^|   [21] POWER PLAN ULTIMATE    - Che do nguon hieu suat cao nhat             ^|
echo  ^|   [22] GAME PRIORITY          - Uu tien tai nguyen cho game                 ^|
echo  +==============================================================================+
echo  ^|   [30] ROBLOX OPTIMIZER       - FFlags tang FPS Roblox                      ^|
echo  ^|   [32] SSD OPTIMIZER          - Toi uu o cung SSD, keo dai tuoi tho         ^|
echo  ^|   [33] DEBLOATER NANG CAO     - Xoa 40+ apps khong can thiet                ^|
echo  +==============================================================================+
echo  ^|   [23] MOUSE/KEYBOARD          - Tat mouse accel, toi uu input lag           ^|
echo  ^|   [24] VISUAL EFFECTS          - Tat hieu ung de tang hieu suat             ^|
echo  ^|   [25] MEMORY CLEANER          - Giai phong RAM dang bi chiem dung          ^|
echo  ^|   [26] DISK CLEANUP            - Xoa file rac, giai phong o cung            ^|
echo  ^|   [27] INTEL SERVICES          - Tat dich vu Intel khong can                ^|
echo  ^|   [28] AMD SERVICES            - Tat dich vu AMD khong can                  ^|
echo  ^|   [29] SERVICES OPTIMIZER      - Quan ly bat/tat dich vu theo nhu cau       ^|
echo  ^|   [31] BACKUP DU LIEU          - Sao luu Documents, Games, Registry         ^|
echo  +==============================================================================+
echo  ^|                         === TIEN ICH ===                                     ^|
echo  +==============================================================================+
echo  ^|   [34] WIFI OPTIMIZER          - Toi uu WiFi, xem mat khau da luu           ^|
echo  ^|   [35] GAME BOOSTER            - Bat/tat che do game, tat app nen           ^|
echo  ^|   [36] CONTEXT MENU            - Tuy chinh menu chuot phai                  ^|
echo  +==============================================================================+
echo  ^|   [77] KIEM TRA TWEAKS        - Xem dich vu nao dang chay, goi y tat        ^|
echo  ^|   [88] SYSTEM INFO            - Xem thong tin he thong                      ^|
echo  ^|   [89] BENCHMARK              - Kiem tra hieu suat                          ^|
echo  ^|   [99] FIXERS - SUA LOI       - Sua cac loi thuong gap                      ^|
echo  +==============================================================================+
echo  ^|   [TG] TELEGRAM COMMUNITY     [0] THOAT                                     ^|
echo  +==============================================================================+
echo.
set /p choice=  Nhap lua chon cua ban: 

if /i "%choice%"=="S" goto quet_he_thong
if /i "%choice%"=="A" goto tu_dong_toi_uu_hoi
if "%choice%"=="1" goto tao_restore_point
if "%choice%"=="2" goto toi_uu_giao_dien
if "%choice%"=="3" goto toi_uu_he_thong
if "%choice%"=="4" goto xoa_telemetry
if "%choice%"=="5" goto vo_hieu_services
if "%choice%"=="6" goto toi_uu_cpu
if "%choice%"=="7" goto toi_uu_gpu
if "%choice%"=="8" goto toi_uu_mang
if "%choice%"=="9" goto xoa_apps_microsoft
if "%choice%"=="10" goto tat_startup
if "%choice%"=="11" goto timer_resolution
if "%choice%"=="12" goto priority_separation
if "%choice%"=="13" goto don_dep_file
if "%choice%"=="14" goto don_dep_mang
if "%choice%"=="15" goto nvidia_nang_cao
if "%choice%"=="16" goto services_nang_cao
if "%choice%"=="17" goto tat_tasks
if "%choice%"=="18" goto bcdedit_tweaks
if "%choice%"=="19" goto xoa_edge_onedrive
if "%choice%"=="20" goto ram_optimizer
if "%choice%"=="21" goto power_plan_ultimate
if "%choice%"=="22" goto game_priority
if "%choice%"=="23" goto mouse_keyboard_optimizer
if "%choice%"=="24" goto visual_effects_optimizer
if "%choice%"=="25" goto memory_cleaner
if "%choice%"=="26" goto disk_cleanup
if "%choice%"=="27" goto intel_services
if "%choice%"=="28" goto amd_services
if "%choice%"=="29" goto services_optimizer_menu
if "%choice%"=="30" goto roblox_optimizer
if "%choice%"=="31" goto backup_data
if "%choice%"=="32" goto ssd_optimizer
if "%choice%"=="33" goto debloater_advanced
if "%choice%"=="34" goto wifi_optimizer
if "%choice%"=="35" goto game_booster
if "%choice%"=="36" goto context_menu
if "%choice%"=="77" goto kiem_tra_tweaks
if "%choice%"=="88" goto system_info
if "%choice%"=="89" goto benchmark
if "%choice%"=="99" goto fixers
if /i "%choice%"=="TG" goto telegram_community
if "%choice%"=="0" goto thoat
goto menu_chinh


:: =====================================================
:: [S] QUET HE THONG TOAN DIEN - TINH NANG MOI 1.0.2
:: Quet TAT CA va cho phep chon tung van de de toi uu
:: =====================================================
:quet_he_thong
cls
echo.
echo  +==============================================================================+
echo  ^|              QUET HE THONG - CHI HIEN THI PHAN CHUA TOI UU                   ^|
echo  +==============================================================================+
echo.
echo  [INFO] Dang quet he thong... Vui long cho...
echo.

:: Reset tat ca bien
set "total_issues=0"
set "issue_1=" & set "issue_2=" & set "issue_3=" & set "issue_4=" & set "issue_5="
set "issue_6=" & set "issue_7=" & set "issue_8=" & set "issue_9=" & set "issue_10="
set "issue_11=" & set "issue_12=" & set "issue_13=" & set "issue_14=" & set "issue_15="
set "issue_16=" & set "issue_17=" & set "issue_18=" & set "issue_19=" & set "issue_20="
set "desc_1=" & set "desc_2=" & set "desc_3=" & set "desc_4=" & set "desc_5="
set "desc_6=" & set "desc_7=" & set "desc_8=" & set "desc_9=" & set "desc_10="
set "desc_11=" & set "desc_12=" & set "desc_13=" & set "desc_14=" & set "desc_15="
set "desc_16=" & set "desc_17=" & set "desc_18=" & set "desc_19=" & set "desc_20="

echo  ===============================================================================
echo   DANH SACH VAN DE CAN TOI UU:
echo  ===============================================================================
echo.

:: === KIEM TRA SERVICES ===
for %%s in (DiagTrack dmwappushservice MapsBroker WSearch SysMain WerSvc XblAuthManager XblGameSave XboxNetApiSvc lfsvc Fax RemoteRegistry RetailDemo) do (
    sc query "%%s" 2>nul | findstr /i "RUNNING" >nul && (
        set /a total_issues+=1
        call set "issue_%%total_issues%%=svc_%%s"
        call set "desc_%%total_issues%%=[SERVICES] %%s dang chay - Nen tat de giam RAM"
        call echo   [%%total_issues%%] [SERVICES] %%s dang chay
    )
)

:: === KIEM TRA HE THONG ===
:: GameDVR = 1 la dang bat
for /f "tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" 2^>nul ^| findstr "GameDVR_Enabled"') do set "gdvr_val=%%a"
if "!gdvr_val!"=="0x1" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=gamedvr"
    call set "desc_%%total_issues%%=[SYSTEM] GameDVR dang BAT - Ghi hinh game, ton CPU/GPU"
    call echo   [%%total_issues%%] [SYSTEM] GameDVR dang BAT - Ton CPU/GPU
)

:: GlobalUserDisabled = 0 la background apps dang bat
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" 2^>nul ^| findstr "GlobalUserDisabled"') do set "bg_val=%%a"
if "!bg_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=bgapps"
    call set "desc_%%total_issues%%=[SYSTEM] Background Apps dang BAT - Apps chay nen ton RAM"
    call echo   [%%total_issues%%] [SYSTEM] Background Apps dang BAT - Ton RAM
)

:: AllowTelemetry = 0 la da tat
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" 2^>nul ^| findstr "AllowTelemetry"') do set "tele_val=%%a"
if not "!tele_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=telemetry"
    call set "desc_%%total_issues%%=[SYSTEM] Telemetry dang BAT - Microsoft thu thap du lieu"
    call echo   [%%total_issues%%] [SYSTEM] Telemetry dang BAT - Thu thap du lieu
)

:: PowerThrottlingOff = 1 la da tat throttling
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" 2^>nul ^| findstr "PowerThrottlingOff"') do set "pt_val=%%a"
if not "!pt_val!"=="0x1" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=powerthrottle"
    call set "desc_%%total_issues%%=[CPU] Power Throttling dang BAT - Giam hieu suat CPU"
    call echo   [%%total_issues%%] [CPU] Power Throttling dang BAT - Giam hieu suat
)

:: NetworkThrottlingIndex = 0xffffffff la da tat
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" 2^>nul ^| findstr "NetworkThrottlingIndex"') do set "nt_val=%%a"
if not "!nt_val!"=="0xffffffff" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=netthrottle"
    call set "desc_%%total_issues%%=[NETWORK] Network Throttling dang BAT - Gioi han mang"
    call echo   [%%total_issues%%] [NETWORK] Network Throttling dang BAT
)

:: GlobalTimerResolutionRequests = 1 la da bat
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" 2^>nul ^| findstr "GlobalTimerResolutionRequests"') do set "tr_val=%%a"
if not "!tr_val!"=="0x1" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=timer"
    call set "desc_%%total_issues%%=[SYSTEM] Timer Resolution chua BAT - Tang do tre"
    call echo   [%%total_issues%%] [SYSTEM] Timer Resolution chua BAT
)

:: === KIEM TRA CHUOT ===
:: MouseSpeed = 0 la da tat acceleration
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Mouse" /v "MouseSpeed" 2^>nul ^| findstr "MouseSpeed"') do set "ms_val=%%a"
if not "!ms_val!"=="0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=mouseaccel"
    call set "desc_%%total_issues%%=[MOUSE] Mouse Acceleration dang BAT - Aim khong chinh xac"
    call echo   [%%total_issues%%] [MOUSE] Mouse Acceleration dang BAT
)

:: MouseDataQueueSize = 0x10 (16) la da toi uu
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" 2^>nul ^| findstr "MouseDataQueueSize"') do set "mq_val=%%a"
if not "!mq_val!"=="0x10" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=mousequeue"
    call set "desc_%%total_issues%%=[MOUSE] Mouse Queue chua toi uu - Tang input lag"
    call echo   [%%total_issues%%] [MOUSE] Mouse Queue chua toi uu
)

:: === KIEM TRA CPU ===
:: Win32PrioritySeparation = 26 (0x1a) hoac 38 (0x26)
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" 2^>nul ^| findstr "Win32PrioritySeparation"') do set "pri_val=%%a"
if not "!pri_val!"=="0x1a" if not "!pri_val!"=="0x26" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=priority"
    call set "desc_%%total_issues%%=[CPU] Priority Separation chua toi uu - CPU chua uu tien game"
    call echo   [%%total_issues%%] [CPU] Priority Separation chua toi uu
)

:: CsEnabled = 0 la da tat
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" 2^>nul ^| findstr "CsEnabled"') do set "cs_val=%%a"
if not "!cs_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=cstandby"
    call set "desc_%%total_issues%%=[CPU] Connected Standby dang BAT - Giam hieu suat"
    call echo   [%%total_issues%%] [CPU] Connected Standby dang BAT
)

:: === KIEM TRA GPU ===
:: HwSchMode = 2 la da bat HAGS
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" 2^>nul ^| findstr "HwSchMode"') do set "hags_val=%%a"
if not "!hags_val!"=="0x2" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=hags"
    call set "desc_%%total_issues%%=[GPU] HAGS chua BAT - Tang hieu suat GPU"
    call echo   [%%total_issues%%] [GPU] HAGS chua BAT - Tang hieu suat GPU
)

:: TdrLevel = 0 la da toi uu
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" 2^>nul ^| findstr "TdrLevel"') do set "tdr_val=%%a"
if not "!tdr_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=tdr"
    call set "desc_%%total_issues%%=[GPU] TDR chua toi uu - Co the crash khi GPU qua tai"
    call echo   [%%total_issues%%] [GPU] TDR chua toi uu
)

:: === KIEM TRA MANG ===
:: TcpWindowSize = 65535 (0xffff) hoac lon hon
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" 2^>nul ^| findstr "TcpWindowSize"') do set "tcp_val=%%a"
if "!tcp_val!"=="" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=tcpwindow"
    call set "desc_%%total_issues%%=[NETWORK] TCP Window Size chua toi uu - Mang cham"
    call echo   [%%total_issues%%] [NETWORK] TCP Window Size chua toi uu
) else if "!tcp_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=tcpwindow"
    call set "desc_%%total_issues%%=[NETWORK] TCP Window Size chua toi uu - Mang cham"
    call echo   [%%total_issues%%] [NETWORK] TCP Window Size chua toi uu
)

:: === KIEM TRA SSD ===
:: NtfsDisableLastAccessUpdate = 1 hoac 0x80000001 la da tat
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" 2^>nul ^| findstr "NtfsDisableLastAccessUpdate"') do set "la_val=%%a"
if "!la_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=lastaccess"
    call set "desc_%%total_issues%%=[SSD] Last Access Update dang BAT - Ghi nhieu vao SSD"
    call echo   [%%total_issues%%] [SSD] Last Access Update dang BAT
)

:: EnablePrefetcher = 0 la da tat
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" 2^>nul ^| findstr "EnablePrefetcher"') do set "pf_val=%%a"
if not "!pf_val!"=="0x0" (
    set /a total_issues+=1
    call set "issue_%%total_issues%%=prefetch"
    call set "desc_%%total_issues%%=[SSD] Prefetch dang BAT - Khong can thiet tren SSD"
    call echo   [%%total_issues%%] [SSD] Prefetch dang BAT
)

echo.
if !total_issues!==0 (
    echo  +==============================================================================+
    echo  ^|  [OK] HE THONG DA DUOC TOI UU HOAN TOAN! Khong co van de nao.               ^|
    echo  +==============================================================================+
    echo.
    pause
    goto menu_chinh
)

echo  +==============================================================================+
echo  ^|  TIM THAY !total_issues! VAN DE CAN TOI UU                                            ^|
echo  +==============================================================================+
echo.
echo  [A] TOI UU TAT CA !total_issues! van de (Khuyen nghi)
echo  [1-!total_issues!] Nhap so de toi uu TUNG VAN DE rieng le
echo  [0] Quay lai menu chinh
echo.
set /p scan_choice=  Nhap lua chon: 

if /i "%scan_choice%"=="A" goto toi_uu_tat_ca_scan
if "%scan_choice%"=="0" goto menu_chinh

:: Xu ly chon tung van de
if %scan_choice% GEQ 1 if %scan_choice% LEQ %total_issues% (
    call set "fix_issue=%%issue_%scan_choice%%%"
    call set "fix_desc=%%desc_%scan_choice%%%"
    call :fix_single_issue
    goto quet_he_thong
)
goto quet_he_thong

:: =====================================================
:: FIX TUNG VAN DE RIENG LE
:: =====================================================
:fix_single_issue
echo.
echo  [INFO] Dang toi uu: !fix_desc!
echo.

:: Services
if "!fix_issue:~0,4!"=="svc_" (
    set "svc_name=!fix_issue:~4!"
    sc stop "!svc_name!" >nul 2>&1
    sc config "!svc_name!" start=disabled >nul 2>&1
    echo  [OK] Da tat service: !svc_name!
    goto :fix_done
)

:: GameDVR
if "!fix_issue!"=="gamedvr" (
    reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d "0" /f >nul 2>&1
    echo  [OK] Da tat GameDVR!
    goto :fix_done
)

:: Background Apps
if "!fix_issue!"=="bgapps" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d "1" /f >nul 2>&1
    echo  [OK] Da tat Background Apps!
    goto :fix_done
)

:: Telemetry
if "!fix_issue!"=="telemetry" (
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
    echo  [OK] Da tat Telemetry!
    goto :fix_done
)

:: Power Throttling
if "!fix_issue!"=="powerthrottle" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
    echo  [OK] Da tat Power Throttling!
    goto :fix_done
)

:: Network Throttling
if "!fix_issue!"=="netthrottle" (
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f >nul 2>&1
    echo  [OK] Da tat Network Throttling!
    goto :fix_done
)

:: Timer Resolution
if "!fix_issue!"=="timer" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
    echo  [OK] Da bat Timer Resolution!
    goto :fix_done
)

:: Mouse Acceleration
if "!fix_issue!"=="mouseaccel" (
    reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d "0" /f >nul 2>&1
    reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d "0" /f >nul 2>&1
    reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d "0" /f >nul 2>&1
    echo  [OK] Da tat Mouse Acceleration!
    goto :fix_done
)

:: Mouse Queue
if "!fix_issue!"=="mousequeue" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d "16" /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d "16" /f >nul 2>&1
    echo  [OK] Da toi uu Mouse/Keyboard Queue!
    goto :fix_done
)

:: Priority Separation
if "!fix_issue!"=="priority" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1
    echo  [OK] Da toi uu Priority Separation!
    goto :fix_done
)

:: Connected Standby
if "!fix_issue!"=="cstandby" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
    echo  [OK] Da tat Connected Standby!
    goto :fix_done
)

:: HAGS
if "!fix_issue!"=="hags" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
    echo  [OK] Da bat HAGS! Can khoi dong lai de ap dung.
    goto :fix_done
)

:: TDR
if "!fix_issue!"=="tdr" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "60" /f >nul 2>&1
    echo  [OK] Da toi uu TDR!
    goto :fix_done
)

:: TCP Window
if "!fix_issue!"=="tcpwindow" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1
    echo  [OK] Da toi uu TCP Window Size!
    goto :fix_done
)

:: Last Access
if "!fix_issue!"=="lastaccess" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
    fsutil behavior set disablelastaccess 1 >nul 2>&1
    echo  [OK] Da tat Last Access Update!
    goto :fix_done
)

:: Prefetch
if "!fix_issue!"=="prefetch" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
    echo  [OK] Da tat Prefetch!
    goto :fix_done
)

:fix_done
echo  [%DATE% %TIME%] Fix: !fix_desc! >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto :eof

:: =====================================================
:: TOI UU TAT CA VAN DE TIM THAY
:: =====================================================
:toi_uu_tat_ca_scan
cls
echo.
echo  +======================================================================+
echo  ^|              DANG TOI UU TAT CA !total_issues! VAN DE TIM THAY...                ^|
echo  +======================================================================+
echo.

echo  [1/7] Dang tat cac Services khong can thiet...
for %%s in (DiagTrack dmwappushservice MapsBroker WSearch SysMain WerSvc XblAuthManager XblGameSave XboxNetApiSvc lfsvc Fax RemoteRegistry RetailDemo AJRouter ALG TrkWks WalletService WdiServiceHost WdiSystemHost TabletInputService SensorDataService PhoneSvc WbioSrvc icssvc iphlpsvc FontCache) do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start=disabled >nul 2>&1
)
echo  [OK] Da tat Services!

echo  [2/7] Dang toi uu cai dat he thong...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
echo  [OK] Da toi uu he thong!

echo  [3/7] Dang toi uu CHUOT (Mouse)...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d "10" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d "16" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d "16" /f >nul 2>&1
echo  [OK] Da toi uu chuot!

echo  [4/7] Dang toi uu CPU...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "CoalescingTimerDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
echo  [OK] Da toi uu CPU!

echo  [5/7] Dang toi uu GPU...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "60" /f >nul 2>&1
echo  [OK] Da toi uu GPU!

echo  [6/7] Dang toi uu Mang...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
echo  [OK] Da toi uu mang!

echo  [7/7] Dang toi uu SSD/Disk...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
echo  [OK] Da toi uu SSD!

echo.
echo  [THANH CONG] Da toi uu TAT CA van de tim thay!
echo  [%DATE% %TIME%] Toi uu tu Scan toan dien >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:xuat_bao_cao_scan
set "report_file=C:\GL-TWEAK_Logs\ScanReport_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.txt"
echo ============================================ > "%report_file%"
echo  GL-TWEAK 1.0.2 - BAO CAO QUET HE THONG >> "%report_file%"
echo  Ngay: %DATE% %TIME% >> "%report_file%"
echo ============================================ >> "%report_file%"
echo. >> "%report_file%"
echo === DICH VU DANG CHAY === >> "%report_file%"
for %%s in (DiagTrack dmwappushservice MapsBroker WSearch SysMain WerSvc XblAuthManager XblGameSave lfsvc Fax RemoteRegistry RetailDemo) do (
    sc query "%%s" 2>nul | findstr /i "RUNNING" >nul && echo %%s - DANG CHAY >> "%report_file%"
)
echo. >> "%report_file%"
echo [THANH CONG] Da xuat bao cao tai: %report_file%
start notepad "%report_file%"
pause
goto quet_he_thong


:: =====================================================
:: [A] TU DONG TOI UU - HOI TUNG BUOC
:: Nguoi dung chon CPU/GPU cua minh
:: =====================================================
:tu_dong_toi_uu_hoi
cls
echo.
echo  +==============================================================================+
echo  ^|              TU DONG TOI UU - HOI TUNG BUOC                                  ^|
echo  ^|              (Ban se duoc hoi de chon dung loai phan cung)                   ^|
echo  +==============================================================================+
echo.
echo  [INFO] Che do nay se toi uu tung phan va hoi ban truoc moi buoc.
echo  [INFO] Ban chi can tra loi Y (Co) hoac N (Khong) cho moi cau hoi.
echo.
echo  Ban co muon bat dau? (Y/N)
set /p start_auto=  Nhap lua chon: 
if /i not "%start_auto%"=="Y" goto menu_chinh

:: =====================================================
:: BUOC 1: TAO DIEM KHOI PHUC
:: =====================================================
:auto_step1
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 1/10: TAO DIEM KHOI PHUC HE THONG                              ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Diem khoi phuc giup ban quay lai trang thai truoc khi tweak
echo  - Neu co loi xay ra, ban co the khoi phuc lai he thong
echo  - RAT KHUYEN NGHI tao diem khoi phuc truoc khi tweak
echo.
echo  Ban co muon tao diem khoi phuc? (Y/N)
set /p step1=  Nhap lua chon: 
if /i "%step1%"=="Y" (
    echo  [INFO] Dang tao diem khoi phuc...
    reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
    PowerShell -Command "Checkpoint-Computer -Description 'GL-TWEAK_1.0.2_Backup' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
    echo  [OK] Da tao diem khoi phuc!
)
goto auto_step2

:: =====================================================
:: BUOC 2: TOI UU GIAO DIEN
:: =====================================================
:auto_step2
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 2/10: TOI UU GIAO DIEN WINDOWS                                 ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Tat hieu ung trong suot, animation de giam lag
echo  - Tat Bing Search, Widgets, Task View tren taskbar
echo  - Giam MenuShowDelay de menu hien nhanh hon
echo  - Doi Right Click Menu ve kieu Windows 10 (nhanh hon)
echo.
echo  [TAC DONG] Giao dien se don gian hon nhung NHANH hon
echo.
echo  Ban co muon toi uu giao dien? (Y/N)
set /p step2=  Nhap lua chon: 
if /i "%step2%"=="Y" (
    echo  [INFO] Dang toi uu giao dien...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f >nul 2>&1
    Powershell -NoProfile -Command "New-Item -Path 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}' -Name 'InprocServer32' -Force -Value ''" >nul 2>&1
    echo  [OK] Da toi uu giao dien!
)
goto auto_step3

:: =====================================================
:: BUOC 3: TOI UU HE THONG
:: =====================================================
:auto_step3
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 3/10: TOI UU CAI DAT HE THONG                                  ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Tat thong bao phien phuc (Notifications)
echo  - Tat ung dung chay nen (Background Apps) - GIAM RAM
echo  - Tat Mouse Acceleration - Chuot chinh xac hon khi choi game
echo  - Tat Sticky Keys, Filter Keys - Khong bi popup khi nhan Shift
echo  - Bat HAGS (Hardware Accelerated GPU Scheduling) - TANG FPS
echo  - Tat GameDVR - GIAM LAG khi choi game
echo.
echo  [TAC DONG] He thong se nhanh hon, it lag hon khi choi game
echo.
echo  Ban co muon toi uu he thong? (Y/N)
set /p step3=  Nhap lua chon: 
if /i "%step3%"=="Y" (
    echo  [INFO] Dang toi uu he thong...
    reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d "0" /f >nul 2>&1
    reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d "0" /f >nul 2>&1
    reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d "0" /f >nul 2>&1
    reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "506" /f >nul 2>&1
    reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d "122" /f >nul 2>&1
    reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d "58" /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
    reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d "0" /f >nul 2>&1
    echo  [OK] Da toi uu he thong!
)
goto auto_step4

:: =====================================================
:: BUOC 4: XOA TELEMETRY
:: =====================================================
:auto_step4
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 4/10: XOA TELEMETRY (THU THAP DU LIEU)                         ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Microsoft thu thap du lieu su dung cua ban (Telemetry)
echo  - Bao gom: lich su hoat dong, vi tri, loi he thong, v.v.
echo  - Tat Telemetry giup bao ve quyen rieng tu
echo  - Dong thoi GIAM TAI cho CPU va mang
echo.
echo  [TAC DONG] Bao ve rieng tu, giam tai he thong
echo.
echo  Ban co muon tat Telemetry? (Y/N)
set /p step4=  Nhap lua chon: 
if /i "%step4%"=="Y" (
    echo  [INFO] Dang tat Telemetry...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d "1" /f >nul 2>&1
    sc config "DiagTrack" start= disabled >nul 2>&1
    sc stop "DiagTrack" >nul 2>&1
    echo  [OK] Da tat Telemetry!
)
goto auto_step5

:: =====================================================
:: BUOC 5: VO HIEU SERVICES
:: =====================================================
:auto_step5
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 5/10: VO HIEU HOA SERVICES KHONG CAN THIET                     ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Windows chay nhieu dich vu nen khong can thiet
echo  - Vi du: Fax, Xbox services, Maps, Retail Demo, v.v.
echo  - Tat cac dich vu nay giup GIAM RAM va TANG TOC khoi dong
echo.
echo  [DANH SACH SE TAT]
echo  - DiagTrack (Thu thap du lieu)
echo  - dmwappushservice (WAP Push)
echo  - MapsBroker (Ban do offline)
echo  - WSearch (Tim kiem - dung Everything thay the)
echo  - SysMain/Superfetch (Ton RAM tren SSD)
echo  - Fax, RetailDemo, RemoteRegistry
echo  - Xbox services (neu khong choi Xbox)
echo.
echo  [TAC DONG] Giam 200-500MB RAM, boot nhanh hon
echo.
echo  Ban co muon tat cac services nay? (Y/N)
set /p step5=  Nhap lua chon: 
if /i "%step5%"=="Y" (
    echo  [INFO] Dang tat services...
    for %%s in (DiagTrack dmwappushservice MapsBroker WSearch SysMain WerSvc lfsvc RetailDemo AJRouter Fax RemoteRegistry TrkWks WalletService XblAuthManager XblGameSave XboxNetApiSvc) do (
        sc stop "%%s" >nul 2>&1
        sc config "%%s" start=disabled >nul 2>&1
    )
    echo  [OK] Da tat services!
)
goto auto_step6

:: =====================================================
:: BUOC 6: TOI UU CPU - HOI LOAI CPU
:: =====================================================
:auto_step6
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 6/10: TOI UU CPU                                               ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Toi uu CPU giup tang hieu suat xu ly
echo  - Tat Power Throttling - CPU chay het cong suat
echo  - Toi uu Priority - Uu tien CPU cho game/ung dung
echo  - Toi uu bcdedit - Boot nhanh hon, timer chinh xac hon
echo.
echo  [QUAN TRONG] Ban dang dung CPU gi?
echo.
echo  [1] INTEL (Core i3, i5, i7, i9, Pentium, Celeron)
echo  [2] AMD (Ryzen 3, 5, 7, 9, Athlon)
echo  [0] Bo qua buoc nay
echo.
set /p cpu_type=  Nhap lua chon (1/2/0): 

if "%cpu_type%"=="1" goto auto_cpu_intel
if "%cpu_type%"=="2" goto auto_cpu_amd
if "%cpu_type%"=="0" goto auto_step7
goto auto_step6

:auto_cpu_intel
echo.
echo  [INFO] Dang toi uu cho CPU INTEL...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "CoalescingTimerDisabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set useplatformclock no >nul 2>&1
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1
powercfg -setactive SCHEME_CURRENT >nul 2>&1
echo  [OK] Da toi uu CPU Intel!
goto auto_step7

:auto_cpu_amd
echo.
echo  [INFO] Dang toi uu cho CPU AMD...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "CoalescingTimerDisabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set useplatformclock no >nul 2>&1
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1
powercfg -setactive SCHEME_CURRENT >nul 2>&1
echo  [OK] Da toi uu CPU AMD!
goto auto_step7

:: =====================================================
:: BUOC 7: TOI UU GPU - HOI LOAI GPU
:: =====================================================
:auto_step7
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 7/10: TOI UU GPU (CARD DO HOA)                                 ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Toi uu GPU giup TANG FPS trong game
echo  - Tat cac tinh nang tiet kiem dien cua GPU
echo  - Toi uu driver settings de hieu suat cao nhat
echo.
echo  [QUAN TRONG] Ban dang dung GPU gi?
echo.
echo  [1] NVIDIA (GeForce GTX, RTX)
echo  [2] AMD (Radeon RX, Vega)
echo  [3] INTEL (Intel UHD, Iris, Arc)
echo  [0] Bo qua buoc nay
echo.
set /p gpu_type=  Nhap lua chon (1/2/3/0): 

if "%gpu_type%"=="1" goto auto_gpu_nvidia
if "%gpu_type%"=="2" goto auto_gpu_amd
if "%gpu_type%"=="3" goto auto_gpu_intel
if "%gpu_type%"=="0" goto auto_step8
goto auto_step7

:auto_gpu_nvidia
echo.
echo  [INFO] Dang toi uu cho GPU NVIDIA...
echo  [INFO] Ap dung 30+ tweaks cho NVIDIA...

:: Xoa NVIDIA Telemetry
if exist "%ProgramFiles%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL" (
    rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer >NUL 2>&1
)

:: GPU Power 100%
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPREFERENCE 1 >nul 2>&1
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPOWER 100 >nul 2>&1

:: Tat Preemption
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableGfxPreemption /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableComputePreemption /t REG_DWORD /d 0 /f >nul 2>&1

:: Bat DirectFlip
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f >nul 2>&1

:: Thread Priority
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f >nul 2>&1

:: Tat Dynamic Pstate
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v DisableDynamicPstate /t REG_DWORD /d 1 /f >nul 2>&1

:: TDR Settings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "60" /f >nul 2>&1

:: NvControlPanel
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "PowerMizerDefault" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f >nul 2>&1

:: Xoa cache
del /q "%localappdata%\NVIDIA\DXCache\*" >nul 2>&1
del /q "%localappdata%\NVIDIA\GLCache\*" >nul 2>&1

powercfg -setactive SCHEME_CURRENT >nul 2>&1
echo  [OK] Da toi uu GPU NVIDIA!
goto auto_step8

:auto_gpu_amd
echo.
echo  [INFO] Dang toi uu cho GPU AMD...

:: Tat Radeon Boost
for /f %%k in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /s /f "KMD_RadeonBoostEnabled" 2^>nul ^| findstr "HKEY"') do (
    reg add "%%k" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
)

:: Tat Chill
reg add "HKLM\System\CurrentControlSet\Services\amdwddmg" /v "ChillEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Tat DeLag
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Tat Thermal Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >nul 2>&1

:: Tat AMD services
reg add "HKLM\System\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

:: Tat Auto Update
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [OK] Da toi uu GPU AMD!
goto auto_step8

:auto_gpu_intel
echo.
echo  [INFO] Dang toi uu cho GPU INTEL...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f >nul 2>&1
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPOWER 100 >nul 2>&1
powercfg -setactive SCHEME_CURRENT >nul 2>&1
echo  [OK] Da toi uu GPU Intel!
goto auto_step8


:: =====================================================
:: BUOC 8: TOI UU MANG
:: =====================================================
:auto_step8
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 8/10: TOI UU MANG (NETWORK)                                    ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Toi uu TCP/IP giup GIAM PING khi choi game online
echo  - Tat Nagle Algorithm - Giam do tre gui du lieu
echo  - Bat TCP Fast Open - Ket noi nhanh hon
echo  - Tang TCP Window Size - Download/Upload nhanh hon
echo.
echo  [TAC DONG] Giam ping 5-20ms, tang toc mang
echo.
echo  Ban co muon toi uu mang? (Y/N)
set /p step8=  Nhap lua chon: 
if /i "%step8%"=="Y" (
    echo  [INFO] Dang toi uu mang...
    netsh int tcp set global timestamps=disabled >nul 2>&1
    netsh int tcp set global rss=enabled >nul 2>&1
    netsh int tcp set global fastopen=enabled >nul 2>&1
    netsh int tcp set global ecncapability=disabled >nul 2>&1
    netsh int tcp set global autotuninglevel=normal >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65534 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f >nul 2>&1
    for /f %%r in ('reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /f "1" /d /s 2^>nul ^| Findstr HKEY_') do (
        reg.exe add %%r /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
        reg.exe add %%r /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
    )
    echo  [OK] Da toi uu mang!
)
goto auto_step9

:: =====================================================
:: BUOC 9: TOI UU GAME PRIORITY
:: =====================================================
:auto_step9
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 9/10: TOI UU GAME PRIORITY                                     ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Uu tien tai nguyen CPU/GPU cho game
echo  - Tang GPU Priority va Scheduling Category
echo  - Tat Network Throttling khi choi game
echo  - Dat SystemResponsiveness = 0 (100%% cho game)
echo.
echo  [TAC DONG] Game duoc uu tien cao nhat, it bi giat lag
echo.
echo  Ban co muon toi uu Game Priority? (Y/N)
set /p step9=  Nhap lua chon: 
if /i "%step9%"=="Y" (
    echo  [INFO] Dang toi uu Game Priority...
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1
    echo  [OK] Da toi uu Game Priority!
)
goto auto_step10

:: =====================================================
:: BUOC 10: DON DEP HE THONG
:: =====================================================
:auto_step10
cls
echo.
echo  +======================================================================+
echo  ^|  BUOC 10/10: DON DEP HE THONG                                        ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Xoa file tam (Temp files) - Giai phong dung luong
echo  - Xoa cache trinh duyet - Giai phong them dung luong
echo  - Flush DNS - Lam moi cache DNS
echo  - Xoa Prefetch - Giai phong RAM
echo.
echo  [TAC DONG] Giai phong 500MB - 5GB dung luong
echo.
echo  Ban co muon don dep he thong? (Y/N)
set /p step10=  Nhap lua chon: 
if /i "%step10%"=="Y" (
    echo  [INFO] Dang don dep he thong...
    del /q /f /s "%TEMP%\*" >nul 2>&1
    del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
    del /q /f "C:\Windows\Prefetch\*" >nul 2>&1
    del /q /f /s "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
    del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
    del /q /f /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
    ipconfig /flushdns >nul 2>&1
    del /q /f /s "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1
    echo  [OK] Da don dep he thong!
)

:: HOAN TAT
cls
echo.
echo  +==============================================================================+
echo  ^|                                                                              ^|
echo  ^|              HOAN TAT TOI UU TU DONG!                                        ^|
echo  ^|                                                                              ^|
echo  +==============================================================================+
echo.
echo  [THANH CONG] Da hoan tat qua trinh toi uu tu dong!
echo.
echo  [KHUYEN NGHI]
echo  - Khoi dong lai may tinh de ap dung tat ca thay doi
echo  - Neu gap loi, su dung diem khoi phuc da tao de quay lai
echo.
echo  [%DATE% %TIME%] Hoan tat toi uu tu dong >> "C:\GL-TWEAK_Logs\Log.txt"
echo.
echo  Ban co muon khoi dong lai may ngay bay gio? (Y/N)
set /p restart=  Nhap lua chon: 
if /i "%restart%"=="Y" (
    shutdown /r /t 5 /c "GL-TWEAK 1.0.2 - Khoi dong lai de ap dung thay doi"
    exit
)
pause
goto menu_chinh

:: =====================================================
:: TELEGRAM COMMUNITY
:: =====================================================
:telegram_community
cls
echo.
echo  +======================================================================+
echo  ^|              THAM GIA CONG DONG TELEGRAM                             ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang mo link Telegram...
start "" "https://t.me/+SlOFlECVgNk2OWY1"
echo.
echo  [THANH CONG] Da mo link Telegram trong trinh duyet!
echo  [INFO] Hay tham gia de nhan ho tro va cap nhat moi nhat!
echo.
pause
goto menu_chinh

:: =====================================================
:: 1. TAO DIEM KHOI PHUC HE THONG
:: =====================================================
:tao_restore_point
cls
echo.
echo  +======================================================================+
echo  ^|              TAO DIEM KHOI PHUC HE THONG                             ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Diem khoi phuc la "anh chup" trang thai he thong hien tai
echo  - Neu tweak gay loi, ban co the quay lai trang thai nay
echo  - Rat quan trong truoc khi thuc hien bat ky thay doi nao
echo.
echo  [INFO] Dang bat System Protection...
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
sc config VSS start=demand >nul 2>&1
sc config swprv start=demand >nul 2>&1

echo  [INFO] Dang tao diem khoi phuc...
echo  [INFO] Ten: GL-TWEAK_1.0.2_Backup
echo.
PowerShell -Command "Checkpoint-Computer -Description 'GL-TWEAK_1.0.2_Backup' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
if %errorlevel% equ 0 (
    echo  [THANH CONG] Da tao diem khoi phuc thanh cong!
    echo.
    echo  [HUONG DAN KHOI PHUC]
    echo  1. Vao Settings ^> System ^> About ^> System Protection
    echo  2. Click "System Restore"
    echo  3. Chon diem khoi phuc: GL-TWEAK_1.0.2_Backup
) else (
    echo  [LOI] Khong the tao diem khoi phuc!
    echo  [GOI Y] Thu chay lai voi quyen Administrator
)
echo.
echo  [%DATE% %TIME%] Tao diem khoi phuc >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 2. TOI UU GIAO DIEN WINDOWS
:: =====================================================
:toi_uu_giao_dien
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU GIAO DIEN WINDOWS                                ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Hien duoi file: De nhan biet loai file (.exe, .txt, .bat)
echo  - Tat Bing Search: Khong tim kiem tren Bing khi search Start Menu
echo  - Tat Widgets: Tat bang tin tuc ben trai taskbar
echo  - Tat Task View: Tat nut xem cac desktop ao
echo  - Tat Transparency: Tat hieu ung trong suot, giam lag
echo  - Giam MenuShowDelay: Menu hien ngay lap tuc
echo  - Doi Right Click Menu: Ve kieu Windows 10, nhanh hon
echo.
echo  [1/15] Hien duoi file...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d "0" /f >nul 2>&1

echo  [2/15] Hien file an...
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d "1" /f >nul 2>&1

echo  [3/15] Tat Meet Now...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d "1" /f >nul 2>&1

echo  [4/15] Tat Bing Search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d "0" /f >nul 2>&1

echo  [5/15] Tat nut Search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d "0" /f >nul 2>&1

echo  [6/15] Tat nut Widgets...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d "0" /f >nul 2>&1

echo  [7/15] Tat nut Task View...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d "0" /f >nul 2>&1

echo  [8/15] Tat News va Interests...
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d "0" /f >nul 2>&1

echo  [9/15] Tat Transparency Effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d "0" /f >nul 2>&1

echo  [10/15] Mo File Explorer vao This PC...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "LaunchTo" /t REG_DWORD /d "1" >nul 2>&1

echo  [11/15] Can trai Taskbar...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d "0" /f >nul 2>&1

echo  [12/15] Giam MenuShowDelay...
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1

echo  [13/15] Tat animations...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [14/15] Tat Aero Peek...
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [15/15] Doi Right Click Menu ve Win 10...
Powershell -NoProfile -Command "New-Item -Path 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}' -Name 'InprocServer32' -Force -Value ''" >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu giao dien Windows!
echo  [%DATE% %TIME%] Toi uu giao dien >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh


:: =====================================================
:: 3. TOI UU CAI DAT HE THONG
:: =====================================================
:toi_uu_he_thong
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU CAI DAT HE THONG                                 ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Tat Notifications: Khong bi lam phien boi thong bao
echo  - Tat Background Apps: Ung dung khong chay nen, tiet kiem RAM
echo  - Tat Mouse Acceleration: Chuot di chuyen chinh xac hon
echo  - Tat Sticky Keys: Khong bi popup khi nhan Shift 5 lan
echo  - Bat HAGS: GPU xu ly tot hon, tang FPS
echo  - Tat GameDVR: Khong ghi hinh nen, giam lag
echo  - Tat Network Throttling: Mang khong bi gioi han
echo.
echo  [1/18] Tat Notifications...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d "1" /f >nul 2>&1

echo  [2/18] Tat Background Apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d "1" /f >nul 2>&1

echo  [3/18] Tat Mouse Acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d "0" /f >nul 2>&1

echo  [4/18] Tat Sticky, Filter, Toggle Keys...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "506" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d "122" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d "58" /f >nul 2>&1

echo  [5/18] Bat Hardware Accelerated GPU Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1

echo  [6/18] Tat GameDVR...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d "0" /f >nul 2>&1

echo  [7/18] Tat Gamemode...
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [8/18] Tat Storage Sense...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v 01 /t REG_DWORD /d "0" /f >nul 2>&1

echo  [9/18] Tat Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f >nul 2>&1

echo  [10/18] Tat IPv6...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f >nul 2>&1

echo  [11/18] Tat Teredo...
netsh interface teredo set state disabled >nul 2>&1

echo  [12/18] Giam WaitToKillAppTimeout...
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f >nul 2>&1

echo  [13/18] Giam HungAppTimeout...
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f >nul 2>&1

echo  [14/18] Bat AutoEndTasks...
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_DWORD /d "1" /f >nul 2>&1

echo  [15/18] Tat Hibernate...
powercfg -h off >nul 2>&1

echo  [16/18] Toi uu NTFS...
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set memoryusage 2 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1

echo  [17/18] Tang SvcHostSplitThreshold...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 380000000 /f >nul 2>&1

echo  [18/18] Bat GlobalTimerResolutionRequests...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu cai dat he thong!
echo  [%DATE% %TIME%] Toi uu he thong >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 4. XOA TELEMETRY
:: =====================================================
:xoa_telemetry
cls
echo.
echo  +======================================================================+
echo  ^|              XOA TELEMETRY VA THU THAP DU LIEU                       ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Telemetry: Microsoft thu thap du lieu su dung cua ban
echo  - Activity History: Lich su hoat dong cua ban
echo  - Location Services: Theo doi vi tri cua ban
echo  - Error Reporting: Gui bao cao loi ve Microsoft
echo  - Advertising ID: ID quang cao de hien thi quang cao
echo  - Tat tat ca giup bao ve quyen rieng tu va giam tai he thong
echo.
echo  [1/12] Tat Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [2/12] Tat Location Services...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1

echo  [3/12] Tat Data Collection...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1

echo  [4/12] Tat Windows Error Reporting...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d "1" /f >nul 2>&1

echo  [5/12] Tat Driver Searching...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d "0" /f >nul 2>&1

echo  [6/12] Tat WiFi Hotspot Reporting...
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "Value" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [7/12] Tat Remote Assistance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d "0" /f >nul 2>&1

echo  [8/12] Tat Delivery Optimization...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d "0" /f >nul 2>&1

echo  [9/12] Tat Windows Feedback...
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d "0" /f >nul 2>&1

echo  [10/12] Tat Content Delivery...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d "0" /f >nul 2>&1

echo  [11/12] Tat Advertising ID...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d "1" /f >nul 2>&1

echo  [12/12] Tat DiagTrack service...
sc config "DiagTrack" start= disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1

echo.
echo  [THANH CONG] Da xoa telemetry va thu thap du lieu!
echo  [%DATE% %TIME%] Xoa telemetry >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 5. VO HIEU HOA SERVICES
:: =====================================================
:vo_hieu_services
cls
echo.
echo  +======================================================================+
echo  ^|              VO HIEU HOA SERVICES KHONG CAN THIET                    ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - DiagTrack: Thu thap du lieu gui ve Microsoft
echo  - WSearch: Tim kiem Windows (dung Everything thay the)
echo  - SysMain: Superfetch, ton RAM tren SSD
echo  - Fax: Dich vu Fax, khong ai dung
echo  - MapsBroker: Ban do offline
echo  - Xbox services: Neu khong choi game Xbox
echo  - RemoteRegistry: Nguy hiem, cho phep truy cap tu xa
echo.
echo  [INFO] Dang backup Services Registry...
reg export "HKLM\System\CurrentControlSet\Services" "C:\GL-TWEAK_Logs\ServicesBackup.reg" /y >nul 2>&1

echo  [1/20] Tat AJRouter (AllJoyn Router)...
sc config AJRouter start=disabled >nul 2>&1

echo  [2/20] Tat ALG (Application Layer Gateway)...
sc config ALG start=disabled >nul 2>&1

echo  [3/20] Tat BITS (Background Intelligent Transfer)...
sc config BITS start=disabled >nul 2>&1

echo  [4/20] Tat Bluetooth services...
sc config BTAGService start=disabled >nul 2>&1
sc config bthserv start=disabled >nul 2>&1

echo  [5/20] Tat DiagTrack (Diagnostics Tracking)...
sc config DiagTrack start=disabled >nul 2>&1

echo  [6/20] Tat dmwappushservice...
sc config dmwappushservice start=disabled >nul 2>&1

echo  [7/20] Tat Fax...
sc config Fax start=disabled >nul 2>&1

echo  [8/20] Tat lfsvc (Geolocation)...
sc config lfsvc start=disabled >nul 2>&1

echo  [9/20] Tat MapsBroker...
sc config MapsBroker start=disabled >nul 2>&1

echo  [10/20] Tat RetailDemo...
sc config RetailDemo start=disabled >nul 2>&1

echo  [11/20] Tat RemoteRegistry...
sc config RemoteRegistry start=disabled >nul 2>&1

echo  [12/20] Tat TrkWks (Distributed Link Tracking)...
sc config TrkWks start=disabled >nul 2>&1

echo  [13/20] Tat WalletService...
sc config WalletService start=disabled >nul 2>&1

echo  [14/20] Tat WerSvc (Windows Error Reporting)...
sc config WerSvc start=disabled >nul 2>&1

echo  [15/20] Tat WdiServiceHost...
sc config WdiServiceHost start=disabled >nul 2>&1

echo  [16/20] Tat WdiSystemHost...
sc config WdiSystemHost start=disabled >nul 2>&1

echo  [17/20] Tat WSearch (Windows Search)...
sc config WSearch start=disabled >nul 2>&1

echo  [18/20] Tat XblAuthManager (Xbox Live Auth)...
sc config XblAuthManager start=disabled >nul 2>&1

echo  [19/20] Tat XblGameSave (Xbox Live Game Save)...
sc config XblGameSave start=disabled >nul 2>&1

echo  [20/20] Tat XboxNetApiSvc...
sc config XboxNetApiSvc start=disabled >nul 2>&1

echo.
echo  [THANH CONG] Da vo hieu hoa services khong can thiet!
echo  [INFO] Backup luu tai: C:\GL-TWEAK_Logs\ServicesBackup.reg
echo  [%DATE% %TIME%] Vo hieu services >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 6. TOI UU CPU
:: =====================================================
:toi_uu_cpu
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU CPU (INTEL/AMD)                                  ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Tat Power Throttling: CPU chay het cong suat
echo  - Toi uu Priority: Uu tien CPU cho ung dung dang chay
echo  - Toi uu bcdedit: Boot nhanh hon, timer chinh xac hon
echo  - Tat Connected Standby: Khong bi giam hieu suat khi ngu
echo.
echo  [1] Toi uu cho CPU INTEL (Core i3, i5, i7, i9)
echo  [2] Toi uu cho CPU AMD (Ryzen 3, 5, 7, 9)
echo  [0] Quay lai menu chinh
echo.
set /p cpu_choice=  Nhap lua chon: 

if "%cpu_choice%"=="1" goto toi_uu_intel
if "%cpu_choice%"=="2" goto toi_uu_amd
if "%cpu_choice%"=="0" goto menu_chinh
goto toi_uu_cpu

:toi_uu_intel
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU CPU INTEL                                        ^|
echo  +======================================================================+
echo.
echo  [1/15] Tat BAM service...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo  [2/15] Dat CPU Performance 100%%...
for /f "tokens=4" %%A in ('powercfg -getactivescheme') do set ACTIVE_GUID=%%A
powercfg -setacvalueindex %ACTIVE_GUID% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100 >nul 2>&1
powercfg -setacvalueindex %ACTIVE_GUID% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100 >nul 2>&1

echo  [3/15] Toi uu TCP/IP...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1

echo  [4/15] Dat GPU Priority cho Games...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1

echo  [5/15] Dat Win32PrioritySeparation...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1

echo  [6/15] Tat Power Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [7/15] Tat Dynamic Tick...
bcdedit /set disabledynamictick yes >nul 2>&1

echo  [8/15] Bat TSC Sync Policy...
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1

echo  [9/15] Tat Platform Clock...
bcdedit /set useplatformclock no >nul 2>&1

echo  [10/15] Tat Connected Standby...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [11/15] Tat ASPM (PCI Express)...
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1

echo  [12/15] Dat IRQ Priority...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [13/15] Toi uu csrss.exe...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d 3 /f >nul 2>&1

echo  [14/15] Bat NoLazyMode...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NoLazyMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v AlwaysOn /t REG_DWORD /d 1 /f >nul 2>&1

echo  [15/15] Ap dung Power Scheme...
powercfg -setactive SCHEME_CURRENT >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu CPU Intel!
echo  [%DATE% %TIME%] Toi uu CPU Intel >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:toi_uu_amd
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU CPU AMD                                          ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang ap dung cac toi uu cho AMD CPU...

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set useplatformclock no >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NoLazyMode /t REG_DWORD /d 1 /f >nul 2>&1
powercfg -setactive SCHEME_CURRENT >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu CPU AMD!
echo  [%DATE% %TIME%] Toi uu CPU AMD >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh


:: =====================================================
:: 7. TOI UU GPU
:: =====================================================
:toi_uu_gpu
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU GPU (NVIDIA/AMD/INTEL)                           ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Toi uu GPU giup tang FPS trong game
echo  - Tat cac tinh nang tiet kiem dien
echo  - Toi uu driver settings
echo  - Xoa cache GPU de lam moi
echo.
echo  [1] Toi uu GPU NVIDIA (GeForce GTX, RTX)
echo  [2] Toi uu GPU AMD (Radeon RX, Vega)
echo  [3] Toi uu GPU INTEL (Intel UHD, Iris, Arc)
echo  [0] Quay lai menu chinh
echo.
set /p gpu_choice=  Nhap lua chon: 

if "%gpu_choice%"=="1" goto toi_uu_nvidia
if "%gpu_choice%"=="2" goto toi_uu_amd_gpu
if "%gpu_choice%"=="3" goto toi_uu_intel_gpu
if "%gpu_choice%"=="0" goto menu_chinh
goto toi_uu_gpu

:toi_uu_nvidia
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU GPU NVIDIA (50+ TWEAKS)                          ^|
echo  +======================================================================+
echo.
echo  [1/25] Xoa NVIDIA Telemetry...
if exist "%ProgramFiles%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL" (
    rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer >NUL 2>&1
)

echo  [2/25] Dat GPU Power 100%%...
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPREFERENCE 1 >nul 2>&1
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPOWER 100 >nul 2>&1

echo  [3/25] Tat Gfx/Compute Preemption...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableGfxPreemption /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableComputePreemption /t REG_DWORD /d 0 /f >nul 2>&1

echo  [4/25] Bat DirectFlip...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [5/25] Dat Thread Priority 31...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f >nul 2>&1

echo  [6/25] Bat RmGpsPsEnablePerCpuCoreDpc...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [7/25] Tat Dynamic Pstate...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v DisableDynamicPstate /t REG_DWORD /d 1 /f >nul 2>&1

echo  [8/25] Toi uu TDR...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "60" /f >nul 2>&1

echo  [9/25] Toi uu Class 0000...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePowerManagement" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [10/25] Toi uu NvControlPanel...
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "PowerMizerDefault" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [11/25] Bat HAGS...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1

echo  [12/25] Tat PCIe ASPM...
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1

echo  [13/25] Xoa NVIDIA cache...
del /q "%localappdata%\NVIDIA\DXCache\*" >nul 2>&1
del /q "%localappdata%\NVIDIA\GLCache\*" >nul 2>&1

echo  [14/25-25] Ap dung them cac tweaks nang cao...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TurboQueue" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "FastVram" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TexturePrecache" /t REG_DWORD /d "1" /f >nul 2>&1

powercfg -setactive SCHEME_CURRENT >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu GPU NVIDIA!
echo  [%DATE% %TIME%] Toi uu GPU NVIDIA >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:toi_uu_amd_gpu
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU GPU AMD                                          ^|
echo  +======================================================================+
echo.
echo  [1/15] Tat Radeon Boost...
for /f %%k in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /s /f "KMD_RadeonBoostEnabled" 2^>nul ^| findstr "HKEY"') do (
    reg add "%%k" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
)

echo  [2/15] Tat Chill...
reg add "HKLM\System\CurrentControlSet\Services\amdwddmg" /v "ChillEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [3/15] Tat DeLag...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [4/15] Tat Thermal Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [5/15] Tat AMD Crash Defender...
reg add "HKLM\System\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo  [6/15] Tat AMD External Events...
reg add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo  [7/15] Tat Auto Update...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [8/15] Tat System Tray...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "SYSTEMTray" /t REG_SZ /d "false" /f >nul 2>&1

echo  [9/15] Bat HAGS...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu GPU AMD!
echo  [%DATE% %TIME%] Toi uu GPU AMD >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:toi_uu_intel_gpu
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU GPU INTEL                                        ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang ap dung cac toi uu cho Intel GPU...

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f >nul 2>&1
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPOWER 100 >nul 2>&1
powercfg -setactive SCHEME_CURRENT >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu GPU Intel!
echo  [%DATE% %TIME%] Toi uu GPU Intel >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 8. TOI UU MANG
:: =====================================================
:toi_uu_mang
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU MANG (NETWORK)                                   ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Tat TCP timestamps: Giam overhead, tang toc
echo  - Bat RSS: Phan phoi xu ly mang tren nhieu CPU
echo  - Bat TCP Fast Open: Ket noi nhanh hon
echo  - Tat Nagle Algorithm: Giam do tre gui du lieu
echo  - Tang TCP Window Size: Download/Upload nhanh hon
echo.
echo  [1/20] Tat TCP timestamps...
netsh int tcp set global timestamps=disabled >nul 2>&1

echo  [2/20] Bat RSS (Receive Side Scaling)...
netsh int tcp set global rss=enabled >nul 2>&1

echo  [3/20] Bat TCP Fast Open...
netsh int tcp set global fastopen=enabled >nul 2>&1

echo  [4/20] Tat ECN...
netsh int tcp set global ecncapability=disabled >nul 2>&1

echo  [5/20] Toi uu TCP Window Size...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1

echo  [6/20] Tang MaxFreeTcbs...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxHashTableSize /t REG_DWORD /d 65536 /f >nul 2>&1

echo  [7/20] Tat Nagle Algorithm...
for /f %%r in ('reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /f "1" /d /s 2^>nul ^| Findstr HKEY_') do (
    reg.exe add %%r /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
    reg.exe add %%r /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
)

echo  [8/20] Tang IRPStackSize...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v IRPStackSize /t REG_DWORD /d "30" /f >nul 2>&1

echo  [9/20] Tat Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f >nul 2>&1

echo  [10/20] Dat MTU 1500...
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent >nul 2>&1
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu mang!
echo  [%DATE% %TIME%] Toi uu mang >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 9. XOA UNG DUNG MICROSOFT
:: =====================================================
:xoa_apps_microsoft
cls
echo.
echo  +======================================================================+
echo  ^|              XOA UNG DUNG MICROSOFT KHONG CAN THIET                  ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Cac ung dung nay thuong khong duoc su dung
echo  - Chiem dung luong va RAM
echo  - Xoa de giai phong tai nguyen
echo.
echo  [CANH BAO] Se xoa: Clipchamp, Bing News, Weather, Copilot, 
echo             Get Help, Solitaire, People, Feedback Hub, Maps,
echo             Xbox apps, Your Phone, Zune Music/Video, Teams
echo.
set /p confirm=  Ban co chac chan muon xoa? (Y/N): 
if /i not "%confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang xoa cac ung dung... (Co the mat vai phut)
echo.

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Clipchamp* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Clipchamp
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Bing News
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Bing Weather
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.Copilot* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Copilot
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Get Help
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Solitaire
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa People
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Feedback Hub
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Maps
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Your Phone
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MSTeams* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Teams

echo.
echo  [THANH CONG] Da xoa cac ung dung Microsoft khong can thiet!
echo  [%DATE% %TIME%] Xoa apps Microsoft >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 10. TAT STARTUP APPS
:: =====================================================
:tat_startup
cls
echo.
echo  +======================================================================+
echo  ^|              TAT STARTUP APPS                                        ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Startup apps la cac ung dung khoi dong cung Windows
echo  - Cang nhieu startup apps, Windows boot cang cham
echo  - Tat cac apps khong can thiet de boot nhanh hon
echo.
echo  [INFO] Dang tat cac ung dung khoi dong cung Windows...
echo.

for /f "skip=2 tokens=1*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" 2^>nul') do (
    if not "%%A"=="(Default)" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "%%A" /t REG_BINARY /d 0300000000000000 /f >nul 2>&1
        echo  - Da tat: %%A
    )
)

echo.
echo  [THANH CONG] Da tat cac startup apps!
echo  [%DATE% %TIME%] Tat startup apps >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 11. TIMER RESOLUTION
:: =====================================================
:timer_resolution
cls
echo.
echo  +======================================================================+
echo  ^|              TIMER RESOLUTION                                        ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Timer Resolution la do chinh xac cua dong ho he thong
echo  - Mac dinh Windows dat 15.6ms, qua cao cho game
echo  - Giam xuong 0.5ms giup game muot hon, it micro-stutter
echo  - Yeu cau: GlobalTimerResolutionRequests phai duoc bat (Windows 11)
echo.
echo  Dang bat GlobalTimerResolutionRequests...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
echo  [THANH CONG] Da bat GlobalTimerResolutionRequests!
echo.
echo  [%DATE% %TIME%] Timer Resolution >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 12. PRIORITY SEPARATION
:: =====================================================
:priority_separation
cls
echo.
echo  +======================================================================+
echo  ^|              PRIORITY SEPARATION                                     ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - Win32PrioritySeparation quyet dinh CPU uu tien cho gi
echo  - Gia tri 26 (0x1A): Uu tien cho ung dung foreground
echo  - Gia tri 38 (0x26): Uu tien cao hon cho foreground
echo  - Tot cho game vi game thuong la foreground app
echo.
echo  [1] Dat gia tri 26 (Khuyen nghi cho game)
echo  [2] Dat gia tri 38 (Uu tien cao hon)
echo  [0] Quay lai
echo.
set /p pri_choice=  Nhap lua chon: 

if "%pri_choice%"=="1" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f >nul 2>&1
    echo  [OK] Da dat Win32PrioritySeparation = 26
)
if "%pri_choice%"=="2" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f >nul 2>&1
    echo  [OK] Da dat Win32PrioritySeparation = 38
)
if "%pri_choice%"=="0" goto menu_chinh
pause
goto menu_chinh


:: =====================================================
:: 13. DON DEP FILE TAM
:: =====================================================
:don_dep_file
cls
echo.
echo  +======================================================================+
echo  ^|              DON DEP FILE TAM                                        ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - File tam (Temp files) tich tu theo thoi gian
echo  - Chiem dung luong o cung
echo  - Xoa de giai phong dung luong
echo.
echo  [INFO] Dang xoa file tam...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
del /q /f "C:\Windows\Prefetch\*" >nul 2>&1
del /q /f /s "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
del /q /f /s "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1
echo  [THANH CONG] Da xoa file tam!
echo  [%DATE% %TIME%] Don dep file tam >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 14. DON DEP MANG
:: =====================================================
:don_dep_mang
cls
echo.
echo  +======================================================================+
echo  ^|              DON DEP MANG (NETWORK CLEANUP)                          ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang don dep mang...
ipconfig /flushdns >nul 2>&1
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1
echo  [THANH CONG] Da don dep mang!
echo  [LUU Y] Can khoi dong lai may de ap dung thay doi.
echo  [%DATE% %TIME%] Don dep mang >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 15. NVIDIA NANG CAO
:: =====================================================
:nvidia_nang_cao
cls
echo.
echo  +======================================================================+
echo  ^|              NVIDIA NANG CAO (50+ TWEAKS)                            ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Day la cac tweak nang cao cho NVIDIA.
echo  Chi ap dung neu ban dang dung card NVIDIA!
echo.
set /p confirm=  Ban co chac chan? (Y/N): 
if /i not "%confirm%"=="Y" goto menu_chinh

call :toi_uu_nvidia
goto menu_chinh

:: =====================================================
:: 16. SERVICES NANG CAO
:: =====================================================
:services_nang_cao
cls
echo.
echo  +======================================================================+
echo  ^|              SERVICES NANG CAO                                       ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang tat them cac services nang cao...
sc config FontCache start=disabled >nul 2>&1
sc config W32Time start=disabled >nul 2>&1
sc config TabletInputService start=disabled >nul 2>&1
sc config SensorDataService start=disabled >nul 2>&1
sc config PhoneSvc start=disabled >nul 2>&1
echo  [THANH CONG] Da tat services nang cao!
echo  [%DATE% %TIME%] Services nang cao >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 17. TAT SCHEDULED TASKS
:: =====================================================
:tat_tasks
cls
echo.
echo  +======================================================================+
echo  ^|              TAT SCHEDULED TASKS                                     ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang tat cac scheduled tasks khong can thiet...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
echo  [THANH CONG] Da tat scheduled tasks!
echo  [%DATE% %TIME%] Tat scheduled tasks >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 18. BCDEDIT TWEAKS
:: =====================================================
:bcdedit_tweaks
cls
echo.
echo  +======================================================================+
echo  ^|              BCDEDIT TWEAKS                                          ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang ap dung bcdedit tweaks...
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set bootux disabled >nul 2>&1
echo  [THANH CONG] Da ap dung bcdedit tweaks!
echo  [%DATE% %TIME%] Bcdedit tweaks >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh


:: =====================================================
:: 19. XOA EDGE/ONEDRIVE
:: =====================================================
:xoa_edge_onedrive
cls
echo.
echo  +======================================================================+
echo  ^|              XOA EDGE/ONEDRIVE/XBOX                                  ^|
echo  +======================================================================+
echo.
echo  [1] Xoa OneDrive
echo  [2] Xoa Xbox Apps
echo  [0] Quay lai
echo.
set /p edge_choice=  Nhap lua chon: 

if "%edge_choice%"=="1" (
    echo  [INFO] Dang xoa OneDrive...
    taskkill /f /im OneDrive.exe >nul 2>&1
    %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
    %SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul 2>&1
    echo  [OK] Da xoa OneDrive!
)
if "%edge_choice%"=="2" (
    echo  [INFO] Dang xoa Xbox Apps...
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Xbox Apps!
)
if "%edge_choice%"=="0" goto menu_chinh
pause
goto xoa_edge_onedrive

:: =====================================================
:: 20. RAM OPTIMIZER
:: =====================================================
:ram_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              RAM OPTIMIZER                                           ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang toi uu RAM...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
sc stop SysMain >nul 2>&1
echo  [THANH CONG] Da toi uu RAM!
echo  [%DATE% %TIME%] RAM Optimizer >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 21. POWER PLAN ULTIMATE
:: =====================================================
:power_plan_ultimate
cls
echo.
echo  +======================================================================+
echo  ^|              POWER PLAN ULTIMATE PERFORMANCE                         ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang kich hoat Ultimate Performance...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
for /f "tokens=4" %%A in ('powercfg -list ^| findstr "Ultimate"') do powercfg -setactive %%A >nul 2>&1
echo  [THANH CONG] Da kich hoat Ultimate Performance!
echo  [%DATE% %TIME%] Power Plan Ultimate >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 22. GAME PRIORITY
:: =====================================================
:game_priority
cls
echo.
echo  +======================================================================+
echo  ^|              GAME PRIORITY TWEAKS                                    ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang ap dung Game Priority Tweaks...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
echo  [THANH CONG] Da ap dung Game Priority Tweaks!
echo  [%DATE% %TIME%] Game Priority >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 30. ROBLOX OPTIMIZER
:: =====================================================
:roblox_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              ROBLOX OPTIMIZER (FFlags)                               ^|
echo  +======================================================================+
echo.
echo  [1] FFlags tang FPS (Khuyen nghi)
echo  [2] FFlags cho may yeu (Giam do hoa toi da)
echo  [3] Xoa FFlags (Khoi phuc mac dinh)
echo  [0] Quay lai
echo.
set /p roblox_choice=  Nhap lua chon: 

if "%roblox_choice%"=="1" goto roblox_fflags_fps
if "%roblox_choice%"=="2" goto roblox_fflags_lowend
if "%roblox_choice%"=="3" goto roblox_fflags_remove
if "%roblox_choice%"=="0" goto menu_chinh
goto roblox_optimizer

:roblox_fflags_fps
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"
if not defined ROBLOX_PATH (
    echo  [LOI] Khong tim thay Roblox!
    pause
    goto roblox_optimizer
)
set "CLIENT_SETTINGS=%ROBLOX_PATH%\ClientSettings"
if not exist "%CLIENT_SETTINGS%" mkdir "%CLIENT_SETTINGS%" >nul 2>&1
(
echo {
echo   "DFIntTaskSchedulerTargetFps": "9999",
echo   "FFlagGameBasicSettingsFramerateCap": "False",
echo   "FFlagDebugGraphicsPreferD3D11": "True",
echo   "FFlagOptimizeNetwork": "True",
echo   "FIntRobloxGuiBlurIntensity": "0"
echo }
) > "%CLIENT_SETTINGS%\ClientAppSettings.json"
echo  [THANH CONG] Da ap dung FFlags tang FPS!
pause
goto roblox_optimizer

:roblox_fflags_lowend
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"
if not defined ROBLOX_PATH (
    echo  [LOI] Khong tim thay Roblox!
    pause
    goto roblox_optimizer
)
set "CLIENT_SETTINGS=%ROBLOX_PATH%\ClientSettings"
if not exist "%CLIENT_SETTINGS%" mkdir "%CLIENT_SETTINGS%" >nul 2>&1
(
echo {
echo   "DFIntTaskSchedulerTargetFps": "60",
echo   "FIntDebugForceMSAASamples": "0",
echo   "FFlagDisablePostFx": "True",
echo   "FIntRenderShadowIntensity": "0",
echo   "DFIntTextureQualityOverride": "0"
echo }
) > "%CLIENT_SETTINGS%\ClientAppSettings.json"
echo  [THANH CONG] Da ap dung FFlags cho may yeu!
pause
goto roblox_optimizer

:roblox_fflags_remove
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"
if defined ROBLOX_PATH (
    del "%ROBLOX_PATH%\ClientSettings\ClientAppSettings.json" >nul 2>&1
    echo  [THANH CONG] Da xoa FFlags!
)
pause
goto roblox_optimizer


:: =====================================================
:: 32. SSD OPTIMIZER
:: =====================================================
:ssd_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              SSD OPTIMIZER                                           ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH CHI TIET]
echo  - TRIM: Giup SSD xoa du lieu hieu qua hon
echo  - Tat Defrag: SSD khong can defrag, chi lam giam tuoi tho
echo  - Tat Prefetch: Khong can thiet tren SSD
echo  - Toi uu NTFS: Giam ghi vao SSD
echo.
echo  [INFO] Dang toi uu SSD...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set memoryusage 2 >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul 2>&1
powercfg -h off >nul 2>&1
echo  [THANH CONG] Da toi uu SSD!
echo  [%DATE% %TIME%] SSD Optimizer >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 33. DEBLOATER NANG CAO
:: =====================================================
:debloater_advanced
cls
echo.
echo  +======================================================================+
echo  ^|              DEBLOATER NANG CAO                                      ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Se xoa 40+ ung dung khong can thiet!
set /p confirm=  Ban co chac chan? (Y/N): 
if /i not "%confirm%"=="Y" goto menu_chinh

echo  [INFO] Dang xoa bloatware...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingFinance* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingNews* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingSports* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Clipchamp* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Copilot* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *GetHelp* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *People* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Todos* | Remove-AppxPackage" >nul 2>&1
echo  [THANH CONG] Da xoa bloatware!
echo  [%DATE% %TIME%] Debloater >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 77. KIEM TRA TWEAKS
:: =====================================================
:kiem_tra_tweaks
cls
echo.
echo  +======================================================================+
echo  ^|              KIEM TRA TWEAKS - GOI Y                                 ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang kiem tra cac dich vu va tweaks...
echo.
echo  === DICH VU DANG CHAY (Co the tat) ===
echo.
sc query "DiagTrack" 2>nul | findstr /i "RUNNING" >nul && echo  - DiagTrack (Thu thap du lieu)
sc query "WSearch" 2>nul | findstr /i "RUNNING" >nul && echo  - WSearch (Tim kiem Windows)
sc query "SysMain" 2>nul | findstr /i "RUNNING" >nul && echo  - SysMain (Superfetch)
sc query "MapsBroker" 2>nul | findstr /i "RUNNING" >nul && echo  - MapsBroker (Ban do)
sc query "XblAuthManager" 2>nul | findstr /i "RUNNING" >nul && echo  - XblAuthManager (Xbox)
echo.
echo  [GOI Y] Dung phim [S] o menu chinh de quet chi tiet hon!
echo.
pause
goto menu_chinh

:: =====================================================
:: 99. FIXERS
:: =====================================================
:fixers
cls
echo.
echo  +======================================================================+
echo  ^|              FIXERS - SUA LOI                                        ^|
echo  +======================================================================+
echo.
echo  [1] Sua loi mang (Reset Winsock)
echo  [2] Sua loi Windows Update
echo  [3] Sua loi file he thong (SFC)
echo  [4] Khoi phuc Services ve mac dinh
echo  [0] Quay lai
echo.
set /p fix_choice=  Nhap lua chon: 

if "%fix_choice%"=="1" (
    echo  [INFO] Dang reset Winsock...
    netsh winsock reset >nul 2>&1
    netsh int ip reset >nul 2>&1
    ipconfig /flushdns >nul 2>&1
    echo  [OK] Da reset Winsock! Can khoi dong lai may.
)
if "%fix_choice%"=="2" (
    echo  [INFO] Dang sua Windows Update...
    sc config wuauserv start=auto >nul 2>&1
    sc config UsoSvc start=auto >nul 2>&1
    net start wuauserv >nul 2>&1
    echo  [OK] Da bat lai Windows Update!
)
if "%fix_choice%"=="3" (
    echo  [INFO] Dang chay SFC... (Co the mat vai phut)
    sfc /scannow
    echo  [OK] Da hoan tat SFC!
)
if "%fix_choice%"=="4" (
    echo  [INFO] Dang khoi phuc Services...
    if exist "C:\GL-TWEAK_Logs\ServicesBackup.reg" (
        reg import "C:\GL-TWEAK_Logs\ServicesBackup.reg" >nul 2>&1
        echo  [OK] Da khoi phuc Services tu backup!
    ) else (
        echo  [LOI] Khong tim thay file backup!
    )
)
if "%fix_choice%"=="0" goto menu_chinh
pause
goto fixers

:: =====================================================
:: THOAT
:: =====================================================
:thoat
cls
echo.
echo  +======================================================================+
echo  ^|              CAM ON BAN DA SU DUNG GL-TWEAK 1.0.2!                   ^|
echo  +======================================================================+
echo.
echo  [INFO] Tat ca thay doi da duoc luu vao Log.
echo  [INFO] Log file: C:\GL-TWEAK_Logs\Log.txt
echo.
echo  [KHUYEN NGHI] Khoi dong lai may de ap dung tat ca thay doi.
echo.
echo  [%DATE% %TIME%] Ket thuc GL-TWEAK >> "C:\GL-TWEAK_Logs\Log.txt"
timeout 3
exit


:: =====================================================
:: SERVICES OPTIMIZER MENU (Tu Platinum 7.3)
:: =====================================================
:services_optimizer_menu
cls
echo.
echo  +======================================================================+
echo  ^|              SERVICES OPTIMIZER - QUAN LY DICH VU                    ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Quan ly bat/tat cac dich vu Windows theo nhu cau
echo  - Moi dich vu deu co giai thich chi tiet
echo.
echo  === TAT/BAT NHOM DICH VU ===
echo  [A] TAT TAT CA Services khong can thiet (Khuyen nghi)
echo  [B] BAT LAI TAT CA Services (Khoi phuc mac dinh)
echo.
echo  === WINDOWS UPDATE ===
echo  [C] TAT Windows Update - Khong tu dong cap nhat, tiet kiem bang thong
echo  [D] BAT Windows Update - Bat lai cap nhat tu dong
echo.
echo  === BLUETOOTH ===
echo  [E] TAT Bluetooth - Neu khong dung thiet bi Bluetooth
echo  [F] BAT Bluetooth - Bat lai Bluetooth
echo.
echo  === REMOTE ACCESS ===
echo  [G] TAT Remote - Tat truy cap tu xa, tang bao mat
echo  [H] BAT Remote - Bat lai truy cap tu xa
echo.
echo  === IN AN ===
echo  [I] TAT Print - Neu khong dung may in
echo  [J] BAT Print - Bat lai dich vu in an
echo.
echo  [0] Quay lai menu chinh
echo.
set /p svc_choice=  Nhap lua chon: 

if /i "%svc_choice%"=="A" goto tat_tat_ca_services
if /i "%svc_choice%"=="B" goto bat_tat_ca_services
if /i "%svc_choice%"=="C" goto tat_windows_update
if /i "%svc_choice%"=="D" goto bat_windows_update
if /i "%svc_choice%"=="E" goto tat_bluetooth
if /i "%svc_choice%"=="F" goto bat_bluetooth
if /i "%svc_choice%"=="G" goto tat_remote
if /i "%svc_choice%"=="H" goto bat_remote
if /i "%svc_choice%"=="I" goto tat_print
if /i "%svc_choice%"=="J" goto bat_print
if "%svc_choice%"=="0" goto menu_chinh
goto services_optimizer_menu

:tat_tat_ca_services
cls
echo  [INFO] Dang tat cac services khong can thiet...
echo.
echo  - DiagTrack: Thu thap du lieu Microsoft
sc config DiagTrack start=disabled >nul 2>&1
echo  - dmwappushservice: Day thong bao WAP
sc config dmwappushservice start=disabled >nul 2>&1
echo  - WSearch: Tim kiem Windows (dung Everything thay the)
sc config WSearch start=disabled >nul 2>&1
echo  - SysMain: Superfetch (khong can tren SSD)
sc config SysMain start=disabled >nul 2>&1
echo  - WerSvc: Bao cao loi Windows
sc config WerSvc start=disabled >nul 2>&1
echo  - MapsBroker: Ban do offline
sc config MapsBroker start=disabled >nul 2>&1
echo  - lfsvc: Dinh vi GPS
sc config lfsvc start=disabled >nul 2>&1
echo  - RetailDemo: Che do demo cua hang
sc config RetailDemo start=disabled >nul 2>&1
echo  - WdiServiceHost: Chan doan he thong
sc config WdiServiceHost start=disabled >nul 2>&1
echo  - WdiSystemHost: Chan doan he thong
sc config WdiSystemHost start=disabled >nul 2>&1
echo  - TrkWks: Theo doi lien ket phan tan
sc config TrkWks start=disabled >nul 2>&1
echo  - WalletService: Vi dien tu
sc config WalletService start=disabled >nul 2>&1
echo.
echo  [THANH CONG] Da tat cac services khong can thiet!
echo  [%DATE% %TIME%] Tat services tu Services Optimizer >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto services_optimizer_menu

:bat_tat_ca_services
cls
echo  [INFO] Dang bat lai cac services...
sc config DiagTrack start=auto >nul 2>&1
sc config dmwappushservice start=auto >nul 2>&1
sc config WSearch start=auto >nul 2>&1
sc config SysMain start=auto >nul 2>&1
sc config WerSvc start=auto >nul 2>&1
sc config MapsBroker start=auto >nul 2>&1
sc config lfsvc start=auto >nul 2>&1
echo  [THANH CONG] Da bat lai cac services!
pause
goto services_optimizer_menu

:tat_windows_update
cls
echo.
echo  +======================================================================+
echo  ^|              TAT WINDOWS UPDATE                                      ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Windows Update tu dong tai va cai dat cap nhat
echo  - Co the gay lag, ton bang thong, khoi dong lai bat ngo
echo  - Tat neu ban muon tu kiem soat viec cap nhat
echo.
echo  [INFO] Dang tat Windows Update...
sc config wuauserv start=disabled >nul 2>&1
sc config UsoSvc start=disabled >nul 2>&1
sc config WaaSMedicSvc start=disabled >nul 2>&1
net stop wuauserv >nul 2>&1
net stop UsoSvc >nul 2>&1
echo  [THANH CONG] Da tat Windows Update!
echo  [LUU Y] Ban se khong nhan duoc cap nhat tu dong nua.
pause
goto services_optimizer_menu

:bat_windows_update
cls
echo  [INFO] Dang bat Windows Update...
sc config wuauserv start=auto >nul 2>&1
sc config UsoSvc start=auto >nul 2>&1
net start wuauserv >nul 2>&1
echo  [THANH CONG] Da bat Windows Update!
pause
goto services_optimizer_menu

:tat_bluetooth
cls
echo.
echo  +======================================================================+
echo  ^|              TAT BLUETOOTH                                           ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Bluetooth dung de ket noi thiet bi khong day
echo  - Neu khong dung tai nghe/chuot/ban phim Bluetooth, nen tat
echo  - Tiet kiem pin va tai nguyen he thong
echo.
echo  [INFO] Dang tat Bluetooth...
sc config BTAGService start=disabled >nul 2>&1
sc config bthserv start=disabled >nul 2>&1
sc config BluetoothUserService start=disabled >nul 2>&1
echo  [THANH CONG] Da tat Bluetooth!
pause
goto services_optimizer_menu

:bat_bluetooth
cls
echo  [INFO] Dang bat Bluetooth...
sc config BTAGService start=auto >nul 2>&1
sc config bthserv start=auto >nul 2>&1
echo  [THANH CONG] Da bat Bluetooth!
pause
goto services_optimizer_menu

:tat_remote
cls
echo.
echo  +======================================================================+
echo  ^|              TAT DICH VU REMOTE                                      ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Remote cho phep nguoi khac truy cap may tinh cua ban tu xa
echo  - Neu khong can ho tro tu xa, nen tat de tang bao mat
echo  - Ngan chan hacker truy cap trai phep
echo.
echo  [INFO] Dang tat dich vu Remote...
sc config RemoteRegistry start=disabled >nul 2>&1
sc config TermService start=disabled >nul 2>&1
sc config SessionEnv start=disabled >nul 2>&1
sc config UmRdpService start=disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1
echo  [THANH CONG] Da tat dich vu Remote!
pause
goto services_optimizer_menu

:bat_remote
cls
echo  [INFO] Dang bat dich vu Remote...
sc config RemoteRegistry start=auto >nul 2>&1
sc config TermService start=auto >nul 2>&1
echo  [THANH CONG] Da bat dich vu Remote!
pause
goto services_optimizer_menu

:tat_print
cls
echo.
echo  +======================================================================+
echo  ^|              TAT DICH VU IN AN                                       ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Print Spooler quan ly hang doi in
echo  - Neu khong co may in, nen tat de tiet kiem tai nguyen
echo  - Cung giup bao mat (PrintNightmare vulnerability)
echo.
echo  [INFO] Dang tat dich vu In an...
sc config Spooler start=disabled >nul 2>&1
net stop Spooler >nul 2>&1
echo  [THANH CONG] Da tat dich vu In an!
pause
goto services_optimizer_menu

:bat_print
cls
echo  [INFO] Dang bat dich vu In an...
sc config Spooler start=auto >nul 2>&1
net start Spooler >nul 2>&1
echo  [THANH CONG] Da bat dich vu In an!
pause
goto services_optimizer_menu


:: =====================================================
:: BACKUP DU LIEU - TINH NANG QUAN TRONG
:: =====================================================
:backup_data
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP DU LIEU                                          ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Backup giup bao ve du lieu quan trong cua ban
echo  - Nen backup truoc khi thuc hien bat ky thay doi lon nao
echo  - Du lieu duoc luu tai C:\GL-TWEAK_Backup\
echo.
echo  [1] Backup Documents, Desktop, Downloads
echo      - Sao luu cac thu muc ca nhan quan trong
echo.
echo  [2] Backup Game Saves (Roblox, Minecraft, Valorant, v.v.)
echo      - Sao luu tien trinh game, khong mat data khi cai lai
echo.
echo  [3] Backup Registry quan trong
echo      - Sao luu cai dat he thong, de khoi phuc neu co loi
echo.
echo  [4] Backup Drivers
echo      - Sao luu driver, de cai lai neu can
echo.
echo  [5] Backup tat ca (1+2+3+4)
echo      - Sao luu toan bo, an toan nhat
echo.
echo  [6] Mo thu muc Backup
echo.
echo  [0] Quay lai
echo.
set /p backup_choice=  Nhap lua chon: 

if "%backup_choice%"=="1" goto backup_user_data
if "%backup_choice%"=="2" goto backup_game_saves
if "%backup_choice%"=="3" goto backup_registry
if "%backup_choice%"=="4" goto backup_drivers
if "%backup_choice%"=="5" goto backup_all
if "%backup_choice%"=="6" goto open_backup_folder
if "%backup_choice%"=="0" goto menu_chinh
goto backup_data

:backup_user_data
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP DOCUMENTS, DESKTOP, DOWNLOADS                    ^|
echo  +======================================================================+
echo.
set "BACKUP_DIR=C:\GL-TWEAK_Backup\UserData_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo.

echo  [1/3] Dang backup Documents...
if exist "%USERPROFILE%\Documents" (
    robocopy "%USERPROFILE%\Documents" "%BACKUP_DIR%\Documents" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Documents - Chua tai lieu, file lam viec
) else (
    echo  [SKIP] Khong tim thay Documents
)

echo  [2/3] Dang backup Desktop...
if exist "%USERPROFILE%\Desktop" (
    robocopy "%USERPROFILE%\Desktop" "%BACKUP_DIR%\Desktop" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Desktop - Chua shortcut va file tren man hinh
) else (
    echo  [SKIP] Khong tim thay Desktop
)

echo  [3/3] Dang backup Downloads...
if exist "%USERPROFILE%\Downloads" (
    robocopy "%USERPROFILE%\Downloads" "%BACKUP_DIR%\Downloads" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Downloads - Chua file da tai xuong
) else (
    echo  [SKIP] Khong tim thay Downloads
)

echo.
echo  [THANH CONG] Da backup xong!
echo  [INFO] Luu tai: %BACKUP_DIR%
echo  [%DATE% %TIME%] Backup UserData >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto backup_data

:backup_game_saves
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP GAME SAVES                                       ^|
echo  +======================================================================+
echo.
set "BACKUP_DIR=C:\GL-TWEAK_Backup\GameSaves_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo  [INFO] Dang quet cac game da cai dat...
echo.

echo  [1/8] Roblox - Game sandbox pho bien...
if exist "%LOCALAPPDATA%\Roblox" (
    robocopy "%LOCALAPPDATA%\Roblox" "%BACKUP_DIR%\Roblox" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Roblox - Da backup cai dat va cache
) else (
    echo  [SKIP] Khong tim thay Roblox
)

echo  [2/8] Minecraft - Game sandbox/survival...
if exist "%APPDATA%\.minecraft" (
    robocopy "%APPDATA%\.minecraft\saves" "%BACKUP_DIR%\Minecraft\saves" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    robocopy "%APPDATA%\.minecraft\resourcepacks" "%BACKUP_DIR%\Minecraft\resourcepacks" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Minecraft - Da backup worlds va resource packs
) else (
    echo  [SKIP] Khong tim thay Minecraft
)

echo  [3/8] Valorant - Game FPS cua Riot...
if exist "%LOCALAPPDATA%\VALORANT\Saved" (
    robocopy "%LOCALAPPDATA%\VALORANT\Saved\Config" "%BACKUP_DIR%\Valorant\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Valorant - Da backup cai dat game
) else (
    echo  [SKIP] Khong tim thay Valorant
)

echo  [4/8] Fortnite - Game Battle Royale...
if exist "%LOCALAPPDATA%\FortniteGame\Saved" (
    robocopy "%LOCALAPPDATA%\FortniteGame\Saved\Config" "%BACKUP_DIR%\Fortnite\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Fortnite - Da backup cai dat game
) else (
    echo  [SKIP] Khong tim thay Fortnite
)

echo  [5/8] GTA V - Game the gioi mo...
if exist "%USERPROFILE%\Documents\Rockstar Games\GTA V" (
    robocopy "%USERPROFILE%\Documents\Rockstar Games\GTA V" "%BACKUP_DIR%\GTAV" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] GTA V - Da backup save game
) else (
    echo  [SKIP] Khong tim thay GTA V
)

echo  [6/8] League of Legends - Game MOBA...
if exist "%USERPROFILE%\Documents\League of Legends" (
    robocopy "%USERPROFILE%\Documents\League of Legends" "%BACKUP_DIR%\LeagueOfLegends" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] League of Legends - Da backup cai dat
) else (
    echo  [SKIP] Khong tim thay League of Legends
)

echo  [7/8] Steam userdata...
for /d %%i in ("C:\Program Files (x86)\Steam\userdata\*") do (
    robocopy "%%i" "%BACKUP_DIR%\Steam\userdata\%%~nxi" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
)
if exist "%BACKUP_DIR%\Steam" (
    echo  [OK] Steam - Da backup cloud saves local
) else (
    echo  [SKIP] Khong tim thay Steam
)

echo  [8/8] Epic Games...
if exist "%LOCALAPPDATA%\EpicGamesLauncher\Saved" (
    robocopy "%LOCALAPPDATA%\EpicGamesLauncher\Saved" "%BACKUP_DIR%\EpicGames" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Epic Games - Da backup cai dat launcher
) else (
    echo  [SKIP] Khong tim thay Epic Games
)

echo.
echo  [THANH CONG] Da backup game saves xong!
echo  [INFO] Luu tai: %BACKUP_DIR%
echo  [%DATE% %TIME%] Backup GameSaves >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto backup_data

:backup_registry
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP REGISTRY QUAN TRONG                              ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Registry chua cai dat he thong Windows
echo  - Backup de khoi phuc neu tweak gay loi
echo  - Double-click file .reg de khoi phuc
echo.
set "BACKUP_DIR=C:\GL-TWEAK_Backup\Registry_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo.

echo  [1/6] CurrentVersion - Cai dat Windows hien tai...
reg export "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKLM_CurrentVersion.reg" /y >nul 2>&1
echo  [OK] CurrentVersion

echo  [2/6] Services - Cai dat dich vu...
reg export "HKLM\SYSTEM\CurrentControlSet\Services" "%BACKUP_DIR%\Services.reg" /y >nul 2>&1
echo  [OK] Services

echo  [3/6] Network (Tcpip) - Cai dat mang...
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip" "%BACKUP_DIR%\Tcpip.reg" /y >nul 2>&1
echo  [OK] Network

echo  [4/6] Power Settings - Cai dat nguon dien...
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Power" "%BACKUP_DIR%\Power.reg" /y >nul 2>&1
echo  [OK] Power Settings

echo  [5/6] GPU Settings - Cai dat card do hoa...
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" "%BACKUP_DIR%\GPU.reg" /y >nul 2>&1
echo  [OK] GPU Settings

echo  [6/6] User Settings - Cai dat nguoi dung...
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKCU_CurrentVersion.reg" /y >nul 2>&1
reg export "HKCU\Control Panel" "%BACKUP_DIR%\ControlPanel.reg" /y >nul 2>&1
echo  [OK] User Settings

echo.
echo  [THANH CONG] Da backup registry xong!
echo  [INFO] Luu tai: %BACKUP_DIR%
echo  [HUONG DAN] De khoi phuc, double-click vao file .reg
echo  [%DATE% %TIME%] Backup Registry >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto backup_data

:backup_drivers
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP DRIVERS                                          ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Drivers la phan mem dieu khien phan cung
echo  - Backup de cai lai neu cap nhat driver bi loi
echo  - Qua trinh nay co the mat vai phut
echo.
set "BACKUP_DIR=C:\GL-TWEAK_Backup\Drivers_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo  [INFO] Dang export drivers... (co the mat vai phut)
echo.

dism /online /export-driver /destination:"%BACKUP_DIR%" >nul 2>&1

if %errorlevel%==0 (
    echo  [THANH CONG] Da backup drivers xong!
    echo  [INFO] Luu tai: %BACKUP_DIR%
    echo.
    echo  [HUONG DAN KHOI PHUC]
    echo  1. Mo Device Manager
    echo  2. Click phai vao thiet bi can cai driver
    echo  3. Chon "Update driver" ^> "Browse my computer"
    echo  4. Chon thu muc: %BACKUP_DIR%
) else (
    echo  [LOI] Khong the backup drivers!
)

echo  [%DATE% %TIME%] Backup Drivers >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto backup_data

:backup_all
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP TAT CA DU LIEU                                   ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Qua trinh nay co the mat 5-15 phut!
echo  Se backup: Documents, Desktop, Downloads, Game Saves, Registry, Drivers
echo.
set /p confirm=  Ban co chac chan muon tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto backup_data

echo.
echo  === BUOC 1/4: BACKUP USER DATA ===
set "BACKUP_DIR=C:\GL-TWEAK_Backup\UserData_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
if exist "%USERPROFILE%\Documents" robocopy "%USERPROFILE%\Documents" "%BACKUP_DIR%\Documents" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%USERPROFILE%\Desktop" robocopy "%USERPROFILE%\Desktop" "%BACKUP_DIR%\Desktop" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%USERPROFILE%\Downloads" robocopy "%USERPROFILE%\Downloads" "%BACKUP_DIR%\Downloads" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
echo  [OK] User Data

echo  === BUOC 2/4: BACKUP GAME SAVES ===
set "BACKUP_DIR=C:\GL-TWEAK_Backup\GameSaves_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
if exist "%LOCALAPPDATA%\Roblox" robocopy "%LOCALAPPDATA%\Roblox" "%BACKUP_DIR%\Roblox" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%APPDATA%\.minecraft\saves" robocopy "%APPDATA%\.minecraft\saves" "%BACKUP_DIR%\Minecraft\saves" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%LOCALAPPDATA%\VALORANT\Saved\Config" robocopy "%LOCALAPPDATA%\VALORANT\Saved\Config" "%BACKUP_DIR%\Valorant\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
echo  [OK] Game Saves

echo  === BUOC 3/4: BACKUP REGISTRY ===
set "BACKUP_DIR=C:\GL-TWEAK_Backup\Registry_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
reg export "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKLM_CurrentVersion.reg" /y >nul 2>&1
reg export "HKLM\SYSTEM\CurrentControlSet\Services" "%BACKUP_DIR%\Services.reg" /y >nul 2>&1
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKCU_CurrentVersion.reg" /y >nul 2>&1
echo  [OK] Registry

echo  === BUOC 4/4: BACKUP DRIVERS ===
set "BACKUP_DIR=C:\GL-TWEAK_Backup\Drivers_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
dism /online /export-driver /destination:"%BACKUP_DIR%" >nul 2>&1
echo  [OK] Drivers

echo.
echo  +======================================================================+
echo  ^|              HOAN TAT BACKUP TAT CA!                                 ^|
echo  +======================================================================+
echo.
echo  [INFO] Tat ca backup duoc luu tai: C:\GL-TWEAK_Backup\
echo  [%DATE% %TIME%] Backup All >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto backup_data

:open_backup_folder
if not exist "C:\GL-TWEAK_Backup" mkdir "C:\GL-TWEAK_Backup" >nul 2>&1
explorer "C:\GL-TWEAK_Backup"
goto backup_data


:: =====================================================
:: INTEL SERVICES - TAT DICH VU INTEL KHONG CAN
:: =====================================================
:intel_services
cls
echo.
echo  +======================================================================+
echo  ^|              INTEL SERVICES OPTIMIZER                                ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Intel cai dat nhieu dich vu chay nen
echo  - Nhieu dich vu khong can thiet cho game
echo  - Tat de giam tai CPU va RAM
echo.
echo  [CANH BAO] Chi ap dung neu ban dung CPU Intel!
echo.
set /p confirm=  Ban co chac chan? (Y/N): 
if /i not "%confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang tat cac dich vu Intel khong can thiet...
echo.

echo  - Intel(R) Content Protection HECI Service
sc config "cplspcon" start=disabled >nul 2>&1

echo  - Intel(R) Dynamic Application Loader Host Interface Service
sc config "jhi_service" start=disabled >nul 2>&1

echo  - Intel(R) Management Engine WMI Provider Registration
sc config "Intel(R) Capability Licensing Service TCP IP Interface" start=disabled >nul 2>&1

echo  - Intel(R) TPM Provisioning Service
sc config "Intel(R) TPM Provisioning Service" start=disabled >nul 2>&1

echo  - Intel(R) PROSet Monitoring Service
sc config "Intel(R) PROSet Monitoring Service" start=disabled >nul 2>&1

echo.
echo  [THANH CONG] Da tat cac dich vu Intel khong can thiet!
echo  [%DATE% %TIME%] Intel Services >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: AMD SERVICES - TAT DICH VU AMD KHONG CAN
:: =====================================================
:amd_services
cls
echo.
echo  +======================================================================+
echo  ^|              AMD SERVICES OPTIMIZER                                  ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - AMD cai dat nhieu dich vu chay nen
echo  - Nhieu dich vu khong can thiet cho game
echo  - Tat de giam tai CPU va RAM
echo.
echo  [CANH BAO] Chi ap dung neu ban dung CPU/GPU AMD!
echo.
set /p confirm=  Ban co chac chan? (Y/N): 
if /i not "%confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang tat cac dich vu AMD khong can thiet...
echo.

echo  - AMD Crash Defender Service - Theo doi crash
sc config "AMD Crash Defender Service" start=disabled >nul 2>&1

echo  - AMD External Events Utility - Su kien ben ngoai
sc config "AMD External Events Utility" start=disabled >nul 2>&1

echo  - AMD Log Utility - Ghi log
reg add "HKLM\System\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo  - AMD User Experience Program - Thu thap du lieu
reg add "HKCU\Software\AMD\CN" /v "UserExperienceProgram" /t REG_DWORD /d "0" /f >nul 2>&1

echo.
echo  [THANH CONG] Da tat cac dich vu AMD khong can thiet!
echo  [%DATE% %TIME%] AMD Services >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: MOUSE/KEYBOARD OPTIMIZER
:: =====================================================
:mouse_keyboard_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              MOUSE/KEYBOARD OPTIMIZER                                ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Toi uu do tre chuot va ban phim
echo  - Tat Mouse Acceleration de aim chinh xac hon
echo  - Giam input lag khi choi game
echo.
echo  [1] Tat Mouse Acceleration (Khuyen nghi cho FPS games)
echo  [2] Toi uu Mouse/Keyboard Queue Size
echo  [3] Tat Sticky Keys, Filter Keys, Toggle Keys
echo  [4] Ap dung tat ca
echo  [0] Quay lai
echo.
set /p mk_choice=  Nhap lua chon: 

if "%mk_choice%"=="1" goto tat_mouse_accel
if "%mk_choice%"=="2" goto toi_uu_queue
if "%mk_choice%"=="3" goto tat_sticky_keys
if "%mk_choice%"=="4" goto toi_uu_mouse_all
if "%mk_choice%"=="0" goto menu_chinh
goto mouse_keyboard_optimizer

:tat_mouse_accel
echo.
echo  [GIAI THICH]
echo  - Mouse Acceleration lam chuot di nhanh hon khi ban di nhanh
echo  - Gay kho khan khi aim trong game FPS
echo  - Tat de chuot di chuyen tuyen tinh, de kiem soat hon
echo.
echo  [INFO] Dang tat Mouse Acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d "0" /f >nul 2>&1
echo  [THANH CONG] Da tat Mouse Acceleration!
pause
goto mouse_keyboard_optimizer

:toi_uu_queue
echo.
echo  [GIAI THICH]
echo  - Queue Size la bo dem cho input chuot/ban phim
echo  - Giam Queue Size giup giam input lag
echo  - Gia tri 16 la toi uu cho game
echo.
echo  [INFO] Dang toi uu Queue Size...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 16 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 16 /f >nul 2>&1
echo  [THANH CONG] Da toi uu Queue Size!
pause
goto mouse_keyboard_optimizer

:tat_sticky_keys
echo.
echo  [GIAI THICH]
echo  - Sticky Keys: Nhan Shift 5 lan se hien popup
echo  - Filter Keys: Giu phim se hien popup
echo  - Toggle Keys: Nhan Caps Lock se co tieng beep
echo  - Tat de khong bi lam phien khi choi game
echo.
echo  [INFO] Dang tat Sticky/Filter/Toggle Keys...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "506" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d "122" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d "58" /f >nul 2>&1
echo  [THANH CONG] Da tat Sticky/Filter/Toggle Keys!
pause
goto mouse_keyboard_optimizer

:toi_uu_mouse_all
echo.
echo  [INFO] Dang ap dung tat ca toi uu Mouse/Keyboard...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 16 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 16 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "506" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d "122" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d "58" /f >nul 2>&1
echo  [THANH CONG] Da ap dung tat ca toi uu Mouse/Keyboard!
echo  [%DATE% %TIME%] Mouse/Keyboard Optimizer >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto mouse_keyboard_optimizer

:: =====================================================
:: VISUAL EFFECTS OPTIMIZER
:: =====================================================
:visual_effects_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              VISUAL EFFECTS OPTIMIZER                                ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Windows co nhieu hieu ung dep mat nhung ton tai nguyen
echo  - Tat hieu ung giup he thong chay nhanh hon
echo  - Dac biet huu ich cho may cau hinh thap
echo.
echo  [1] Tat TAT CA hieu ung (Hieu suat cao nhat)
echo  [2] Giu hieu ung co ban (Can bang)
echo  [3] Khoi phuc hieu ung mac dinh
echo  [0] Quay lai
echo.
set /p ve_choice=  Nhap lua chon: 

if "%ve_choice%"=="1" goto tat_tat_ca_effects
if "%ve_choice%"=="2" goto giu_effects_co_ban
if "%ve_choice%"=="3" goto khoi_phuc_effects
if "%ve_choice%"=="0" goto menu_chinh
goto visual_effects_optimizer

:tat_tat_ca_effects
echo.
echo  [INFO] Dang tat tat ca hieu ung...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f >nul 2>&1
echo  [THANH CONG] Da tat tat ca hieu ung!
pause
goto visual_effects_optimizer

:giu_effects_co_ban
echo.
echo  [INFO] Dang cai dat hieu ung can bang...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f >nul 2>&1
echo  [THANH CONG] Da cai dat hieu ung can bang!
pause
goto visual_effects_optimizer

:khoi_phuc_effects
echo.
echo  [INFO] Dang khoi phuc hieu ung mac dinh...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul 2>&1
echo  [THANH CONG] Da khoi phuc hieu ung mac dinh!
pause
goto visual_effects_optimizer


:: =====================================================
:: MEMORY/RAM CLEANER - LAM SACH RAM
:: =====================================================
:memory_cleaner
cls
echo.
echo  +======================================================================+
echo  ^|              MEMORY/RAM CLEANER                                      ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Giai phong RAM dang bi chiem dung boi cache
echo  - Huu ich khi may chay cham sau thoi gian dai
echo  - Khong can khoi dong lai may
echo.
echo  [1] Giai phong Working Set (Nhanh)
echo  [2] Xoa Standby List (Manh hon)
echo  [3] Xoa Modified Page List
echo  [4] Giai phong tat ca (Khuyen nghi)
echo  [0] Quay lai
echo.
set /p mem_choice=  Nhap lua chon: 

if "%mem_choice%"=="1" goto free_working_set
if "%mem_choice%"=="2" goto clear_standby
if "%mem_choice%"=="3" goto clear_modified
if "%mem_choice%"=="4" goto free_all_memory
if "%mem_choice%"=="0" goto menu_chinh
goto memory_cleaner

:free_working_set
echo.
echo  [INFO] Dang giai phong Working Set...
echo  [INFO] Working Set la RAM dang duoc su dung boi cac ung dung
PowerShell -NoProfile -Command "[System.GC]::Collect()" >nul 2>&1
echo  [THANH CONG] Da giai phong Working Set!
pause
goto memory_cleaner

:clear_standby
echo.
echo  [INFO] Dang xoa Standby List...
echo  [INFO] Standby List la cache RAM, co the giai phong an toan
PowerShell -NoProfile -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()" >nul 2>&1
echo  [THANH CONG] Da xoa Standby List!
pause
goto memory_cleaner

:clear_modified
echo.
echo  [INFO] Dang xoa Modified Page List...
PowerShell -NoProfile -Command "[System.GC]::Collect()" >nul 2>&1
echo  [THANH CONG] Da xoa Modified Page List!
pause
goto memory_cleaner

:free_all_memory
echo.
echo  [INFO] Dang giai phong tat ca RAM...
PowerShell -NoProfile -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); [System.GC]::Collect()" >nul 2>&1
echo  [THANH CONG] Da giai phong RAM!
echo  [%DATE% %TIME%] Memory Cleaner >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto memory_cleaner

:: =====================================================
:: DISK CLEANUP - DON DEP O CUNG
:: =====================================================
:disk_cleanup
cls
echo.
echo  +======================================================================+
echo  ^|              DISK CLEANUP - DON DEP O CUNG                           ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Xoa file tam, cache, log cu
echo  - Giai phong dung luong o cung
echo  - An toan, khong xoa file quan trong
echo.
echo  [1] Xoa file Temp (File tam)
echo  [2] Xoa Prefetch (Cache khoi dong)
echo  [3] Xoa cache trinh duyet (Chrome, Edge, Firefox)
echo  [4] Xoa Windows Update cache
echo  [5] Xoa Recycle Bin (Thung rac)
echo  [6] Xoa tat ca (Khuyen nghi)
echo  [7] Mo Disk Cleanup cua Windows
echo  [0] Quay lai
echo.
set /p disk_choice=  Nhap lua chon: 

if "%disk_choice%"=="1" goto xoa_temp
if "%disk_choice%"=="2" goto xoa_prefetch
if "%disk_choice%"=="3" goto xoa_browser_cache
if "%disk_choice%"=="4" goto xoa_update_cache
if "%disk_choice%"=="5" goto xoa_recycle_bin
if "%disk_choice%"=="6" goto xoa_tat_ca_disk
if "%disk_choice%"=="7" goto mo_disk_cleanup
if "%disk_choice%"=="0" goto menu_chinh
goto disk_cleanup

:xoa_temp
echo.
echo  [INFO] Dang xoa file Temp...
echo  [INFO] File Temp la file tam thoi, an toan de xoa
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
echo  [THANH CONG] Da xoa file Temp!
pause
goto disk_cleanup

:xoa_prefetch
echo.
echo  [INFO] Dang xoa Prefetch...
echo  [INFO] Prefetch la cache giup Windows khoi dong nhanh hon
echo  [INFO] Se duoc tao lai tu dong, an toan de xoa
del /q /f "C:\Windows\Prefetch\*" >nul 2>&1
echo  [THANH CONG] Da xoa Prefetch!
pause
goto disk_cleanup

:xoa_browser_cache
echo.
echo  [INFO] Dang xoa cache trinh duyet...
echo.
echo  - Google Chrome...
del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache\*" >nul 2>&1
echo  - Microsoft Edge...
del /q /f /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
echo  - Mozilla Firefox...
del /q /f /s "%LocalAppData%\Mozilla\Firefox\Profiles\*\cache2\*" >nul 2>&1
echo  - Opera...
del /q /f /s "%AppData%\Opera Software\Opera Stable\Cache\*" >nul 2>&1
echo.
echo  [THANH CONG] Da xoa cache trinh duyet!
echo  [LUU Y] Ban se phai dang nhap lai mot so trang web
pause
goto disk_cleanup

:xoa_update_cache
echo.
echo  [INFO] Dang xoa Windows Update cache...
echo  [INFO] Se xoa file cap nhat cu, giai phong nhieu dung luong
net stop wuauserv >nul 2>&1
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
echo  [THANH CONG] Da xoa Windows Update cache!
pause
goto disk_cleanup

:xoa_recycle_bin
echo.
echo  [INFO] Dang xoa Recycle Bin...
echo  [CANH BAO] File trong thung rac se bi xoa vinh vien!
set /p confirm=  Ban co chac chan? (Y/N): 
if /i "%confirm%"=="Y" (
    rd /s /q C:\$Recycle.Bin >nul 2>&1
    PowerShell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
    echo  [THANH CONG] Da xoa Recycle Bin!
)
pause
goto disk_cleanup

:xoa_tat_ca_disk
echo.
echo  [INFO] Dang xoa tat ca file rac...
echo.
echo  - Xoa Temp files...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
echo  - Xoa Prefetch...
del /q /f "C:\Windows\Prefetch\*" >nul 2>&1
echo  - Xoa cache trinh duyet...
del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /q /f /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
echo  - Xoa thumbnail cache...
del /q /f /s "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
echo  - Xoa Recent files...
del /q /f /s "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1
echo  - Flush DNS...
ipconfig /flushdns >nul 2>&1
echo.
echo  [THANH CONG] Da xoa tat ca file rac!
echo  [%DATE% %TIME%] Disk Cleanup >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto disk_cleanup

:mo_disk_cleanup
echo  [INFO] Dang mo Disk Cleanup cua Windows...
cleanmgr /d C:
goto disk_cleanup

:: =====================================================
:: SYSTEM INFO - THONG TIN HE THONG
:: =====================================================
:system_info
cls
echo.
echo  +======================================================================+
echo  ^|              THONG TIN HE THONG                                      ^|
echo  +======================================================================+
echo.

echo  === THONG TIN CO BAN ===
echo.
for /f "tokens=2 delims==" %%a in ('wmic os get caption /value') do echo  He dieu hanh: %%a
for /f "tokens=2 delims==" %%a in ('wmic os get version /value') do echo  Phien ban: %%a
for /f "tokens=2 delims==" %%a in ('wmic computersystem get totalphysicalmemory /value') do set /a RAM=%%a/1073741824 2>nul
echo  RAM: %RAM% GB
for /f "tokens=2 delims==" %%a in ('wmic cpu get name /value') do echo  CPU: %%a
for /f "tokens=2 delims==" %%a in ('wmic path win32_videocontroller get name /value') do echo  GPU: %%a

echo.
echo  === THONG TIN O CUNG ===
echo.
wmic diskdrive get model,size /format:list 2>nul | findstr /v "^$"

echo.
echo  === THONG TIN MANG ===
echo.
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do echo  IP Address:%%a

echo.
pause
goto menu_chinh

:: =====================================================
:: BENCHMARK - KIEM TRA HIEU SUAT
:: =====================================================
:benchmark
cls
echo.
echo  +======================================================================+
echo  ^|              BENCHMARK - KIEM TRA HIEU SUAT                          ^|
echo  +======================================================================+
echo.
echo  [1] Kiem tra toc do o cung (Disk Speed)
echo  [2] Kiem tra toc do mang (Network Speed)
echo  [3] Kiem tra thoi gian khoi dong (Boot Time)
echo  [4] Mo Task Manager
echo  [5] Mo Resource Monitor
echo  [0] Quay lai
echo.
set /p bench_choice=  Nhap lua chon: 

if "%bench_choice%"=="1" goto bench_disk
if "%bench_choice%"=="2" goto bench_network
if "%bench_choice%"=="3" goto bench_boot
if "%bench_choice%"=="4" goto open_taskmgr
if "%bench_choice%"=="5" goto open_resmon
if "%bench_choice%"=="0" goto menu_chinh
goto benchmark

:bench_disk
echo.
echo  [INFO] Dang kiem tra toc do o cung...
echo  [INFO] Tao file test 100MB...
fsutil file createnew "C:\GL-TWEAK_Logs\disktest.tmp" 104857600 >nul 2>&1
echo  [INFO] Xoa file test...
del "C:\GL-TWEAK_Logs\disktest.tmp" >nul 2>&1
echo  [THANH CONG] Kiem tra hoan tat!
echo  [GOI Y] De kiem tra chi tiet hon, dung CrystalDiskMark
pause
goto benchmark

:bench_network
echo.
echo  [INFO] Dang kiem tra ket noi mang...
echo.
echo  Ping Google DNS (8.8.8.8):
ping 8.8.8.8 -n 4
echo.
echo  Ping Cloudflare DNS (1.1.1.1):
ping 1.1.1.1 -n 4
echo.
echo  [GOI Y] De kiem tra toc do internet, truy cap speedtest.net
pause
goto benchmark

:bench_boot
echo.
echo  [INFO] Thoi gian khoi dong gan nhat:
systeminfo | findstr /i "boot"
echo.
echo  [GOI Y] De xem chi tiet, mo Event Viewer ^> Windows Logs ^> System
pause
goto benchmark

:open_taskmgr
start taskmgr
goto benchmark

:open_resmon
start resmon
goto benchmark


:: =====================================================
:: WIFI OPTIMIZER - TOI UU WIFI
:: =====================================================
:wifi_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              WIFI OPTIMIZER                                          ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Toi uu cai dat WiFi de ket noi on dinh hon
echo  - Giam mat ket noi, tang toc do
echo.
echo  [1] Tat Power Saving cho WiFi Adapter
echo  [2] Reset WiFi Adapter
echo  [3] Xoa va ket noi lai WiFi
echo  [4] Hien thi mat khau WiFi da luu
echo  [0] Quay lai
echo.
set /p wifi_choice=  Nhap lua chon: 

if "%wifi_choice%"=="1" goto wifi_power_saving
if "%wifi_choice%"=="2" goto wifi_reset
if "%wifi_choice%"=="3" goto wifi_reconnect
if "%wifi_choice%"=="4" goto wifi_show_password
if "%wifi_choice%"=="0" goto menu_chinh
goto wifi_optimizer

:wifi_power_saving
echo.
echo  [INFO] Dang tat Power Saving cho WiFi...
echo  [INFO] Power Saving co the gay mat ket noi WiFi
for /f %%a in ('reg.exe query HKLM /v "*WakeOnMagicPacket" /s 2^>nul ^| findstr "HKEY"') do (
    reg.exe add "%%a" /v "PnPCapabilities" /t REG_DWORD /d "24" /f >nul 2>&1
    reg.exe add "%%a" /v "*EEE" /t REG_SZ /d "0" /f >nul 2>&1
    reg.exe add "%%a" /v "EnablePowerManagement" /t REG_SZ /d "0" /f >nul 2>&1
)
powercfg -setacvalueindex SCHEME_CURRENT 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0 >nul 2>&1
powercfg -setactive SCHEME_CURRENT >nul 2>&1
echo  [THANH CONG] Da tat Power Saving cho WiFi!
pause
goto wifi_optimizer

:wifi_reset
echo.
echo  [INFO] Dang reset WiFi Adapter...
netsh wlan disconnect >nul 2>&1
netsh interface set interface "Wi-Fi" disable >nul 2>&1
timeout 2 >nul
netsh interface set interface "Wi-Fi" enable >nul 2>&1
echo  [THANH CONG] Da reset WiFi Adapter!
echo  [INFO] Vui long ket noi lai WiFi
pause
goto wifi_optimizer

:wifi_reconnect
echo.
echo  [INFO] Danh sach WiFi da luu:
netsh wlan show profiles
echo.
set /p wifi_name=  Nhap ten WiFi muon xoa va ket noi lai: 
netsh wlan delete profile name="%wifi_name%" >nul 2>&1
echo  [INFO] Da xoa profile WiFi: %wifi_name%
echo  [INFO] Vui long ket noi lai WiFi tu Settings
pause
goto wifi_optimizer

:wifi_show_password
echo.
echo  [INFO] Danh sach WiFi va mat khau:
echo.
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "Profile"') do (
    set "ssid=%%a"
    setlocal enabledelayedexpansion
    set "ssid=!ssid:~1!"
    echo  WiFi: !ssid!
    for /f "tokens=2 delims=:" %%b in ('netsh wlan show profile name^="!ssid!" key^=clear ^| findstr "Key Content"') do (
        echo  Password:%%b
    )
    echo.
    endlocal
)
pause
goto wifi_optimizer

:: =====================================================
:: GAME BOOSTER - TOI UU KHI CHOI GAME
:: =====================================================
:game_booster
cls
echo.
echo  +======================================================================+
echo  ^|              GAME BOOSTER - TOI UU KHI CHOI GAME                     ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Tat cac ung dung nen de giai phong RAM va CPU
echo  - Tang uu tien cho game
echo  - Nen chay truoc khi choi game
echo.
echo  [1] BAT Game Mode (Tat ung dung nen, tang uu tien)
echo  [2] TAT Game Mode (Khoi phuc binh thuong)
echo  [3] Tat cac ung dung ton tai nguyen
echo  [0] Quay lai
echo.
set /p gb_choice=  Nhap lua chon: 

if "%gb_choice%"=="1" goto game_mode_on
if "%gb_choice%"=="2" goto game_mode_off
if "%gb_choice%"=="3" goto kill_bloat_apps
if "%gb_choice%"=="0" goto menu_chinh
goto game_booster

:game_mode_on
echo.
echo  [INFO] Dang bat Game Mode...
echo.
echo  - Tat Windows Search...
net stop WSearch >nul 2>&1
echo  - Tat Windows Update...
net stop wuauserv >nul 2>&1
echo  - Tat Superfetch...
net stop SysMain >nul 2>&1
echo  - Tat Windows Defender (tam thoi)...
PowerShell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $true" >nul 2>&1
echo  - Dat High Priority cho foreground apps...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1
echo  - Giai phong RAM...
PowerShell -NoProfile -Command "[System.GC]::Collect()" >nul 2>&1
echo.
echo  [THANH CONG] Game Mode da BAT!
echo  [LUU Y] Nho TAT Game Mode sau khi choi game xong
echo  [%DATE% %TIME%] Game Mode ON >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto game_booster

:game_mode_off
echo.
echo  [INFO] Dang tat Game Mode...
echo.
echo  - Bat lai Windows Search...
net start WSearch >nul 2>&1
echo  - Bat lai Windows Update...
net start wuauserv >nul 2>&1
echo  - Bat lai Superfetch...
net start SysMain >nul 2>&1
echo  - Bat lai Windows Defender...
PowerShell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1
echo  - Khoi phuc SystemResponsiveness...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "20" /f >nul 2>&1
echo.
echo  [THANH CONG] Game Mode da TAT!
echo  [%DATE% %TIME%] Game Mode OFF >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto game_booster

:kill_bloat_apps
echo.
echo  [INFO] Dang tat cac ung dung ton tai nguyen...
echo.
taskkill /f /im "OneDrive.exe" >nul 2>&1 && echo  - Da tat OneDrive
taskkill /f /im "Spotify.exe" >nul 2>&1 && echo  - Da tat Spotify
taskkill /f /im "Discord.exe" >nul 2>&1 && echo  - Da tat Discord
taskkill /f /im "Skype.exe" >nul 2>&1 && echo  - Da tat Skype
taskkill /f /im "Teams.exe" >nul 2>&1 && echo  - Da tat Teams
taskkill /f /im "Slack.exe" >nul 2>&1 && echo  - Da tat Slack
taskkill /f /im "Zoom.exe" >nul 2>&1 && echo  - Da tat Zoom
echo.
echo  [THANH CONG] Da tat cac ung dung ton tai nguyen!
pause
goto game_booster

:: =====================================================
:: CONTEXT MENU CUSTOMIZER
:: =====================================================
:context_menu
cls
echo.
echo  +======================================================================+
echo  ^|              CONTEXT MENU CUSTOMIZER                                 ^|
echo  +======================================================================+
echo.
echo  [GIAI THICH]
echo  - Tuy chinh menu chuot phai
echo  - Them/xoa cac tuy chon trong menu
echo.
echo  [1] Doi ve Right Click Menu Windows 10 (Nhanh hon)
echo  [2] Khoi phuc Right Click Menu Windows 11
echo  [3] Them "Open with Notepad" vao menu
echo  [4] Them "Open Command Prompt Here" vao menu
echo  [5] Them "Copy Path" vao menu
echo  [0] Quay lai
echo.
set /p ctx_choice=  Nhap lua chon: 

if "%ctx_choice%"=="1" goto ctx_win10
if "%ctx_choice%"=="2" goto ctx_win11
if "%ctx_choice%"=="3" goto ctx_notepad
if "%ctx_choice%"=="4" goto ctx_cmd
if "%ctx_choice%"=="5" goto ctx_copypath
if "%ctx_choice%"=="0" goto menu_chinh
goto context_menu

:ctx_win10
echo.
echo  [INFO] Dang doi ve Right Click Menu Windows 10...
Powershell -NoProfile -Command "New-Item -Path 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}' -Name 'InprocServer32' -Force -Value ''" >nul 2>&1
echo  [THANH CONG] Da doi ve menu Windows 10!
echo  [LUU Y] Can khoi dong lai Explorer hoac may tinh
pause
goto context_menu

:ctx_win11
echo.
echo  [INFO] Dang khoi phuc Right Click Menu Windows 11...
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
echo  [THANH CONG] Da khoi phuc menu Windows 11!
echo  [LUU Y] Can khoi dong lai Explorer hoac may tinh
pause
goto context_menu

:ctx_notepad
echo.
echo  [INFO] Dang them "Open with Notepad"...
reg add "HKCR\*\shell\Open with Notepad\command" /ve /d "notepad.exe %%1" /f >nul 2>&1
echo  [THANH CONG] Da them "Open with Notepad"!
pause
goto context_menu

:ctx_cmd
echo.
echo  [INFO] Dang them "Open Command Prompt Here"...
reg add "HKCR\Directory\Background\shell\cmd" /ve /d "Open Command Prompt Here" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\cmd\command" /ve /d "cmd.exe /k cd /d %%V" /f >nul 2>&1
echo  [THANH CONG] Da them "Open Command Prompt Here"!
pause
goto context_menu

:ctx_copypath
echo.
echo  [INFO] Dang them "Copy Path"...
reg add "HKCR\*\shell\Copy Path\command" /ve /d "cmd.exe /c echo %%1 | clip" /f >nul 2>&1
echo  [THANH CONG] Da them "Copy Path"!
pause
goto context_menu

