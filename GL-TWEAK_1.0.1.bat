@echo off
setlocal enabledelayedexpansion
cls

:: =====================================================
::  GL-TWEAK 1.0.1 - Windows Optimizer Tieng Viet
:: =====================================================

title GL-TWEAK 1.0.1 - Windows Optimizer
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
echo [%DATE% %TIME%] Bat dau GL-TWEAK >> "C:\GL-TWEAK_Logs\Log.txt"

:: =====================================================
:: DOI WALLPAPER GL-TWEAK
:: =====================================================
echo.
echo  [INFO] Dang tai wallpaper GL-TWEAK...

:: Tao thu muc wallpaper
if not exist "C:\GL-TWEAK_Logs\Wallpaper" mkdir "C:\GL-TWEAK_Logs\Wallpaper" >nul 2>&1

:: Backup wallpaper hien tai
for /f "tokens=2*" %%a in ('reg query "HKCU\Control Panel\Desktop" /v Wallpaper 2^>nul ^| findstr Wallpaper') do set "OLD_WALLPAPER=%%b"
if defined OLD_WALLPAPER (
    echo %OLD_WALLPAPER%> "C:\GL-TWEAK_Logs\Wallpaper\old_wallpaper.txt"
)

:: Download wallpaper GL-TWEAK (dark gaming style)
set "WALLPAPER_URL=https://i.ibytecdn.org/img/image_2026010636163c5085a7d6a66f4a4527b93e724a.jpg"
set "WALLPAPER_PATH=C:\GL-TWEAK_Logs\Wallpaper\GL-TWEAK_Wallpaper.jpg"

if not exist "%WALLPAPER_PATH%" (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%WALLPAPER_URL%', '%WALLPAPER_PATH%')" >nul 2>&1
)

:: Dat wallpaper moi
if exist "%WALLPAPER_PATH%" (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%WALLPAPER_PATH%" /f >nul 2>&1
    reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "10" /f >nul 2>&1
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True >nul 2>&1
    echo  [OK] Da doi wallpaper GL-TWEAK!
) else (
    echo  [SKIP] Khong the tai wallpaper (can ket noi internet)
)
timeout 1 >nul

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
echo  ^|                      PHIEN BAN 1.0.1 - TIENG VIET                            ^|
echo  ^|                                                                              ^|
echo  +==============================================================================+
echo  ^|                         === TOI UU CO BAN ===                                ^|
echo  +==============================================================================+
echo  ^|   [1] TAO DIEM KHOI PHUC HE THONG    [2] TOI UU GIAO DIEN WINDOWS            ^|
echo  ^|   [3] TOI UU CAI DAT HE THONG        [4] XOA TELEMETRY                       ^|
echo  ^|   [5] VO HIEU HOA SERVICES           [6] TOI UU CPU (Intel/AMD)              ^|
echo  ^|   [7] TOI UU GPU (NVIDIA/AMD/Intel)  [8] TOI UU MANG (Network)               ^|
echo  ^|   [9] XOA UNG DUNG MICROSOFT         [10] TAT STARTUP APPS                   ^|
echo  +==============================================================================+
echo  ^|                         === TOI UU NANG CAO ===                              ^|
echo  +==============================================================================+
echo  ^|   [11] TIMER RESOLUTION              [12] PRIORITY SEPARATION                ^|
echo  ^|   [13] DON DEP FILE TAM              [14] DON DEP MANG (Network Cleanup)     ^|
echo  ^|   [15] NVIDIA NANG CAO               [16] SERVICES NANG CAO                  ^|
echo  ^|   [17] TAT SCHEDULED TASKS           [18] BCDEDIT TWEAKS                     ^|
echo  ^|   [19] XOA EDGE/ONEDRIVE/XBOX        [20] RAM OPTIMIZER                      ^|
echo  ^|   [21] POWER PLAN ULTIMATE           [22] GAME PRIORITY TWEAKS               ^|
echo  ^|   [23] XOA SMARTSCREEN               [24] XOA LOCKAPP                        ^|
echo  ^|   [25] DAT GAME PRIORITY             [26] VO HIEU DRIVERS                    ^|
echo  ^|   [27] INTEL SERVICES                [28] AMD SERVICES                       ^|
echo  +==============================================================================+
echo  ^|                         === GAME OPTIMIZER ===                               ^|
echo  +==============================================================================+
echo  ^|   [30] ROBLOX OPTIMIZER (FFlags)                                             ^|
echo  ^|   [32] SSD OPTIMIZER                                                         ^|
echo  +==============================================================================+
echo  ^|                         === TIEN ICH ===                                     ^|
echo  +==============================================================================+
echo  ^|   [77] KIEM TRA TWEAKS (Goi y)       [88] CHAY TAT CA TOI UU (Tu dong)       ^|
echo  ^|   [99] FIXERS - SUA LOI              [29] SERVICES OPTIMIZER (Moi)           ^|
echo  ^|   [31] BACKUP DU LIEU                [33] DEBLOATER NANG CAO                 ^|
echo  +==============================================================================+
echo  ^|                         === CONG DONG ===                                    ^|
echo  +==============================================================================+
echo  ^|   [TG] THAM GIA TELEGRAM COMMUNITY                                           ^|
echo  +==============================================================================+
echo  ^|   [0] THOAT                                                                  ^|
echo  +==============================================================================+
echo.
set /p choice=  Nhap lua chon cua ban: 

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
if "%choice%"=="23" goto xoa_smartscreen
if "%choice%"=="24" goto xoa_lockapp
if "%choice%"=="25" goto dat_game_priority
if "%choice%"=="26" goto vo_hieu_drivers
if "%choice%"=="27" goto intel_services
if "%choice%"=="28" goto amd_services
if "%choice%"=="29" goto services_optimizer_menu
if "%choice%"=="30" goto roblox_optimizer
if "%choice%"=="31" goto backup_data
if "%choice%"=="32" goto ssd_optimizer
if "%choice%"=="33" goto debloater_advanced
if "%choice%"=="77" goto kiem_tra_tweaks
if "%choice%"=="88" goto chay_tat_ca
if "%choice%"=="99" goto fixers
if /i "%choice%"=="TG" goto telegram_community
if "%choice%"=="0" goto thoat
goto menu_chinh

:: =====================================================
:: THAM GIA TELEGRAM COMMUNITY
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
:: SERVICES OPTIMIZER MENU (Moi tu Platinum 7.3)
:: =====================================================
:services_optimizer_menu
cls
echo.
echo  +======================================================================+
echo  ^|              SERVICES OPTIMIZER - QUAN LY DICH VU                    ^|
echo  +======================================================================+
echo.
echo  [A] TAT TAT CA Services khong can thiet
echo  [B] BAT LAI TAT CA Services
echo.
echo  [C] TAT Windows Update
echo  [D] BAT Windows Update
echo.
echo  [E] TAT Bluetooth
echo  [F] BAT Bluetooth
echo.
echo  [G] TAT dich vu truy cap tu xa (Remote)
echo  [H] BAT dich vu truy cap tu xa (Remote)
echo.
echo  [I] TAT dich vu In an (Print)
echo  [J] BAT dich vu In an (Print)
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
sc config DiagTrack start=disabled >nul 2>&1
sc config dmwappushservice start=disabled >nul 2>&1
sc config WSearch start=disabled >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
sc config WerSvc start=disabled >nul 2>&1
sc config MapsBroker start=disabled >nul 2>&1
sc config lfsvc start=disabled >nul 2>&1
sc config RetailDemo start=disabled >nul 2>&1
sc config WdiServiceHost start=disabled >nul 2>&1
sc config WdiSystemHost start=disabled >nul 2>&1
sc config TrkWks start=disabled >nul 2>&1
sc config WalletService start=disabled >nul 2>&1
echo  [THANH CONG] Da tat cac services khong can thiet!
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
echo  [INFO] Dang tat Windows Update...
sc config wuauserv start=disabled >nul 2>&1
sc config UsoSvc start=disabled >nul 2>&1
sc config WaaSMedicSvc start=disabled >nul 2>&1
net stop wuauserv >nul 2>&1
net stop UsoSvc >nul 2>&1
echo  [THANH CONG] Da tat Windows Update!
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
:: 1. TAO DIEM KHOI PHUC HE THONG
:: =====================================================
:tao_restore_point
cls
echo.
echo  +======================================================================+
echo  ^|              TAO DIEM KHOI PHUC HE THONG                             ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang bat System Protection...
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
sc config VSS start=demand >nul 2>&1
sc config swprv start=demand >nul 2>&1

echo  [INFO] Dang tao diem khoi phuc...
echo  [INFO] Ten: GL-TWEAK_Backup
echo  [INFO] Loai: MODIFY_SETTINGS
echo.
PowerShell -Command "Checkpoint-Computer -Description 'GL-TWEAK_Backup' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
if %errorlevel% equ 0 (
    echo  [THANH CONG] Da tao diem khoi phuc thanh cong!
    echo.
    echo  [INFO] De khoi phuc, vao: Control Panel ^> Recovery ^> Open System Restore
    echo  [INFO] Hoac: Settings ^> System ^> About ^> System Protection ^> System Restore
    echo  [INFO] Chon diem khoi phuc: GL-TWEAK_Backup
) else (
    echo  [LOI] Khong the tao diem khoi phuc!
    echo  [GOI Y] Thu chay lai voi quyen Administrator
    echo  [GOI Y] Hoac kiem tra System Protection da bat chua
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
echo  [1] Toi uu cho CPU INTEL
echo  [2] Toi uu cho CPU AMD
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
echo  [1] Toi uu GPU NVIDIA (EXTREME - tu Platinum 7.3)
echo  [2] Toi uu GPU AMD
echo  [3] Toi uu GPU INTEL
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
echo  ^|              TOI UU GPU NVIDIA EXTREME (Platinum 7.3)                ^|
echo  +======================================================================+
echo.
echo  [1/50] Xoa NVIDIA Telemetry...
if exist "%ProgramFiles%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL" (
    rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer >NUL 2>&1
    rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetry >NUL 2>&1
)
del /s %SystemRoot%\System32\DriverStore\FileRepository\NvTelemetry*.dll >NUL 2>&1
rmdir /s /q "%ProgramFiles(x86)%\NVIDIA Corporation\NvTelemetry" 2>nul
rmdir /s /q "%ProgramFiles%\NVIDIA Corporation\NvTelemetry" 2>nul

echo  [2/50] Dat GPU Power 100%%...
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPREFERENCE 1 >nul 2>&1
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUBOOST 0 >nul 2>&1
powercfg /setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPOWER 100 >nul 2>&1
powercfg /setdcvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPREFERENCE 1 >nul 2>&1
powercfg /setdcvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPOWER 100 >nul 2>&1

echo  [3/50] Tat Gfx/Compute Preemption...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableGfxPreemption /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableComputePreemption /t REG_DWORD /d 0 /f >nul 2>&1

echo  [4/50] Tat Miracast va bat DirectFlip...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [5/50] Dat Thread Priority 31...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >nul 2>&1

echo  [6/50] Bat RmGpsPsEnablePerCpuCoreDpc...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [7/50] Bat TurboQueue, FastVram, TexturePrecache...
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TurboQueue" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableVIASBA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableIrongateSBA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableAGPSBA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableAGPFW" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "FastVram" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "ShadowFB" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TexturePrecache" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableFastCopyPixels" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [8/50] Tat TAT CA Preemption (FTS)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "DisablePreemption" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [9/50] Tat Preemption (GraphicsDrivers)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [10/50] Tat Preemption (Scheduler)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableYield" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [11/50] Tat Dynamic Pstate...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v DisableDynamicPstate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v PerfLevelSrc /t REG_DWORD /d 0x3333 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v NoInterference /t REG_DWORD /d 1 /f >nul 2>&1

echo  [12/50] Toi uu Latency...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f >nul 2>&1

echo  [13/50] Tat Display Power Saving...
reg add "HKLM\SYSTEM\ControlSet001\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [14/50] Tat Logging...
reg add "HKLM\SYSTEM\ControlSet001\Services\nvlddmkm" /v "LogWarningEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\nvlddmkm" /v "LogPagingEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\nvlddmkm" /v "LogEventEntries" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\nvlddmkm" /v "LogErrorEntries" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [15/50] Toi uu TDR...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "60" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "60" /f >nul 2>&1

echo  [16/50] Toi uu Class 0000...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /t REG_DWORD /d 0x3333 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerformanceLevel" /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePowerManagement" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePowerManagement" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MessageSignaledInterrupts" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MSISupported" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [17/50] Toi uu NvControlPanel...
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "PowerMizerDefault" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "VsyncBehavior" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "ThreadedOptimization" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "MaxPrerenderedFrames" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\NVIDIA Corporation\Global\NvControlPanel" /v "FrameRateLimiter" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [18/50] Bat HAGS...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1

echo  [19/50] Toi uu Frame Latency...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FrameQueueMode" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MaxFrameLatency" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [20/50] Tat PCIe ASPM...
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1

echo  [21/50] Xoa NVIDIA cache...
del /q "%localappdata%\NVIDIA\DXCache\*" >nul 2>&1
del /q "%localappdata%\NVIDIA\GLCache\*" >nul 2>&1
del /q "%ProgramData%\NVIDIA Corporation\Drs\nvdrsdb0.bin" >nul 2>&1
del /q "%ProgramData%\NVIDIA Corporation\Drs\nvdrsdb1.bin" >nul 2>&1

echo  [22/50] Ap dung Power Scheme...
powercfg -setactive SCHEME_CURRENT >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu GPU NVIDIA EXTREME!
echo  [%DATE% %TIME%] Toi uu GPU NVIDIA EXTREME >> "C:\GL-TWEAK_Logs\Log.txt"
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

echo  [4/15] Tat Triple Buffering...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "EnableTripleBuffering" /t REG_BINARY /d "3000" /f >nul 2>&1

echo  [5/15] Bat Shader Cache...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3100" /f >nul 2>&1

echo  [6/15] Tat Thermal Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [7/15] Tat DMA Power Gating...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f >nul 2>&1

echo  [8/15] Tat AMD Crash Defender...
reg add "HKLM\System\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo  [9/15] Tat AMD External Events...
reg add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo  [10/15] Tat AMD Logging...
reg add "HKLM\System\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo  [11/15] Tat Auto Update...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f >nul 2>&1

echo  [12/15] Tat System Tray...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "SYSTEMTray" /t REG_SZ /d "false" /f >nul 2>&1

echo  [13/15] Tat Web Content...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f >nul 2>&1

echo  [14/15] Tat Toast Notification...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "CN_Hide_Toast_Notification" /t REG_SZ /d "true" /f >nul 2>&1

echo  [15/15] Tat Animation Effect...
Reg.exe add "HKEY_CURRENT_USER\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f >nul 2>&1

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
echo  ^|              TOI UU MANG (Cap nhat tu Platinum 7.3)                  ^|
echo  +======================================================================+
echo.
echo  [1/20] Tat TCP timestamps...
netsh int tcp set global timestamps=disabled >nul 2>&1

echo  [2/20] Tat nonsackrttresiliency...
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1

echo  [3/20] Dat initialrto...
netsh int tcp set global initialrto=2000 >nul 2>&1

echo  [4/20] Bat RSS (Receive Side Scaling)...
netsh int tcp set global rss=enabled >nul 2>&1

echo  [5/20] Tat RSC (Receive Segment Coalescing)...
netsh int tcp set global rsc=disabled >nul 2>&1

echo  [6/20] Dat Auto Tuning Level...
netsh int tcp set global autotuninglevel=normal >nul 2>&1

echo  [7/20] Bat TCP Fast Open...
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set global fastopenfallback=enabled >nul 2>&1

echo  [8/20] Tat Hystart...
netsh int tcp set global hystart=disabled >nul 2>&1

echo  [9/20] Bat DCA...
netsh int tcp set global dca=enabled >nul 2>&1

echo  [10/20] Dat Congestion Provider...
netsh int tcp set global congestionprovider=ctcp >nul 2>&1

echo  [11/20] Tat ECN...
netsh int tcp set global ecncapability=disabled >nul 2>&1

echo  [12/20] Dat ICW (Initial Congestion Window)...
netsh int tcp set supplemental template=custom icw=10 >nul 2>&1

echo  [13/20] Toi uu TCP Window Size...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1

echo  [14/20] Tang MaxFreeTcbs va MaxHashTableSize...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxHashTableSize /t REG_DWORD /d 65536 /f >nul 2>&1

echo  [15/20] Tat Nagle Algorithm (TCPNoDelay)...
for /f %%r in ('reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /f "1" /d /s 2^>nul ^| Findstr HKEY_') do (
    reg.exe add %%r /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
    reg.exe add %%r /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
    reg.exe add %%r /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
)

echo  [16/20] Tang IRPStackSize...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v IRPStackSize /t REG_DWORD /d "30" /f >nul 2>&1

echo  [17/20] Tat QoS NLA...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_SZ /d "1" /f >nul 2>&1

echo  [18/20] Tat Network Connectivity Status Indicator...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v NoActiveProbe /t REG_DWORD /d "1" /f >nul 2>&1

echo  [19/20] Dat MTU 1500...
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent >nul 2>&1
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent >nul 2>&1

echo  [20/20] Tat Power Saving cho Network Adapter...
for /f %%a in ('reg.exe query HKLM /v "*WakeOnMagicPacket" /s 2^>nul ^| findstr "HKEY"') do (
    reg.exe add "%%a" /v "*EEE" /t REG_SZ /d "0" /f >nul 2>&1
    reg.exe add "%%a" /v "*FlowControl" /t REG_SZ /d "0" /f >nul 2>&1
    reg.exe add "%%a" /v "EnablePowerManagement" /t REG_SZ /d "0" /f >nul 2>&1
    reg.exe add "%%a" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f >nul 2>&1
    reg.exe add "%%a" /v "*WakeOnPattern" /t REG_SZ /d "0" /f >nul 2>&1
)

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
echo  [CANH BAO] Qua trinh nay se xoa cac ung dung Microsoft khong can thiet.
echo  Ban co muon tiep tuc? (Y/N)
set /p confirm=  Nhap lua chon: 
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
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Get Started
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Office Hub
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Solitaire
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa People
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Feedback Hub
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Maps
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Xbox TCUI
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Xbox Game Overlay
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Xbox Gaming Overlay
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Your Phone
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Zune Music
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage" >nul 2>&1
echo  - Da xoa Zune Video
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
echo  [INFO] Dang tat cac ung dung khoi dong cung Windows...
echo.

for /f "skip=2 tokens=1*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" 2^>nul') do (
    if not "%%A"=="(Default)" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "%%A" /t REG_BINARY /d 0300000000000000 /f >nul 2>&1
        echo  - Da tat: %%A
    )
)

for /f "skip=2 tokens=1*" %%A in ('reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" 2^>nul') do (
    if not "%%A"=="(Default)" (
        reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "%%A" /t REG_BINARY /d 0300000000000000 /f >nul 2>&1
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
echo  [INFO] Timer Resolution giup giam do tre he thong.
echo  Yeu cau: GlobalTimerResolutionRequests phai duoc bat (Windows 11)
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
echo  [1] Gaming Preset (0x26 = 38) - Tot cho game
echo  [2] Latency Preset (0x24 = 36) - Giam do tre
echo  [3] Balanced Preset (0x1a = 26) - Can bang
echo  [0] Quay lai
echo.
set /p ps_choice=  Nhap lua chon: 

if "%ps_choice%"=="1" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000026" /f >nul 2>&1
    echo  [THANH CONG] Da ap dung Gaming Preset!
)
if "%ps_choice%"=="2" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000024" /f >nul 2>&1
    echo  [THANH CONG] Da ap dung Latency Preset!
)
if "%ps_choice%"=="3" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x1a" /f >nul 2>&1
    echo  [THANH CONG] Da ap dung Balanced Preset!
)
if "%ps_choice%"=="0" goto menu_chinh
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
echo  [INFO] Dang don dep file tam...

del "%LocalAppData%\Microsoft\Windows\INetCache\." /s /f /q >nul 2>&1
del "%temp%" /s /f /q >nul 2>&1
del "%AppData%\Discord\Cache\." /s /f /q >nul 2>&1
del "%AppData%\Discord\Code Cache\." /s /f /q >nul 2>&1
del "C:\Windows\System32\SleepStudy" /s /f /q >nul 2>&1
del "%WINDIR%\Logs" /s /f /q >nul 2>&1
Del /S /F /Q %Windir%\Temp >nul 2>&1
Del /S /F /Q C:\WINDOWS\Prefetch >nul 2>&1

echo  [THANH CONG] Da don dep file tam!
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

ipconfig /release
ipconfig /renew
arp -d *
nbtstat -R
nbtstat -RR
ipconfig /flushdns
ipconfig /registerdns >nul 2>&1

echo.
echo  [THANH CONG] Da don dep mang!
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
echo  ^|              TOI UU NVIDIA NANG CAO (AGGRESSIVE)                     ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Day la cac tweaks manh, co the gay bat on dinh!
echo  Ban co muon tiep tuc? (Y/N)
set /p nv_confirm=  Nhap lua chon: 
if /i not "%nv_confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang ap dung cac tweaks NVIDIA nang cao...

reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "DisablePreemption" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePowerManagement" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePowerManagement" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d 1 /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d 60 /f >nul 2>&1

sc config "NvTelemetryContainer" start= disabled >nul 2>&1
sc stop "NvTelemetryContainer" >nul 2>&1

echo.
echo  [THANH CONG] Da ap dung cac tweaks NVIDIA nang cao!
echo  [%DATE% %TIME%] NVIDIA nang cao >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 16. SERVICES NANG CAO
:: =====================================================
:services_nang_cao
cls
echo.
echo  +======================================================================+
echo  ^|              TAT SERVICES NANG CAO                                   ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Se tat NHIEU services, co the anh huong mot so tinh nang!
echo  Ban co muon tiep tuc? (Y/N)
set /p sv_confirm=  Nhap lua chon: 
if /i not "%sv_confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang tat cac services...

sc config DisplayEnhancementService start= disabled >nul 2>&1
sc config TabletInputService start= disabled >nul 2>&1
sc config SharedAccess start= disabled >nul 2>&1
sc config WpcMonSvc start= disabled >nul 2>&1
sc config SessionEnv start= disabled >nul 2>&1
sc config autotimesvc start= disabled >nul 2>&1
sc config CscService start= disabled >nul 2>&1
sc config SensorDataService start= disabled >nul 2>&1
sc config SensorService start= disabled >nul 2>&1
sc config SensrSvc start= disabled >nul 2>&1
sc config PhoneSvc start= disabled >nul 2>&1
sc config TapiSrv start= disabled >nul 2>&1
sc config UevAgentService start= disabled >nul 2>&1
sc config WebClient start= disabled >nul 2>&1
sc config MixedRealityOpenXRSvc start= disabled >nul 2>&1
sc config stisvc start= disabled >nul 2>&1
sc config WbioSrvc start= disabled >nul 2>&1
sc config icssvc start= disabled >nul 2>&1
sc config Wecsvc start= disabled >nul 2>&1
sc config SEMgrSvc start= disabled >nul 2>&1
sc config iphlpsvc start= disabled >nul 2>&1
sc config BthAvctpSvc start= disabled >nul 2>&1
sc config BDESVC start= disabled >nul 2>&1
sc config cbdhsvc start= disabled >nul 2>&1
sc config CDPSvc start= disabled >nul 2>&1
sc config FontCache start= disabled >nul 2>&1
sc config W32Time start= disabled >nul 2>&1

echo.
echo  [THANH CONG] Da tat cac services nang cao!
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
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable >nul 2>&1

echo.
echo  [THANH CONG] Da tat cac scheduled tasks!
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
echo  ^|              BCDEDIT TWEAKS (BOOT CONFIGURATION)                     ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Thay doi boot configuration co the gay loi khoi dong!
echo  Ban co muon tiep tuc? (Y/N)
set /p bc_confirm=  Nhap lua chon: 
if /i not "%bc_confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang ap dung bcdedit tweaks...

bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set isolatedcontext No >nul 2>&1
bcdedit /set vsmlaunchtype Off >nul 2>&1
bcdedit /set vm No >nul 2>&1
bcdedit /set hypervisorlaunchtype off >nul 2>&1

echo.
echo  [THANH CONG] Da ap dung bcdedit tweaks!
echo  [INFO] Can khoi dong lai de ap dung.
echo  [%DATE% %TIME%] BCDEdit tweaks >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh


:: =====================================================
:: 19. XOA EDGE/ONEDRIVE/XBOX
:: =====================================================
:xoa_edge_onedrive
cls
echo.
echo  +======================================================================+
echo  ^|              XOA EDGE / ONEDRIVE / XBOX BLOAT                        ^|
echo  +======================================================================+
echo.
echo  [1] Xoa Microsoft Edge (HOAN TOAN)
echo  [2] Xoa OneDrive
echo  [3] Xoa Xbox Bloat
echo  [4] Xoa Widgets
echo  [5] Xoa Copilot
echo  [6] Xoa tat ca
echo  [0] Quay lai
echo.
set /p edge_choice=  Nhap lua chon: 

if "%edge_choice%"=="1" (
    echo.
    echo  [INFO] Dang xoa HOAN TOAN Microsoft Edge...
    echo.
    echo  [1/10] Dung tien trinh Edge...
    taskkill /f /im MicrosoftEdgeUpdate.exe >nul 2>&1
    taskkill /f /im msedge.exe >nul 2>&1
    
    echo  [2/10] Xoa thu muc Edge...
    rd /s /q "C:\Program Files (x86)\Microsoft\Edge" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\Temp" >nul 2>&1
    
    echo  [3/10] Xoa shortcut Edge...
    del /f /q "%Appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" >nul 2>&1
    del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" >nul 2>&1
    del /f /q "%AppData%\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk" >nul 2>&1
    del /f /q "C:\Users\Public\Desktop\Microsoft Edge.lnk" >nul 2>&1
    
    echo  [4/10] Xoa registry Edge...
    reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /f >nul 2>&1
    reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /f >nul 2>&1
    reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView" /f >nul 2>&1
    
    echo  [5/10] Xoa Edge Dev Tools...
    takeown /f "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /r /d y >nul 2>&1
    icacls "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /grant Administrators:F /t >nul 2>&1
    rd /s /q "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" >nul 2>&1
    
    echo  [6/10] Xoa Edge khoi Startup...
    for /f "tokens=1" %%V in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" 2^>nul ^| findstr /I "MicrosoftEdge"') do (
        reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "%%V" /f >nul 2>&1
    )
    
    echo  [7/10] Tat Edge Services...
    sc config edgeupdate start=disabled >nul 2>&1
    sc config edgeupdatem start=disabled >nul 2>&1
    sc config MicrosoftEdgeElevationService start=disabled >nul 2>&1
    sc stop edgeupdate >nul 2>&1
    sc stop edgeupdatem >nul 2>&1
    
    echo  [8/10] Chan Edge Update...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "UpdateDefault" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
    
    echo  [9/10] Xoa Edge Appx Package...
    PowerShell -NoProfile -Command "Get-AppxPackage *Microsoft.MicrosoftEdge.Stable* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *Microsoft.Edge.GameAssist* | Remove-AppxPackage" >nul 2>&1
    
    echo  [10/10] Xoa Edge Scheduled Tasks...
    schtasks /delete /tn "\MicrosoftEdgeUpdateTaskMachineCore" /f >nul 2>&1
    schtasks /delete /tn "\MicrosoftEdgeUpdateTaskMachineUA" /f >nul 2>&1
    
    echo.
    echo  [THANH CONG] Da xoa HOAN TOAN Microsoft Edge!
)
if "%edge_choice%"=="2" (
    echo.
    echo  [INFO] Dang xoa OneDrive...
    echo.
    echo  [1/5] Dung Explorer va OneDrive...
    taskkill /F /IM "explorer.exe" >nul 2>&1
    taskkill /F /IM "OneDrive.exe" >nul 2>&1
    
    echo  [2/5] Go cai dat OneDrive...
    if exist "%SystemRoot%\System32\OneDriveSetup.exe" "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall >nul 2>&1
    if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall >nul 2>&1
    
    echo  [3/5] Xoa thu muc OneDrive...
    rd /s /q "%UserProfile%\OneDrive" >nul 2>&1
    rd /s /q "%LocalAppData%\Microsoft\OneDrive" >nul 2>&1
    rd /s /q "%ProgramData%\Microsoft OneDrive" >nul 2>&1
    
    echo  [4/5] Xoa OneDrive khoi Explorer...
    reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f >nul 2>&1
    
    echo  [5/5] Khoi dong lai Explorer...
    start explorer.exe >nul 2>&1
    
    echo.
    echo  [THANH CONG] Da xoa OneDrive!
)
if "%edge_choice%"=="3" (
    echo  [INFO] Dang xoa Xbox Bloat...
    PowerShell -NoProfile -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *XboxApp* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *XboxGameOverlay* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *XboxIdentityProvider* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *XboxSpeechToTextOverlay* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *Microsoft.GamingApp* | Remove-AppxPackage" >nul 2>&1
    sc config XblAuthManager start=disabled >nul 2>&1
    sc config XblGameSave start=disabled >nul 2>&1
    sc config XboxNetApiSvc start=disabled >nul 2>&1
    sc config XboxGipSvc start=disabled >nul 2>&1
    echo  [THANH CONG] Da xoa Xbox Bloat!
)
if "%edge_choice%"=="4" (
    echo  [INFO] Dang xoa Widgets...
    taskkill /F /IM WidgetService.exe >nul 2>&1
    taskkill /F /IM Widgets.exe >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *WebExperience* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage" >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f >nul 2>&1
    echo  [THANH CONG] Da xoa Widgets!
)
if "%edge_choice%"=="5" (
    echo  [INFO] Dang xoa Copilot...
    PowerShell -NoProfile -Command "Get-AppxPackage *Copilot* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -Command "Get-AppxPackage *Microsoft.Windows.Ai.Copilot.Provider* | Remove-AppxPackage" >nul 2>&1
    reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
    echo  [THANH CONG] Da xoa Copilot!
)
if "%edge_choice%"=="6" (
    echo.
    echo  [INFO] Dang xoa TAT CA bloatware...
    echo.
    
    :: Edge
    taskkill /f /im MicrosoftEdgeUpdate.exe >nul 2>&1
    taskkill /f /im msedge.exe >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\Edge" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate" >nul 2>&1
    rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView" >nul 2>&1
    sc config edgeupdate start=disabled >nul 2>&1
    sc config edgeupdatem start=disabled >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f >nul 2>&1
    
    :: OneDrive
    taskkill /F /IM "OneDrive.exe" >nul 2>&1
    if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall >nul 2>&1
    rd /s /q "%UserProfile%\OneDrive" >nul 2>&1
    
    :: Xbox
    PowerShell -NoProfile -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage" >nul 2>&1
    sc config XblAuthManager start=disabled >nul 2>&1
    sc config XblGameSave start=disabled >nul 2>&1
    sc config XboxNetApiSvc start=disabled >nul 2>&1
    
    :: Widgets
    PowerShell -NoProfile -Command "Get-AppxPackage *WebExperience* | Remove-AppxPackage" >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f >nul 2>&1
    
    :: Copilot
    PowerShell -NoProfile -Command "Get-AppxPackage *Copilot* | Remove-AppxPackage" >nul 2>&1
    reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
    
    echo.
    echo  [THANH CONG] Da xoa TAT CA bloatware!
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
echo  ^|              RAM OPTIMIZER (Cap nhat tu Platinum 7.3)                ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang toi uu RAM va Memory...

echo  [1/25] Tat SysMain (Superfetch)...
sc config SysMain start=disabled >nul 2>&1
sc stop SysMain >nul 2>&1

echo  [2/25] Tat Prefetcher va Superfetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [3/25] Toi uu Memory Management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 983040 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f >nul 2>&1

echo  [4/25] Tat Ndu service...
reg add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1

echo  [5/25] Toi uu FileSystem...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMemoryUsage" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "MaximumTunnelEntries" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [6/25] Toi uu fsutil...
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablecompression 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1

echo  [7/25] Toi uu SvcHostSplitThreshold...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d 380000000 /f >nul 2>&1

echo  [8/25] Toi uu Timeout...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f >nul 2>&1

echo  [9/25] Toi uu AFD Parameters...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 16384 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 16384 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d 16384 /f >nul 2>&1

echo  [10/25] Toi uu TCP Parameters...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxHashTableSize" /t REG_DWORD /d 65536 /f >nul 2>&1

echo  [11/25] Toi uu USB...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb" /v "IdleEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [12/25] Toi uu DWM...
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "DisableProcessWindowsGhosting" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [13/25] Toi uu Priority Control...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ13Priority" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [14/25] Toi uu Kernel...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "CoalescingTimerDisabled" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [15/25] Toi uu NDIS...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "MaxNumRssCpus" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "RssBaseCpu" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [16/25] Tat FairShare...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TSFairShare\Disk" /v "EnableFairShare" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TSFairShare\NetFS" /v "EnableFairShare" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [17/25] Toi uu Direct3D...
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MaxLoaderThreads" /t REG_DWORD /d 10 /f >nul 2>&1

echo  [18/25] Toi uu Mouse/Keyboard Queue...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 16 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 16 /f >nul 2>&1

echo  [19/25] Xoa file tam...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
del /q /f "C:\Windows\Prefetch\*" >nul 2>&1

echo  [20/25] Xoa cache trinh duyet...
del /q /f /s "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /q /f /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1

echo  [21/25] Flush DNS...
ipconfig /flushdns >nul 2>&1

echo  [22/25] Xoa Recent files...
del /q /f /s "%AppData%\Microsoft\Windows\Recent\*" >nul 2>&1

echo  [23/25] Xoa Clipboard...
echo off | clip >nul 2>&1

echo  [24/25] Tat Hibernate...
powercfg -h off >nul 2>&1

echo  [25/25] Toi uu bcdedit...
bcdedit /set bootux disabled >nul 2>&1
bcdedit /deletevalue truncatememory >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu RAM va Memory!
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
echo  [1] Kich hoat Ultimate Performance
echo  [2] Toi uu Power Settings
echo  [0] Quay lai
echo.
set /p power_choice=  Nhap lua chon: 

if "%power_choice%"=="1" (
    echo  [INFO] Dang kich hoat Ultimate Performance...
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
    for /f "tokens=4" %%A in ('powercfg -list ^| findstr "Ultimate"') do powercfg -setactive %%A >nul 2>&1
    echo  [THANH CONG] Da kich hoat Ultimate Performance!
)
if "%power_choice%"=="2" (
    echo  [INFO] Dang toi uu Power Settings...
    powercfg -setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 >nul 2>&1
    powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0 >nul 2>&1
    powercfg -setacvalueindex SCHEME_CURRENT SUB_DISK DISKIDLE 0 >nul 2>&1
    powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 0 >nul 2>&1
    powercfg -setacvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 0 >nul 2>&1
    powercfg -setactive SCHEME_CURRENT >nul 2>&1
    echo  [THANH CONG] Da toi uu Power Settings!
)
if "%power_choice%"=="0" goto menu_chinh
pause
goto power_plan_ultimate

:: =====================================================
:: 22. GAME PRIORITY TWEAKS
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
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1

reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >nul 2>&1

reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo.
echo  [THANH CONG] Da ap dung Game Priority Tweaks!
echo  [%DATE% %TIME%] Game Priority >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh


:: =====================================================
:: 77. KIEM TRA TWEAKS - GOI Y
:: =====================================================
:kiem_tra_tweaks
cls
echo.
echo  +======================================================================+
echo  ^|              KIEM TRA VA QUAN LY DICH VU - TWEAKS                    ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang kiem tra cac dich vu va tweaks...
echo.

:: Kiem tra Services
echo  === DICH VU CO BAN DANG CHAY ===
echo.
set "found_svc=0"
set "svc_count=0"

sc query "DiagTrack" 2>nul | findstr /i "RUNNING" >nul && echo  [1] DiagTrack ^(Diagnostics Tracking^) && set "found_svc=1" && set /a svc_count+=1
sc query "dmwappushservice" 2>nul | findstr /i "RUNNING" >nul && echo  [2] dmwappushservice ^(WAP Push^) && set "found_svc=1" && set /a svc_count+=1
sc query "MapsBroker" 2>nul | findstr /i "RUNNING" >nul && echo  [3] MapsBroker ^(Maps^) && set "found_svc=1" && set /a svc_count+=1
sc query "WSearch" 2>nul | findstr /i "RUNNING" >nul && echo  [4] WSearch ^(Windows Search^) && set "found_svc=1" && set /a svc_count+=1
sc query "SysMain" 2>nul | findstr /i "RUNNING" >nul && echo  [5] SysMain ^(Superfetch^) && set "found_svc=1" && set /a svc_count+=1
sc query "AJRouter" 2>nul | findstr /i "RUNNING" >nul && echo  [6] AJRouter ^(AllJoyn^) && set "found_svc=1" && set /a svc_count+=1
sc query "Fax" 2>nul | findstr /i "RUNNING" >nul && echo  [7] Fax && set "found_svc=1" && set /a svc_count+=1
sc query "lfsvc" 2>nul | findstr /i "RUNNING" >nul && echo  [8] lfsvc ^(Geolocation^) && set "found_svc=1" && set /a svc_count+=1
sc query "RetailDemo" 2>nul | findstr /i "RUNNING" >nul && echo  [9] RetailDemo && set "found_svc=1" && set /a svc_count+=1
sc query "RemoteRegistry" 2>nul | findstr /i "RUNNING" >nul && echo  [10] RemoteRegistry && set "found_svc=1" && set /a svc_count+=1
sc query "WerSvc" 2>nul | findstr /i "RUNNING" >nul && echo  [11] WerSvc ^(Error Reporting^) && set "found_svc=1" && set /a svc_count+=1
sc query "XblAuthManager" 2>nul | findstr /i "RUNNING" >nul && echo  [12] XblAuthManager ^(Xbox^) && set "found_svc=1" && set /a svc_count+=1
sc query "XblGameSave" 2>nul | findstr /i "RUNNING" >nul && echo  [13] XblGameSave ^(Xbox^) && set "found_svc=1" && set /a svc_count+=1
sc query "XboxNetApiSvc" 2>nul | findstr /i "RUNNING" >nul && echo  [14] XboxNetApiSvc ^(Xbox^) && set "found_svc=1" && set /a svc_count+=1
sc query "TabletInputService" 2>nul | findstr /i "RUNNING" >nul && echo  [15] TabletInputService ^(Tablet^) && set "found_svc=1" && set /a svc_count+=1
sc query "SensorDataService" 2>nul | findstr /i "RUNNING" >nul && echo  [16] SensorDataService && set "found_svc=1" && set /a svc_count+=1
sc query "PhoneSvc" 2>nul | findstr /i "RUNNING" >nul && echo  [17] PhoneSvc && set "found_svc=1" && set /a svc_count+=1
sc query "WbioSrvc" 2>nul | findstr /i "RUNNING" >nul && echo  [18] WbioSrvc ^(Biometric^) && set "found_svc=1" && set /a svc_count+=1
sc query "icssvc" 2>nul | findstr /i "RUNNING" >nul && echo  [19] icssvc ^(Hotspot^) && set "found_svc=1" && set /a svc_count+=1
sc query "iphlpsvc" 2>nul | findstr /i "RUNNING" >nul && echo  [20] iphlpsvc ^(IP Helper^) && set "found_svc=1" && set /a svc_count+=1

if "%found_svc%"=="0" echo  [OK] Tat ca dich vu da duoc tat!

echo.
echo  +----------------------------------------------------------------------+
echo  ^|                         MENU LUA CHON                                ^|
echo  +----------------------------------------------------------------------+
echo.
echo  [A] TAT TAT CA dich vu dang chay (1-20)
echo  [B] Ap dung TAT CA tweaks chua ap dung
echo  [C] Xuat bao cao ra file
echo.
echo  [1-20] Chon so de TAT tung dich vu rieng le
echo.
echo  [0] Quay lai menu chinh
echo.
set /p check_choice=  Nhap lua chon: 

if /i "%check_choice%"=="A" goto tat_tat_ca_svc_77
if /i "%check_choice%"=="B" goto ap_dung_tat_ca_tweaks_77
if /i "%check_choice%"=="C" goto xuat_bao_cao_77
if "%check_choice%"=="0" goto menu_chinh

:: Xu ly chon tung dich vu
if "%check_choice%"=="1" (
    echo  [INFO] Dang tat DiagTrack...
    sc stop "DiagTrack" >nul 2>&1 & sc config "DiagTrack" start=disabled >nul 2>&1
    echo  [OK] Da tat DiagTrack!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="2" (
    echo  [INFO] Dang tat dmwappushservice...
    sc stop "dmwappushservice" >nul 2>&1 & sc config "dmwappushservice" start=disabled >nul 2>&1
    echo  [OK] Da tat dmwappushservice!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="3" (
    echo  [INFO] Dang tat MapsBroker...
    sc stop "MapsBroker" >nul 2>&1 & sc config "MapsBroker" start=disabled >nul 2>&1
    echo  [OK] Da tat MapsBroker!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="4" (
    echo  [INFO] Dang tat WSearch...
    sc stop "WSearch" >nul 2>&1 & sc config "WSearch" start=disabled >nul 2>&1
    echo  [OK] Da tat WSearch!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="5" (
    echo  [INFO] Dang tat SysMain...
    sc stop "SysMain" >nul 2>&1 & sc config "SysMain" start=disabled >nul 2>&1
    echo  [OK] Da tat SysMain!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="6" (
    echo  [INFO] Dang tat AJRouter...
    sc stop "AJRouter" >nul 2>&1 & sc config "AJRouter" start=disabled >nul 2>&1
    echo  [OK] Da tat AJRouter!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="7" (
    echo  [INFO] Dang tat Fax...
    sc stop "Fax" >nul 2>&1 & sc config "Fax" start=disabled >nul 2>&1
    echo  [OK] Da tat Fax!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="8" (
    echo  [INFO] Dang tat lfsvc...
    sc stop "lfsvc" >nul 2>&1 & sc config "lfsvc" start=disabled >nul 2>&1
    echo  [OK] Da tat lfsvc!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="9" (
    echo  [INFO] Dang tat RetailDemo...
    sc stop "RetailDemo" >nul 2>&1 & sc config "RetailDemo" start=disabled >nul 2>&1
    echo  [OK] Da tat RetailDemo!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="10" (
    echo  [INFO] Dang tat RemoteRegistry...
    sc stop "RemoteRegistry" >nul 2>&1 & sc config "RemoteRegistry" start=disabled >nul 2>&1
    echo  [OK] Da tat RemoteRegistry!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="11" (
    echo  [INFO] Dang tat WerSvc...
    sc stop "WerSvc" >nul 2>&1 & sc config "WerSvc" start=disabled >nul 2>&1
    echo  [OK] Da tat WerSvc!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="12" (
    echo  [INFO] Dang tat XblAuthManager...
    sc stop "XblAuthManager" >nul 2>&1 & sc config "XblAuthManager" start=disabled >nul 2>&1
    echo  [OK] Da tat XblAuthManager!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="13" (
    echo  [INFO] Dang tat XblGameSave...
    sc stop "XblGameSave" >nul 2>&1 & sc config "XblGameSave" start=disabled >nul 2>&1
    echo  [OK] Da tat XblGameSave!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="14" (
    echo  [INFO] Dang tat XboxNetApiSvc...
    sc stop "XboxNetApiSvc" >nul 2>&1 & sc config "XboxNetApiSvc" start=disabled >nul 2>&1
    echo  [OK] Da tat XboxNetApiSvc!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="15" (
    echo  [INFO] Dang tat TabletInputService...
    sc stop "TabletInputService" >nul 2>&1 & sc config "TabletInputService" start=disabled >nul 2>&1
    echo  [OK] Da tat TabletInputService!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="16" (
    echo  [INFO] Dang tat SensorDataService...
    sc stop "SensorDataService" >nul 2>&1 & sc config "SensorDataService" start=disabled >nul 2>&1
    echo  [OK] Da tat SensorDataService!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="17" (
    echo  [INFO] Dang tat PhoneSvc...
    sc stop "PhoneSvc" >nul 2>&1 & sc config "PhoneSvc" start=disabled >nul 2>&1
    echo  [OK] Da tat PhoneSvc!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="18" (
    echo  [INFO] Dang tat WbioSrvc...
    sc stop "WbioSrvc" >nul 2>&1 & sc config "WbioSrvc" start=disabled >nul 2>&1
    echo  [OK] Da tat WbioSrvc!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="19" (
    echo  [INFO] Dang tat icssvc...
    sc stop "icssvc" >nul 2>&1 & sc config "icssvc" start=disabled >nul 2>&1
    echo  [OK] Da tat icssvc!
    pause & goto kiem_tra_tweaks
)
if "%check_choice%"=="20" (
    echo  [INFO] Dang tat iphlpsvc...
    sc stop "iphlpsvc" >nul 2>&1 & sc config "iphlpsvc" start=disabled >nul 2>&1
    echo  [OK] Da tat iphlpsvc!
    pause & goto kiem_tra_tweaks
)
goto kiem_tra_tweaks

:tat_tat_ca_svc_77
echo.
echo  [INFO] Dang tat tat ca dich vu...
for %%s in (DiagTrack dmwappushservice MapsBroker WSearch SysMain AJRouter Fax lfsvc RetailDemo RemoteRegistry WerSvc XblAuthManager XblGameSave XboxNetApiSvc TabletInputService SensorDataService PhoneSvc WbioSrvc icssvc iphlpsvc FontCache W32Time) do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start=disabled >nul 2>&1
)
echo  [THANH CONG] Da tat tat ca dich vu!
echo  [%DATE% %TIME%] Tat dich vu tu Check 77 >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto kiem_tra_tweaks

:ap_dung_tat_ca_tweaks_77
echo.
echo  [INFO] Dang ap dung tat ca tweaks...

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
echo  - Da tat GameDVR

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
echo  - Da tat Telemetry

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d "1" /f >nul 2>&1
echo  - Da tat Background Apps

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
echo  - Da bat HAGS

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f >nul 2>&1
echo  - Da tat IPv6

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
echo  - Da tat Power Throttling

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f >nul 2>&1
echo  - Da tat Network Throttling

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
echo  - Da bat Timer Resolution

echo.
echo  [THANH CONG] Da ap dung tat ca tweaks!
echo  [%DATE% %TIME%] Ap dung tweaks tu Check 77 >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto kiem_tra_tweaks

:xuat_bao_cao_77
echo.
echo  [INFO] Dang xuat bao cao...
set "report_file=C:\GL-TWEAK_Logs\TweakReport.txt"

echo ============================================ > "%report_file%"
echo  GL-TWEAK 1.0.0 - BAO CAO KIEM TRA >> "%report_file%"
echo  Ngay: %DATE% %TIME% >> "%report_file%"
echo ============================================ >> "%report_file%"
echo. >> "%report_file%"
echo === DICH VU DANG CHAY === >> "%report_file%"

for %%s in (DiagTrack dmwappushservice MapsBroker WSearch SysMain AJRouter Fax lfsvc RetailDemo RemoteRegistry WerSvc XblAuthManager XblGameSave XboxNetApiSvc TabletInputService SensorDataService PhoneSvc WbioSrvc icssvc iphlpsvc FontCache W32Time) do (
    sc query "%%s" 2>nul | findstr /i "RUNNING" >nul && echo %%s - DANG CHAY >> "%report_file%"
)

echo. >> "%report_file%"
echo ============================================ >> "%report_file%"

echo  [THANH CONG] Da xuat bao cao tai: %report_file%
start notepad "%report_file%"
pause
goto kiem_tra_tweaks
        sc config "%%s" start=disabled >nul 2>&1
        echo  - Da tat: %%s
    )
)
echo.
echo  [THANH CONG] Da tat tat ca dich vu!
echo  [%DATE% %TIME%] Tat tat ca dich vu tu Check >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto kiem_tra_tweaks


:: =====================================================
:: 88. CHAY TAT CA TOI UU (TU DONG - KHONG HOI)
:: =====================================================
:chay_tat_ca
cls
echo.
echo  +======================================================================+
echo  ^|              CHAY TAT CA TOI UU (TU DONG)                            ^|
echo  +======================================================================+
echo.
echo  [1] TOI UU NHANH - An toan, khong hoi (Khuyen nghi)
echo  [2] TOI UU MANH - Tat ca tweaks, khong hoi
echo  [3] TOI UU TUY CHON - Chon CPU/GPU rieng
echo  [0] Quay lai
echo.
set /p run_choice=  Nhap lua chon: 

if "%run_choice%"=="1" goto auto_quick
if "%run_choice%"=="2" goto auto_full
if "%run_choice%"=="3" goto auto_custom
if "%run_choice%"=="0" goto menu_chinh
goto chay_tat_ca

:: === TOI UU NHANH - KHONG HOI ===
:auto_quick
cls
echo.
echo  +======================================================================+
echo  ^|              DANG TOI UU NHANH... (Khong can thao tac)               ^|
echo  +======================================================================+
echo.
echo  [INFO] Dang chay 50+ tweaks tu dong...
echo.

echo  [BUOC 1/10] Toi uu giao dien...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d "0" /f >nul 2>&1

echo  [BUOC 2/10] Toi uu he thong...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 380000000 /f >nul 2>&1
powercfg -h off >nul 2>&1

echo  [BUOC 3/10] Xoa telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d "1" /f >nul 2>&1

echo  [BUOC 4/10] Vo hieu services khong can thiet...
sc config DiagTrack start=disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc config dmwappushservice start=disabled >nul 2>&1
sc config MapsBroker start=disabled >nul 2>&1
sc config WSearch start=disabled >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
sc stop SysMain >nul 2>&1
sc config WerSvc start=disabled >nul 2>&1
sc config lfsvc start=disabled >nul 2>&1
sc config RetailDemo start=disabled >nul 2>&1
sc config AJRouter start=disabled >nul 2>&1
sc config Fax start=disabled >nul 2>&1

echo  [BUOC 5/10] Toi uu CPU...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "CoalescingTimerDisabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bam" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1

echo  [BUOC 6/10] Toi uu mang...
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 2097152 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65534 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f >nul 2>&1

echo  [BUOC 7/10] Toi uu game priority...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1

echo  [BUOC 8/10] Toi uu RAM...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "983040" /f >nul 2>&1

echo  [BUOC 9/10] Toi uu SSD/Disk...
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set memoryusage 2 >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "MemoryUsage" /t REG_DWORD /d 2 /f >nul 2>&1

echo  [BUOC 10/10] Tat scheduled tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1

echo.
echo  +======================================================================+
echo  ^|              HOAN TAT TOI UU NHANH!                                  ^|
echo  +======================================================================+
echo.
echo  [THANH CONG] Da ap dung 50+ tweaks tu dong!
echo  [INFO] Khuyen nghi khoi dong lai may de ap dung day du.
echo  [%DATE% %TIME%] Auto Quick Optimization >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: === TOI UU MANH ===
:auto_full
cls
echo.
echo  +======================================================================+
echo  ^|              DANG TOI UU MANH... (100+ tweaks)                       ^|
echo  +======================================================================+
echo.

echo  [PHAN 1/3] Ap dung tweaks co ban...
call :auto_quick_silent

echo  [PHAN 2/3] Ap dung tweaks nang cao...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set bootux disabled >nul 2>&1
sc config DisplayEnhancementService start=disabled >nul 2>&1
sc config TabletInputService start=disabled >nul 2>&1
sc config SensorDataService start=disabled >nul 2>&1
sc config PhoneSvc start=disabled >nul 2>&1
sc config WbioSrvc start=disabled >nul 2>&1
sc config icssvc start=disabled >nul 2>&1
sc config RemoteRegistry start=disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d 10 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePreemption" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 31 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 32 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 32 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "MaxNumRssCpus" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TSFairShare\Disk" /v "EnableFairShare" /t REG_DWORD /d 0 /f >nul 2>&1
fsutil behavior set disablecompression 1 >nul 2>&1
fsutil behavior set disableencryption 1 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1

echo  [PHAN 3/3] Don dep file tam...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1

echo.
echo  +======================================================================+
echo  ^|              HOAN TAT TOI UU MANH!                                   ^|
echo  +======================================================================+
echo.
echo  [THANH CONG] Da ap dung 100+ tweaks!
echo  [INFO] Khuyen nghi khoi dong lai may de ap dung day du.
echo  [%DATE% %TIME%] Auto Full Optimization >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: === TOI UU TUY CHON ===
:auto_custom
cls
echo.
echo  +======================================================================+
echo  ^|              TOI UU TUY CHON - CHON CPU/GPU                          ^|
echo  +======================================================================+
echo.
echo  === CHON LOAI CPU ===
echo  [1] Intel
echo  [2] AMD
echo  [3] Khong biet / Bo qua
echo.
set /p cpu_type=  CPU cua ban: 

echo.
echo  === CHON LOAI GPU ===
echo  [1] NVIDIA
echo  [2] AMD
echo  [3] Intel (Integrated)
echo  [4] Khong biet / Bo qua
echo.
set /p gpu_type=  GPU cua ban: 

echo.
echo  [INFO] Dang ap dung tweaks chung...
call :auto_quick_silent

if "%cpu_type%"=="1" (
    echo  [INFO] Dang ap dung Intel CPU tweaks...
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
    bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
)
if "%cpu_type%"=="2" (
    echo  [INFO] Dang ap dung AMD CPU tweaks...
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdppm" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
)
if "%gpu_type%"=="1" (
    echo  [INFO] Dang ap dung NVIDIA GPU tweaks...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d 60 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d 1 /f >nul 2>&1
    sc config NVDisplay.ContainerLocalSystem start=disabled >nul 2>&1
)
if "%gpu_type%"=="2" (
    echo  [INFO] Dang ap dung AMD GPU tweaks...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d 0 /f >nul 2>&1
    sc config "AMD Crash Defender Service" start=disabled >nul 2>&1
    sc config "AMD External Events Utility" start=disabled >nul 2>&1
)
if "%gpu_type%"=="3" (
    echo  [INFO] Dang ap dung Intel GPU tweaks...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1
)

echo.
echo  +======================================================================+
echo  ^|              HOAN TAT TOI UU TUY CHON!                               ^|
echo  +======================================================================+
echo.
echo  [THANH CONG] Da ap dung tweaks cho CPU va GPU cua ban!
echo  [%DATE% %TIME%] Auto Custom Optimization >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: === SILENT FUNCTION ===
:auto_quick_silent
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
powercfg -h off >nul 2>&1
goto :eof

call :chay_co_ban
call :chay_nang_cao
echo.
echo  [THANH CONG] Da ap dung TAT CA toi uu!
echo  [%DATE% %TIME%] Chay tat ca toi uu >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 99. FIXERS
:: =====================================================
:fixers
cls
echo.
echo  +======================================================================+
echo  ^|              FIXERS - SUA LOI SAU KHI TOI UU                         ^|
echo  +======================================================================+
echo.
echo  [1] Khoi phuc Services ve mac dinh
echo  [2] Khoi phuc Network ve mac dinh
echo  [3] Khoi phuc Power Plan ve mac dinh
echo  [4] Bat lai Telemetry
echo  [5] Bat lai Windows Update
echo  [6] Bat lai Windows Defender
echo  [7] Sua loi Windows Store
echo  [8] Sua loi Start Menu
echo  [9] Sua loi WiFi
echo  [10] Khoi phuc Wallpaper cu
echo  [0] Quay lai
echo.
set /p fix_choice=  Nhap lua chon: 

if "%fix_choice%"=="1" (
    echo  [INFO] Dang khoi phuc Services...
    if exist "C:\GL-TWEAK_Logs\ServicesBackup.reg" (
        reg import "C:\GL-TWEAK_Logs\ServicesBackup.reg" >nul 2>&1
        echo  [THANH CONG] Da khoi phuc Services tu backup!
    ) else (
        sc config BITS start=demand >nul 2>&1
        sc config WSearch start=delayed-auto >nul 2>&1
        sc config SysMain start=auto >nul 2>&1
        echo  [THANH CONG] Da bat lai cac services quan trong!
    )
)
if "%fix_choice%"=="2" (
    echo  [INFO] Dang khoi phuc Network...
    netsh int tcp set global autotuninglevel=normal >nul 2>&1
    netsh int tcp set global timestamps=enabled >nul 2>&1
    netsh winsock reset >nul 2>&1
    netsh int ip reset >nul 2>&1
    ipconfig /flushdns >nul 2>&1
    echo  [THANH CONG] Da khoi phuc Network! Can khoi dong lai may.
)
if "%fix_choice%"=="3" (
    echo  [INFO] Dang khoi phuc Power Plan...
    powercfg -restoredefaultschemes >nul 2>&1
    powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
    echo  [THANH CONG] Da khoi phuc Power Plan ve Balanced!
)
if "%fix_choice%"=="4" (
    echo  [INFO] Dang bat lai Telemetry...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "3" /f >nul 2>&1
    sc config DiagTrack start=auto >nul 2>&1
    sc start DiagTrack >nul 2>&1
    echo  [THANH CONG] Da bat lai Telemetry!
)
if "%fix_choice%"=="5" (
    echo  [INFO] Dang bat lai Windows Update...
    sc config wuauserv start=demand >nul 2>&1
    sc config UsoSvc start=demand >nul 2>&1
    sc start wuauserv >nul 2>&1
    echo  [THANH CONG] Da bat lai Windows Update!
)
if "%fix_choice%"=="6" (
    echo  [INFO] Dang bat lai Windows Defender...
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /f >nul 2>&1
    sc config WinDefend start=auto >nul 2>&1
    sc start WinDefend >nul 2>&1
    echo  [THANH CONG] Da bat lai Windows Defender!
)
if "%fix_choice%"=="7" (
    echo  [INFO] Dang sua loi Windows Store...
    wsreset.exe >nul 2>&1
    echo  [THANH CONG] Da sua loi Windows Store!
)
if "%fix_choice%"=="8" (
    echo  [INFO] Dang sua loi Start Menu...
    taskkill /f /im explorer.exe >nul 2>&1
    timeout 2 >nul
    start explorer.exe
    echo  [THANH CONG] Da sua loi Start Menu!
)
if "%fix_choice%"=="9" (
    echo  [INFO] Dang chay GL-TWEAK WiFi Fixer...
    if exist "%~dp0wifi-fixed.bat" (
        call "%~dp0wifi-fixed.bat"
    ) else (
        echo  [LOI] Khong tim thay file wifi-fixed.bat!
        echo  [INFO] Dang sua loi WiFi truc tiep...
        sc config Dhcp start=auto >nul 2>&1
        sc config NlaSvc start=auto >nul 2>&1
        sc config WlanSvc start=auto >nul 2>&1
        reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "0" /f >nul 2>&1
        ipconfig /release
        ipconfig /renew
        ipconfig /flushdns
        echo  [THANH CONG] Da sua loi WiFi! Can khoi dong lai.
    )
)
if "%fix_choice%"=="10" (
    echo  [INFO] Dang khoi phuc wallpaper cu...
    if exist "C:\GL-TWEAK_Logs\Wallpaper\old_wallpaper.txt" (
        set /p OLD_WP=<"C:\GL-TWEAK_Logs\Wallpaper\old_wallpaper.txt"
        if exist "!OLD_WP!" (
            reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "!OLD_WP!" /f >nul 2>&1
            RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True >nul 2>&1
            echo  [THANH CONG] Da khoi phuc wallpaper cu!
        ) else (
            echo  [LOI] File wallpaper cu khong ton tai!
        )
    ) else (
        echo  [LOI] Khong tim thay backup wallpaper cu!
    )
)
if "%fix_choice%"=="0" goto menu_chinh
pause
goto fixers

:: =====================================================
:: 30. ROBLOX OPTIMIZER (FFlags)
:: =====================================================
:roblox_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              ROBLOX OPTIMIZER - FFLAGS                               ^|
echo  +======================================================================+
echo.
echo  [1] Ap dung FFlags toi uu FPS (Khuyen nghi)
echo  [2] Ap dung FFlags Low-End PC (May yeu)
echo  [3] Xoa FFlags (Khoi phuc mac dinh)
echo  [4] Mo thu muc Roblox ClientSettings
echo  [0] Quay lai
echo.
set /p roblox_choice=  Nhap lua chon: 

if "%roblox_choice%"=="1" goto roblox_fflags_fps
if "%roblox_choice%"=="2" goto roblox_fflags_lowend
if "%roblox_choice%"=="3" goto roblox_fflags_remove
if "%roblox_choice%"=="4" goto roblox_open_folder
if "%roblox_choice%"=="0" goto menu_chinh
goto roblox_optimizer

:roblox_fflags_fps
cls
echo.
echo  +======================================================================+
echo  ^|              DANG AP DUNG FFLAGS TOI UU FPS...                       ^|
echo  +======================================================================+
echo.

:: Tim duong dan Roblox
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"

if not defined ROBLOX_PATH (
    echo  [LOI] Khong tim thay Roblox! Hay cai dat Roblox truoc.
    pause
    goto roblox_optimizer
)

:: Tao thu muc ClientSettings
set "CLIENT_SETTINGS=%ROBLOX_PATH%\ClientSettings"
if not exist "%CLIENT_SETTINGS%" mkdir "%CLIENT_SETTINGS%" >nul 2>&1

echo  [INFO] Duong dan Roblox: %ROBLOX_PATH%
echo  [INFO] Dang tao file FFlags...

:: Tao file ClientAppSettings.json
(
echo {
echo   "FLogNetwork": "7",
echo   "FFlagHandleAltEnterFullscreenManually": "False",
echo   "DFIntTaskSchedulerTargetFps": "5588562",
echo   "DFFlagDebugRenderForceTechnologyVoxel": "True",
echo   "FFlagDebugForceFutureIsBrightPhase3": "True",
echo   "FIntDebugForceMSAASamples": "1",
echo   "FIntFullscreenTitleBarTriggerDelayMillis": "18000000",
echo   "FFlagDebugGraphicsPreferD3D11FL10": "True",
echo   "DFIntTextureQualityOverride": "3",
echo   "FFlagDebugGraphicsPreferD3D11": "True",
echo   "DFFlagTextureQualityOverrideEnabled": "True",
echo   "FFlagDisablePostFx": "True",
echo   "FIntTerrainArraySliceSize": "0",
echo   "DFFlagDisableDPIScale": "True",
echo   "FIntRenderShadowIntensity": "0",
echo   "DFFlagDebugAnalyticsSendUserId": "False",
echo   "FFlagReportFpsAndGfxQualityPercentiles": "False",
echo   "DFFlagAudioDeviceTelemetry": "False",
echo   "FFlagEnableAccessibilitySettingsInExperienceMenu2": "True",
echo   "DFIntDetectCrashEarlyPercentage": "0",
echo   "FFlagRenderPerformanceTelemetry": "False",
echo   "FIntMeshContentProviderForceCacheSize": "268435456",
echo   "DFFlagDebugPauseVoxelizer": "true",
echo   "FFlagDebugDisableTelemetryV2Counter": "True",
echo   "FIntFRMMinGrassDistance": "0",
echo   "DFFlagAddUserIdToSessionTracking": "False",
echo   "FIntFRMMaxGrassDistance": "0",
echo   "DFIntCrashUploadToBacktracePercentage": "0",
echo   "FFlagOptimizeNetworkRouting": "True",
echo   "DFIntGoogleAnalyticsLoadPlayerHundredth": "0",
echo   "FFlagDebugGraphicsDisableVulkan": "True",
echo   "DFFlagVideoCaptureServiceEnabled": "False",
echo   "FFlagCloudsReflectOnWater": "True",
echo   "FIntRenderEnableGlobalInstancingD3D11Percent": "100",
echo   "DFIntCSGLevelOfDetailSwitchingDistance": "1",
echo   "FIntTaskSchedulerAutoThreadLimit": "8",
echo   "FFlagGraphicsCheckComputeSupport": "True",
echo   "DFIntCrashReportingHundredthsPercentage": "0",
echo   "FFlagDebugDisableTelemetryPoint": "True",
echo   "DFIntLightstepHTTPTransportHundredthsPercent2": "0",
echo   "FFlagEnableInGameMenuV3": "False",
echo   "FFlagDontCreatePingJob": "True",
echo   "FFlagDebugDisableTelemetryEphemeralCounter": "True",
echo   "DFIntCSGLevelOfDetailSwitchingDistanceL23": "0",
echo   "FFlagGraphicsEnableD3D10Compute": "True",
echo   "FIntRenderLocalLightFadeInMs_enabled": "99999",
echo   "FIntRenderGrassDetailStrands": "0",
echo   "FFlagRenderCheckThreading": "True",
echo   "FIntCameraMaxZoomDistance": "99999",
echo   "FFlagDebugDisableTelemetryEphemeralStat": "True",
echo   "DFFlagPredictedOOM": "False",
echo   "FFlagDebugGraphicsDisableOpenGL": "True",
echo   "DFIntPredictedOOMPercent": "0",
echo   "FIntCameraFarZPlane": "600",
echo   "FFlagEnableSoundTelemetry": "False",
echo   "DFIntStartupTracingInfluxRollout": "0",
echo   "FIntReportDeviceInfoRollout": "0",
echo   "DFFlagEnableLightstepReporting2": "False",
echo   "FFlagDebugGraphicsDisableDirect3D11": "False",
echo   "DFFlagDebugPerfMode": "True",
echo   "FFlagFixGraphicsQuality": "True",
echo   "FFlagPreloadMinimalFonts": "True",
echo   "FFlagPreloadTextureItemsOption4": "True",
echo   "DFFlagEnableGCapsHardwareTelemetry": "False",
echo   "DFIntNetworkPrediction": "120",
echo   "FFlagOptimizeNetworkTransport": "True",
echo   "FFlagWindowsLaunchAnalytics": "False",
echo   "FFlagGlobalWindRendering": "false",
echo   "DFFlagGpuVsCpuBoundTelemetry": "False",
echo   "FIntUITextureMaxRenderTextureSize": "1024",
echo   "FFlagTrackWinWebLaunchFlow": "False",
echo   "DFFlagCrashUploadFullDumps": "False",
echo   "FFlagRenderGpuTextureCompressor": "True",
echo   "FFlagGpuGeometryManager7": "True",
echo   "FFlagDebugDisableTelemetryEventIngest": "True",
echo   "FIntRenderShadowmapBias": "0",
echo   "DFFlagDebugEnableInterpolationVisualizer": "true",
echo   "FFlagAddGameInstanceIdToSessionTracking": "False",
echo   "DFFlagEphemeralCounterInfluxReportingEnabled": "False",
echo   "DFIntDebugFRMQualityLevelOverride": "1",
echo   "FFlagDebugDisableTelemetryV2Event": "True",
echo   "FIntBootstrapperTelemetryReportingHundredthsPercentage": "0",
echo   "FFlagNewLightAttenuation": "True",
echo   "FFlagDebugDisableOTAMaterialTexture": "true",
echo   "FFlagOptimizeServerTickRate": "True",
echo   "DFFlagHttpCacheCleanBasedOnMemory": "True",
echo   "FIntDefaultMeshCacheSizeMB": "256",
echo   "FFlagAdServiceEnabled": "False",
echo   "DFFlagQueueDataPingFromSendData": "True",
echo   "FFlagOptimizeNetwork": "True",
echo   "DFIntServerPhysicsUpdateRate": "60",
echo   "FFlagLocServicePerformanceAnalyticsEnabled": "False",
echo   "DFIntOptimizePingThreshold": "50",
echo   "DFIntBrowserTrackerApiDeviceInitializeRolloutPercentage": "0",
echo   "DFIntUserIdPlayerNameCacheSize": "33554432",
echo   "FFlagAnimationClipMemCacheEnabled": "True",
echo   "DFIntPlayerNetworkUpdateRate": "60",
echo   "DFIntCSGLevelOfDetailSwitchingDistanceL12": "0",
echo   "DFFlagESGamePerfMonitorEnabled": "False",
echo   "FFlagEnableBatteryStateLogger": "False",
echo   "DFFlagBrowserTrackerIdTelemetryEnabled": "False",
echo   "DFIntMaxFrameBufferSize": "4",
echo   "DFIntS2PhysicsSenderRate": "250",
echo   "FIntTerrainOTAMaxTextureSize": "1024",
echo   "FFlagPreloadAllFonts": "True",
echo   "DFIntClientLightingTechnologyChangedTelemetryHundredthsPercent": "0",
echo   "FFlagDebugDisableTelemetryV2Stat": "True",
echo   "FFlagDisableNewIGMinDUA": "True",
echo   "FIntLinkBrowserTrackerToDeviceRollout": "0",
echo   "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
echo   "FFlagDebugRenderingSetDeterministic": "True",
echo   "FFlagCommitToGraphicsQualityFix": "True",
echo   "DFFlagEnableFmodErrorsTelemetry": "False",
echo   "FIntStartupInfluxHundredthsPercentage": "0",
echo   "DFIntRakNetResendRttMultiple": "1",
echo   "DFIntLoginTelemetryHundredthsPercent": "0",
echo   "FIntEmotesAnimationsPerPlayerCacheSize": "16777216",
echo   "FFlagDebugGraphicsDisableVulkan11": "True",
echo   "FFlagEnableAdsAPI": "False",
echo   "FIntAbuseReportScreenshotMaxSize": "0",
echo   "DFFlagClientBaseNetworkMetrics": "False",
echo   "FFlagEnableAccessibilitySettingsAPIV2": "True",
echo   "FFlagFastGPULightCulling3": "True",
echo   "DFIntWriteFullDmpPercent": "0",
echo   "FFlagBatchAssetApi": "True",
echo   "DFFlagAddPublicGettersForGfxQualityAndFpsForTelemCounters2": "False",
echo   "FFlagEnableAccessibilitySettingsEffectsInExperienceChat": "True",
echo   "FIntRobloxGuiBlurIntensity": "0",
echo   "DFIntRaknetBandwidthPingSendEveryXSeconds": "1",
echo   "DFIntServerTickRate": "60",
echo   "DFIntNetworkLatencyTolerance": "1",
echo   "DFIntPlayerNetworkUpdateQueueSize": "20",
echo   "DFIntHttpCurlConnectionCacheSize": "134217728"
echo }
) > "%CLIENT_SETTINGS%\ClientAppSettings.json"

echo.
echo  [THANH CONG] Da ap dung FFlags toi uu FPS!
echo  [INFO] File duoc luu tai: %CLIENT_SETTINGS%\ClientAppSettings.json
echo.
echo  [LUU Y] Khoi dong lai Roblox de ap dung thay doi.
echo  [%DATE% %TIME%] Roblox FFlags FPS >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto roblox_optimizer

:roblox_fflags_lowend
cls
echo.
echo  +======================================================================+
echo  ^|              DANG AP DUNG FFLAGS CHO MAY YEU...                      ^|
echo  +======================================================================+
echo.

:: Tim duong dan Roblox
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"

if not defined ROBLOX_PATH (
    echo  [LOI] Khong tim thay Roblox! Hay cai dat Roblox truoc.
    pause
    goto roblox_optimizer
)

set "CLIENT_SETTINGS=%ROBLOX_PATH%\ClientSettings"
if not exist "%CLIENT_SETTINGS%" mkdir "%CLIENT_SETTINGS%" >nul 2>&1

echo  [INFO] Duong dan Roblox: %ROBLOX_PATH%
echo  [INFO] Dang tao file FFlags cho may yeu...

:: FFlags cho may yeu - giam do hoa toi da
(
echo {
echo   "DFIntTaskSchedulerTargetFps": "60",
echo   "FIntDebugForceMSAASamples": "0",
echo   "FFlagDisablePostFx": "True",
echo   "FIntRenderShadowIntensity": "0",
echo   "FIntFRMMinGrassDistance": "0",
echo   "FIntFRMMaxGrassDistance": "0",
echo   "FIntRenderGrassDetailStrands": "0",
echo   "DFIntTextureQualityOverride": "0",
echo   "DFFlagTextureQualityOverrideEnabled": "True",
echo   "FIntTerrainArraySliceSize": "0",
echo   "DFIntCSGLevelOfDetailSwitchingDistance": "0",
echo   "DFIntCSGLevelOfDetailSwitchingDistanceL12": "0",
echo   "DFIntCSGLevelOfDetailSwitchingDistanceL23": "0",
echo   "DFIntCSGLevelOfDetailSwitchingDistanceL34": "0",
echo   "FFlagGlobalWindRendering": "false",
echo   "FFlagCloudsReflectOnWater": "False",
echo   "FIntRenderShadowmapBias": "0",
echo   "FIntUITextureMaxRenderTextureSize": "256",
echo   "FIntTerrainOTAMaxTextureSize": "256",
echo   "DFIntDebugFRMQualityLevelOverride": "1",
echo   "FFlagDebugSkyGray": "true",
echo   "FIntRobloxGuiBlurIntensity": "0",
echo   "DFIntMaxFrameBufferSize": "1",
echo   "FFlagDebugGraphicsPreferD3D11": "True",
echo   "FFlagDebugGraphicsDisableVulkan": "True",
echo   "FFlagDebugGraphicsDisableOpenGL": "True",
echo   "FFlagOptimizeNetwork": "True",
echo   "FFlagOptimizeNetworkRouting": "True",
echo   "FFlagOptimizeNetworkTransport": "True",
echo   "DFIntNetworkPrediction": "120",
echo   "DFIntNetworkLatencyTolerance": "1",
echo   "FFlagPreloadMinimalFonts": "True",
echo   "FFlagPreloadAllFonts": "False",
echo   "FIntDefaultMeshCacheSizeMB": "64",
echo   "FIntMeshContentProviderForceCacheSize": "67108864",
echo   "FFlagEnableInGameMenuV3": "False",
echo   "FFlagDisableNewIGMinDUA": "True",
echo   "FFlagAdServiceEnabled": "False",
echo   "DFFlagDebugPerfMode": "True"
echo }
) > "%CLIENT_SETTINGS%\ClientAppSettings.json"

echo.
echo  [THANH CONG] Da ap dung FFlags cho may yeu!
echo  [INFO] File duoc luu tai: %CLIENT_SETTINGS%\ClientAppSettings.json
echo.
echo  [LUU Y] Khoi dong lai Roblox de ap dung thay doi.
echo  [%DATE% %TIME%] Roblox FFlags LowEnd >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto roblox_optimizer

:roblox_fflags_remove
cls
echo.
echo  +======================================================================+
echo  ^|              XOA FFLAGS - KHOI PHUC MAC DINH                         ^|
echo  +======================================================================+
echo.

:: Tim duong dan Roblox
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"

if not defined ROBLOX_PATH (
    echo  [LOI] Khong tim thay Roblox!
    pause
    goto roblox_optimizer
)

set "CLIENT_SETTINGS=%ROBLOX_PATH%\ClientSettings"

if exist "%CLIENT_SETTINGS%\ClientAppSettings.json" (
    del "%CLIENT_SETTINGS%\ClientAppSettings.json" >nul 2>&1
    echo  [THANH CONG] Da xoa FFlags!
    echo  [INFO] Roblox se chay voi cai dat mac dinh.
) else (
    echo  [INFO] Khong tim thay file FFlags de xoa.
)

echo.
echo  [LUU Y] Khoi dong lai Roblox de ap dung thay doi.
echo  [%DATE% %TIME%] Roblox FFlags Removed >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto roblox_optimizer

:roblox_open_folder
cls
echo.
echo  +======================================================================+
echo  ^|              MO THU MUC ROBLOX CLIENTSETTINGS                        ^|
echo  +======================================================================+
echo.

:: Tim duong dan Roblox
set "ROBLOX_PATH="
for /d %%i in ("%LOCALAPPDATA%\Roblox\Versions\version-*") do set "ROBLOX_PATH=%%i"

if not defined ROBLOX_PATH (
    echo  [LOI] Khong tim thay Roblox!
    pause
    goto roblox_optimizer
)

set "CLIENT_SETTINGS=%ROBLOX_PATH%\ClientSettings"
if not exist "%CLIENT_SETTINGS%" mkdir "%CLIENT_SETTINGS%" >nul 2>&1

echo  [INFO] Dang mo thu muc: %CLIENT_SETTINGS%
explorer "%CLIENT_SETTINGS%"
pause
goto roblox_optimizer

:: =====================================================
:: 31. BACKUP DU LIEU
:: =====================================================
:backup_data
cls
echo.
echo  +======================================================================+
echo  ^|              BACKUP DU LIEU                                          ^|
echo  +======================================================================+
echo.
echo  [1] Backup Documents, Desktop, Downloads
echo  [2] Backup Game Saves (Roblox, Minecraft, etc.)
echo  [3] Backup Registry quan trong
echo  [4] Backup Drivers
echo  [5] Backup tat ca (1+2+3+4)
echo  [6] Mo thu muc Backup
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

:: Tao thu muc backup
set "BACKUP_DIR=C:\GL-TWEAK_Backup\UserData_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo.

:: Backup Documents
echo  [1/3] Dang backup Documents...
if exist "%USERPROFILE%\Documents" (
    robocopy "%USERPROFILE%\Documents" "%BACKUP_DIR%\Documents" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Documents
) else (
    echo  [SKIP] Khong tim thay Documents
)

:: Backup Desktop
echo  [2/3] Dang backup Desktop...
if exist "%USERPROFILE%\Desktop" (
    robocopy "%USERPROFILE%\Desktop" "%BACKUP_DIR%\Desktop" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Desktop
) else (
    echo  [SKIP] Khong tim thay Desktop
)

:: Backup Downloads
echo  [3/3] Dang backup Downloads...
if exist "%USERPROFILE%\Downloads" (
    robocopy "%USERPROFILE%\Downloads" "%BACKUP_DIR%\Downloads" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Downloads
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
echo.

:: Backup Roblox
echo  [1/8] Dang backup Roblox...
if exist "%LOCALAPPDATA%\Roblox" (
    robocopy "%LOCALAPPDATA%\Roblox" "%BACKUP_DIR%\Roblox" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Roblox
) else (
    echo  [SKIP] Khong tim thay Roblox
)

:: Backup Minecraft
echo  [2/8] Dang backup Minecraft...
if exist "%APPDATA%\.minecraft" (
    robocopy "%APPDATA%\.minecraft\saves" "%BACKUP_DIR%\Minecraft\saves" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    robocopy "%APPDATA%\.minecraft\resourcepacks" "%BACKUP_DIR%\Minecraft\resourcepacks" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    robocopy "%APPDATA%\.minecraft\shaderpacks" "%BACKUP_DIR%\Minecraft\shaderpacks" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Minecraft
) else (
    echo  [SKIP] Khong tim thay Minecraft
)

:: Backup Valorant
echo  [3/8] Dang backup Valorant...
if exist "%LOCALAPPDATA%\VALORANT\Saved" (
    robocopy "%LOCALAPPDATA%\VALORANT\Saved\Config" "%BACKUP_DIR%\Valorant\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Valorant
) else (
    echo  [SKIP] Khong tim thay Valorant
)

:: Backup Fortnite
echo  [4/8] Dang backup Fortnite...
if exist "%LOCALAPPDATA%\FortniteGame\Saved" (
    robocopy "%LOCALAPPDATA%\FortniteGame\Saved\Config" "%BACKUP_DIR%\Fortnite\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Fortnite
) else (
    echo  [SKIP] Khong tim thay Fortnite
)

:: Backup GTA V
echo  [5/8] Dang backup GTA V...
if exist "%USERPROFILE%\Documents\Rockstar Games\GTA V" (
    robocopy "%USERPROFILE%\Documents\Rockstar Games\GTA V" "%BACKUP_DIR%\GTAV" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] GTA V
) else (
    echo  [SKIP] Khong tim thay GTA V
)

:: Backup League of Legends
echo  [6/8] Dang backup League of Legends...
if exist "%USERPROFILE%\Documents\League of Legends" (
    robocopy "%USERPROFILE%\Documents\League of Legends" "%BACKUP_DIR%\LeagueOfLegends" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] League of Legends
) else (
    echo  [SKIP] Khong tim thay League of Legends
)

:: Backup Steam Cloud (local)
echo  [7/8] Dang backup Steam userdata...
for /d %%i in ("C:\Program Files (x86)\Steam\userdata\*") do (
    robocopy "%%i" "%BACKUP_DIR%\Steam\userdata\%%~nxi" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
)
if exist "%BACKUP_DIR%\Steam" (
    echo  [OK] Steam userdata
) else (
    echo  [SKIP] Khong tim thay Steam
)

:: Backup Epic Games saves
echo  [8/8] Dang backup Epic Games...
if exist "%LOCALAPPDATA%\EpicGamesLauncher\Saved" (
    robocopy "%LOCALAPPDATA%\EpicGamesLauncher\Saved" "%BACKUP_DIR%\EpicGames" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
    echo  [OK] Epic Games
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

set "BACKUP_DIR=C:\GL-TWEAK_Backup\Registry_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo.

echo  [1/6] Dang backup HKLM\SOFTWARE...
reg export "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKLM_CurrentVersion.reg" /y >nul 2>&1
echo  [OK] CurrentVersion

echo  [2/6] Dang backup Services...
reg export "HKLM\SYSTEM\CurrentControlSet\Services" "%BACKUP_DIR%\Services.reg" /y >nul 2>&1
echo  [OK] Services

echo  [3/6] Dang backup Network...
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip" "%BACKUP_DIR%\Tcpip.reg" /y >nul 2>&1
echo  [OK] Network (Tcpip)

echo  [4/6] Dang backup Power Settings...
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Power" "%BACKUP_DIR%\Power.reg" /y >nul 2>&1
echo  [OK] Power Settings

echo  [5/6] Dang backup GPU Settings...
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" "%BACKUP_DIR%\GPU.reg" /y >nul 2>&1
echo  [OK] GPU Settings

echo  [6/6] Dang backup User Settings...
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKCU_CurrentVersion.reg" /y >nul 2>&1
reg export "HKCU\Control Panel" "%BACKUP_DIR%\ControlPanel.reg" /y >nul 2>&1
echo  [OK] User Settings

echo.
echo  [THANH CONG] Da backup registry xong!
echo  [INFO] Luu tai: %BACKUP_DIR%
echo  [LUU Y] De khoi phuc, double-click vao file .reg
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

set "BACKUP_DIR=C:\GL-TWEAK_Backup\Drivers_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo  [INFO] Thu muc backup: %BACKUP_DIR%
echo  [INFO] Dang export drivers... (co the mat vai phut)
echo.

:: Export drivers bang DISM
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
echo  [CANH BAO] Qua trinh nay co the mat nhieu thoi gian!
echo.
set /p confirm=  Ban co chac chan muon tiep tuc? (Y/N): 
if /i not "%confirm%"=="Y" goto backup_data

echo.
echo  === BUOC 1/4: BACKUP USER DATA ===
call :backup_user_data_silent

echo  === BUOC 2/4: BACKUP GAME SAVES ===
call :backup_game_saves_silent

echo  === BUOC 3/4: BACKUP REGISTRY ===
call :backup_registry_silent

echo  === BUOC 4/4: BACKUP DRIVERS ===
call :backup_drivers_silent

echo.
echo  +======================================================================+
echo  ^|              HOAN TAT BACKUP TAT CA!                                 ^|
echo  +======================================================================+
echo.
echo  [INFO] Tat ca backup duoc luu tai: C:\GL-TWEAK_Backup\
echo  [%DATE% %TIME%] Backup All >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto backup_data

:backup_user_data_silent
set "BACKUP_DIR=C:\GL-TWEAK_Backup\UserData_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
if exist "%USERPROFILE%\Documents" robocopy "%USERPROFILE%\Documents" "%BACKUP_DIR%\Documents" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%USERPROFILE%\Desktop" robocopy "%USERPROFILE%\Desktop" "%BACKUP_DIR%\Desktop" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%USERPROFILE%\Downloads" robocopy "%USERPROFILE%\Downloads" "%BACKUP_DIR%\Downloads" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
echo  [OK] User Data
goto :eof

:backup_game_saves_silent
set "BACKUP_DIR=C:\GL-TWEAK_Backup\GameSaves_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
if exist "%LOCALAPPDATA%\Roblox" robocopy "%LOCALAPPDATA%\Roblox" "%BACKUP_DIR%\Roblox" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%APPDATA%\.minecraft\saves" robocopy "%APPDATA%\.minecraft\saves" "%BACKUP_DIR%\Minecraft\saves" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%LOCALAPPDATA%\VALORANT\Saved\Config" robocopy "%LOCALAPPDATA%\VALORANT\Saved\Config" "%BACKUP_DIR%\Valorant\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%LOCALAPPDATA%\FortniteGame\Saved\Config" robocopy "%LOCALAPPDATA%\FortniteGame\Saved\Config" "%BACKUP_DIR%\Fortnite\Config" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
if exist "%USERPROFILE%\Documents\Rockstar Games\GTA V" robocopy "%USERPROFILE%\Documents\Rockstar Games\GTA V" "%BACKUP_DIR%\GTAV" /E /R:1 /W:1 /NFL /NDL /NJH /NJS >nul 2>&1
echo  [OK] Game Saves
goto :eof

:backup_registry_silent
set "BACKUP_DIR=C:\GL-TWEAK_Backup\Registry_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
reg export "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKLM_CurrentVersion.reg" /y >nul 2>&1
reg export "HKLM\SYSTEM\CurrentControlSet\Services" "%BACKUP_DIR%\Services.reg" /y >nul 2>&1
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip" "%BACKUP_DIR%\Tcpip.reg" /y >nul 2>&1
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion" "%BACKUP_DIR%\HKCU_CurrentVersion.reg" /y >nul 2>&1
echo  [OK] Registry
goto :eof

:backup_drivers_silent
set "BACKUP_DIR=C:\GL-TWEAK_Backup\Drivers_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1
dism /online /export-driver /destination:"%BACKUP_DIR%" >nul 2>&1
echo  [OK] Drivers
goto :eof

:open_backup_folder
if not exist "C:\GL-TWEAK_Backup" mkdir "C:\GL-TWEAK_Backup" >nul 2>&1
explorer "C:\GL-TWEAK_Backup"
goto backup_data

:: =====================================================
:: 32. SSD OPTIMIZER
:: =====================================================
:ssd_optimizer
cls
echo.
echo  +======================================================================+
echo  ^|              SSD OPTIMIZER - TOI UU O CUNG THE RAN                   ^|
echo  +======================================================================+
echo.
echo  [1] Toi uu SSD tu dong (Khuyen nghi)
echo  [2] Bat TRIM
echo  [3] Tat Defrag cho SSD
echo  [4] Toi uu NTFS nang cao
echo  [5] Tat Prefetch/Superfetch
echo  [6] Toi uu Write Cache
echo  [7] Tat USN Journal (Giam ghi)
echo  [0] Quay lai
echo.
set /p ssd_choice=  Nhap lua chon: 

if "%ssd_choice%"=="1" goto ssd_auto
if "%ssd_choice%"=="2" goto ssd_trim
if "%ssd_choice%"=="3" goto ssd_defrag_off
if "%ssd_choice%"=="4" goto ssd_ntfs
if "%ssd_choice%"=="5" goto ssd_prefetch
if "%ssd_choice%"=="6" goto ssd_write_cache
if "%ssd_choice%"=="7" goto ssd_usn
if "%ssd_choice%"=="0" goto menu_chinh
goto ssd_optimizer

:ssd_auto
cls
echo.
echo  +======================================================================+
echo  ^|              DANG TOI UU SSD TU DONG...                              ^|
echo  +======================================================================+
echo.

echo  [1/15] Bat TRIM...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1

echo  [2/15] Tat 8.3 filename (giam ghi)...
fsutil behavior set disable8dot3 1 >nul 2>&1

echo  [3/15] Tat Last Access Update...
fsutil behavior set disablelastaccess 1 >nul 2>&1

echo  [4/15] Tat Compression...
fsutil behavior set disablecompression 1 >nul 2>&1

echo  [5/15] Tat Encryption...
fsutil behavior set disableencryption 1 >nul 2>&1

echo  [6/15] Tat File Metadata Optimization...
fsutil behavior set disablefilemetadataoptimization 1 >nul 2>&1

echo  [7/15] Tang MFT Zone (4 = 50%% o dia)...
fsutil behavior set mftzone 4 >nul 2>&1

echo  [8/15] Tang Memory Usage...
fsutil behavior set memoryusage 2 >nul 2>&1

echo  [9/15] Tat Prefetch/Superfetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
sc config SysMain start= disabled >nul 2>&1
sc stop SysMain >nul 2>&1

echo  [10/15] Toi uu NTFS...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableEncryption" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableCompression" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "MemoryUsage" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "ContigFileAllocSize" /t REG_DWORD /d 4096 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "MaximumTunnelEntries" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [11/15] Tat Defrag tu dong cho SSD...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul 2>&1

echo  [12/15] Toi uu Disk Cache...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Disk" /v "EnableCache" /t REG_DWORD /d 1 /f >nul 2>&1

echo  [13/15] Tat Hibernate (tiet kiem SSD)...
powercfg -h off >nul 2>&1

echo  [14/15] Toi uu I/O System...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "CountOperations" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "DmaRemappingCompatible" /t REG_DWORD /d 0 /f >nul 2>&1

echo  [15/15] Toi uu Filter Support...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "FilterSupportedFeaturesMode" /t REG_DWORD /d 0 /f >nul 2>&1

echo.
echo  [THANH CONG] Da toi uu SSD!
echo  [%DATE% %TIME%] SSD Optimizer Auto >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto ssd_optimizer

:ssd_trim
echo  [INFO] Dang bat TRIM...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1
echo  [THANH CONG] Da bat TRIM!
pause
goto ssd_optimizer

:ssd_defrag_off
echo  [INFO] Dang tat Defrag tu dong...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Disable >nul 2>&1
echo  [THANH CONG] Da tat Defrag tu dong!
pause
goto ssd_optimizer

:ssd_ntfs
echo  [INFO] Dang toi uu NTFS...
fsutil behavior set disable8dot3 1 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set disablecompression 1 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d 4 /f >nul 2>&1
echo  [THANH CONG] Da toi uu NTFS!
pause
goto ssd_optimizer

:ssd_prefetch
echo  [INFO] Dang tat Prefetch/Superfetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1
sc config SysMain start= disabled >nul 2>&1
echo  [THANH CONG] Da tat Prefetch/Superfetch!
pause
goto ssd_optimizer

:ssd_write_cache
echo  [INFO] Dang toi uu Write Cache...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Disk" /v "EnableCache" /t REG_DWORD /d 1 /f >nul 2>&1
echo  [THANH CONG] Da toi uu Write Cache!
pause
goto ssd_optimizer

:ssd_usn
echo  [INFO] Dang tat USN Journal (giam ghi vao SSD)...
fsutil usn deletejournal /d c: >nul 2>&1
fsutil resource setautoreset true c:\ >nul 2>&1
echo  [THANH CONG] Da tat USN Journal!
echo  [LUU Y] Co the anh huong den mot so tinh nang tim kiem.
pause
goto ssd_optimizer

:: =====================================================
:: 33. DEBLOATER NANG CAO
:: =====================================================
:debloater_advanced
cls
echo.
echo  +======================================================================+
echo  ^|              DEBLOATER NANG CAO - XOA BLOATWARE                      ^|
echo  +======================================================================+
echo.
echo  [1] Xoa TAT CA apps khong can thiet (Khuyen nghi)
echo  [2] Xoa apps tu chon
echo  [3] Xoa Cortana
echo  [4] Xoa Windows Media Player
echo  [5] Xoa Internet Explorer
echo  [6] Xoa Paint 3D, 3D Viewer
echo  [7] Xoa Skype
echo  [8] Xoa tat ca games Microsoft
echo  [9] Xoa Office bloatware
echo  [0] Quay lai
echo.
set /p debloat_choice=  Nhap lua chon: 

if "%debloat_choice%"=="1" goto debloat_all
if "%debloat_choice%"=="2" goto debloat_select
if "%debloat_choice%"=="3" goto debloat_cortana
if "%debloat_choice%"=="4" goto debloat_wmp
if "%debloat_choice%"=="5" goto debloat_ie
if "%debloat_choice%"=="6" goto debloat_3d
if "%debloat_choice%"=="7" goto debloat_skype
if "%debloat_choice%"=="8" goto debloat_games
if "%debloat_choice%"=="9" goto debloat_office
if "%debloat_choice%"=="0" goto menu_chinh
goto debloater_advanced

:debloat_all
cls
echo.
echo  +======================================================================+
echo  ^|              DANG XOA TAT CA BLOATWARE...                            ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Se xoa 40+ ung dung khong can thiet!
set /p confirm=  Ban co chac chan? (Y/N): 
if /i not "%confirm%"=="Y" goto debloater_advanced

echo.
echo  [INFO] Dang xoa... (Co the mat 2-5 phut)
echo.

:: Microsoft Apps
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage" >nul 2>&1
echo  [OK] 3D Builder
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage" >nul 2>&1
echo  [OK] 3D Viewer
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingFinance* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Bing Finance
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingNews* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Bing News
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingSports* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Bing Sports
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Bing Weather
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Clipchamp* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Clipchamp
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Copilot* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Copilot
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *GetHelp* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Get Help
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Get Started
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Office Hub
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Solitaire
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MixedReality* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Mixed Reality
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage" >nul 2>&1
echo  [OK] OneNote
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Paint 3D
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *People* | Remove-AppxPackage" >nul 2>&1
echo  [OK] People
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Print3D* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Print 3D
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Skype
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Todos* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Microsoft To Do
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Wallet* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Wallet
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WebExperience* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Web Experience (Widgets)
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Alarms
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Feedback Hub
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Maps
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Sound Recorder
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Your Phone
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *ZuneMusic* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Groove Music
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *ZuneVideo* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Movies & TV
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MSTeams* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Teams
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *PowerAutomateDesktop* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Power Automate
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftFamily* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Family Safety

:: Xbox
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Xbox Apps
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *GamingApp* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Gaming App

:: Tat services lien quan
sc config XblAuthManager start= disabled >nul 2>&1
sc config XblGameSave start= disabled >nul 2>&1
sc config XboxNetApiSvc start= disabled >nul 2>&1
sc config XboxGipSvc start= disabled >nul 2>&1

echo.
echo  [THANH CONG] Da xoa 40+ bloatware!
echo  [%DATE% %TIME%] Debloater All >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto debloater_advanced

:debloat_select
cls
echo.
echo  +======================================================================+
echo  ^|              CHON UNG DUNG DE XOA                                    ^|
echo  +======================================================================+
echo.
echo  [1] Bing Apps (News, Weather, Finance, Sports)
echo  [2] Microsoft Office Apps (OneNote, Office Hub)
echo  [3] Entertainment (Groove, Movies, Solitaire)
echo  [4] Communication (Teams, Skype, Your Phone)
echo  [5] Utilities (Alarms, Maps, Feedback Hub)
echo  [6] 3D Apps (3D Builder, 3D Viewer, Paint 3D)
echo  [7] Xbox Apps
echo  [8] Windows 11 Bloat (Copilot, Widgets, Get Started)
echo  [0] Quay lai
echo.
set /p sel_choice=  Nhap lua chon: 

if "%sel_choice%"=="1" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Bing* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Bing Apps!
)
if "%sel_choice%"=="2" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Office Apps!
)
if "%sel_choice%"=="3" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *ZuneMusic* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *ZuneVideo* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Solitaire* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Entertainment Apps!
)
if "%sel_choice%"=="4" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MSTeams* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Communication Apps!
)
if "%sel_choice%"=="5" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Utilities!
)
if "%sel_choice%"=="6" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3D* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa 3D Apps!
)
if "%sel_choice%"=="7" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Xbox Apps!
)
if "%sel_choice%"=="8" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Copilot* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *WebExperience* | Remove-AppxPackage" >nul 2>&1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage" >nul 2>&1
    echo  [OK] Da xoa Windows 11 Bloat!
)
if "%sel_choice%"=="0" goto debloater_advanced
pause
goto debloat_select

:debloat_cortana
echo  [INFO] Dang xoa Cortana...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Cortana* | Remove-AppxPackage" >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
echo  [THANH CONG] Da xoa Cortana!
pause
goto debloater_advanced

:debloat_wmp
echo  [INFO] Dang xoa Windows Media Player...
dism /online /Disable-Feature /FeatureName:WindowsMediaPlayer /NoRestart >nul 2>&1
echo  [THANH CONG] Da xoa Windows Media Player!
pause
goto debloater_advanced

:debloat_ie
echo  [INFO] Dang xoa Internet Explorer...
dism /online /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64 /NoRestart >nul 2>&1
echo  [THANH CONG] Da xoa Internet Explorer!
pause
goto debloater_advanced

:debloat_3d
echo  [INFO] Dang xoa 3D Apps...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Print3D* | Remove-AppxPackage" >nul 2>&1
echo  [THANH CONG] Da xoa 3D Apps!
pause
goto debloater_advanced

:debloat_skype
echo  [INFO] Dang xoa Skype...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Skype* | Remove-AppxPackage" >nul 2>&1
echo  [THANH CONG] Da xoa Skype!
pause
goto debloater_advanced

:debloat_games
echo  [INFO] Dang xoa Microsoft Games...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Solitaire* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *BubbleWitch* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Minecraft* | Remove-AppxPackage" >nul 2>&1
echo  [THANH CONG] Da xoa Microsoft Games!
pause
goto debloater_advanced

:debloat_office
echo  [INFO] Dang xoa Office Bloatware...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage" >nul 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage *Office.Desktop* | Remove-AppxPackage" >nul 2>&1
echo  [THANH CONG] Da xoa Office Bloatware!
pause
goto debloater_advanced

:: =====================================================
:: THOAT
:: =====================================================
:thoat
cls
echo.
echo  +======================================================================+
echo  ^|              CAM ON BAN DA SU DUNG GL-TWEAK!                         ^|
echo  +======================================================================+
echo.
echo  [INFO] Log duoc luu tai: C:\GL-TWEAK_Logs\Log.txt
echo  [INFO] Khuyen nghi khoi dong lai may tinh de ap dung day du cac thay doi.
echo.
echo  [%DATE% %TIME%] Ket thuc GL-TWEAK >> "C:\GL-TWEAK_Logs\Log.txt"
timeout 3 > nul
exit


:: =====================================================
:: TINH NANG BO SUNG TU ONECLICK
:: =====================================================

:: =====================================================
:: 23. XOA SMARTSCREEN
:: =====================================================
:xoa_smartscreen
cls
echo.
echo  +======================================================================+
echo  ^|              XOA SMARTSCREEN                                         ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Smartscreen giup bao ve may tinh khoi malware.
echo  Chi xoa neu ban biet minh dang lam gi!
echo  Ban co muon tiep tuc? (Y/N)
set /p ss_confirm=  Nhap lua chon: 
if /i not "%ss_confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang xoa Smartscreen...

set "SmartscreenItem1=C:\Windows\System32\smartscreen.exe"
set "SmartscreenItem2=C:\Windows\SystemApps\Microsoft.Windows.AppRep.ChxApp_cw5n1h2txyewy\CHXSmartScreen.exe"

if not exist "C:\GL-TWEAK_Logs\Backup\Smartscreen" mkdir "C:\GL-TWEAK_Logs\Backup\Smartscreen" >nul 2>&1

if exist "%SmartscreenItem1%" (
    takeown /F "%SmartscreenItem1%" >nul 2>&1
    icacls "%SmartscreenItem1%" /grant administrators:F >nul 2>&1
    copy /Y "%SmartscreenItem1%" "C:\GL-TWEAK_Logs\Backup\Smartscreen" >nul 2>&1
    del "%SmartscreenItem1%" /s /f /q >nul 2>&1
    echo  - Da xoa: smartscreen.exe
) else (
    echo  - Khong tim thay: smartscreen.exe
)

if exist "%SmartscreenItem2%" (
    takeown /F "%SmartscreenItem2%" >nul 2>&1
    icacls "%SmartscreenItem2%" /grant administrators:F >nul 2>&1
    copy /Y "%SmartscreenItem2%" "C:\GL-TWEAK_Logs\Backup\Smartscreen" >nul 2>&1
    del "%SmartscreenItem2%" /s /f /q >nul 2>&1
    echo  - Da xoa: CHXSmartScreen.exe
) else (
    echo  - Khong tim thay: CHXSmartScreen.exe
)

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f >nul 2>&1

echo.
echo  [THANH CONG] Da xoa Smartscreen!
echo  [INFO] Backup luu tai: C:\GL-TWEAK_Logs\Backup\Smartscreen
echo  [%DATE% %TIME%] Xoa Smartscreen >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 24. XOA LOCKAPP
:: =====================================================
:xoa_lockapp
cls
echo.
echo  +======================================================================+
echo  ^|              XOA LOCKAPP                                             ^|
echo  +======================================================================+
echo.
echo  [INFO] LockApp la ung dung man hinh khoa Windows.
echo  Xoa se giup khoi dong nhanh hon.
echo  Ban co muon tiep tuc? (Y/N)
set /p la_confirm=  Nhap lua chon: 
if /i not "%la_confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang xoa LockApp...

set "LockAppItem1=C:\Windows\SystemApps\Microsoft.LockApp_cw5n1h2txyewy\LockApp.exe"

if not exist "C:\GL-TWEAK_Logs\Backup\LockApp" mkdir "C:\GL-TWEAK_Logs\Backup\LockApp" >nul 2>&1

if exist "%LockAppItem1%" (
    takeown /F "%LockAppItem1%" >nul 2>&1
    icacls "%LockAppItem1%" /grant administrators:F >nul 2>&1
    copy /Y "%LockAppItem1%" "C:\GL-TWEAK_Logs\Backup\LockApp" >nul 2>&1
    del "%LockAppItem1%" /s /f /q >nul 2>&1
    echo  - Da xoa: LockApp.exe
) else (
    echo  - Khong tim thay: LockApp.exe
)

echo.
echo  [THANH CONG] Da xoa LockApp!
echo  [INFO] Backup luu tai: C:\GL-TWEAK_Logs\Backup\LockApp
echo  [%DATE% %TIME%] Xoa LockApp >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 25. DAT GAME PRIORITY (HIGH PERFORMANCE + HIGH PRIORITY)
:: =====================================================
:dat_game_priority
cls
echo.
echo  +======================================================================+
echo  ^|              DAT GAME PRIORITY                                       ^|
echo  +======================================================================+
echo.
echo  [INFO] Dat cac game pho bien thanh High Performance va High Priority.
echo.

set regKeyHP=HKCU\Software\Microsoft\DirectX\UserGpuPreferences
set regKeyFO=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers

echo  [INFO] Dang dat priority cho cac game...

:: Fortnite
reg add "%regKeyHP%" /v "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Fortnite

:: Valorant
reg add "%regKeyHP%" /v "C:\Riot Games\VALORANT\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Riot Games\VALORANT\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Valorant

:: CS2
reg add "%regKeyHP%" /v "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\bin\win64\cs2.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\bin\win64\cs2.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - CS2

:: Apex Legends
reg add "%regKeyHP%" /v "C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\r5apex.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\r5apex.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Apex Legends

:: League of Legends
reg add "%regKeyHP%" /v "C:\Riot Games\League of Legends\Game\League of Legends.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Riot Games\League of Legends\Game\League of Legends.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - League of Legends

:: Minecraft
reg add "%regKeyHP%" /v "C:\Program Files (x86)\Minecraft Launcher\MinecraftLauncher.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files (x86)\Minecraft Launcher\MinecraftLauncher.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Minecraft

:: Roblox
reg add "%regKeyHP%" /v "%LocalAppData%\Roblox\Versions\RobloxPlayerBeta.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "%LocalAppData%\Roblox\Versions\RobloxPlayerBeta.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Roblox

:: GTA V
reg add "%regKeyHP%" /v "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\GTA5.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\GTA5.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - GTA V

:: Overwatch 2
reg add "%regKeyHP%" /v "C:\Program Files (x86)\Overwatch\_retail_\Overwatch.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files (x86)\Overwatch\_retail_\Overwatch.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Overwatch 2

:: Rust
reg add "%regKeyHP%" /v "C:\Program Files (x86)\Steam\steamapps\common\Rust\RustClient.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
reg add "%regKeyFO%" /v "C:\Program Files (x86)\Steam\steamapps\common\Rust\RustClient.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDXMAXIMIZEDWINDOWEDMODE" /f >nul 2>&1
echo  - Rust

echo.
echo  [THANH CONG] Da dat Game Priority cho cac game pho bien!
echo  [%DATE% %TIME%] Dat Game Priority >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 26. VO HIEU HOA DRIVERS KHONG CAN THIET
:: =====================================================
:vo_hieu_drivers
cls
echo.
echo  +======================================================================+
echo  ^|              VO HIEU HOA DRIVERS KHONG CAN THIET                     ^|
echo  +======================================================================+
echo.
echo  [CANH BAO] Chi tat cac drivers khong can thiet cho gaming.
echo  Ban co muon tiep tuc? (Y/N)
set /p drv_confirm=  Nhap lua chon: 
if /i not "%drv_confirm%"=="Y" goto menu_chinh

echo.
echo  [INFO] Dang vo hieu hoa drivers...

:: Tat Hyper-V drivers
sc config hvservice start=disabled >nul 2>&1
sc config HvHost start=disabled >nul 2>&1

:: Tat Print drivers (neu khong dung may in)
sc config Spooler start=disabled >nul 2>&1

:: Tat Fax
sc config Fax start=disabled >nul 2>&1

:: Tat Tablet Input
sc config TabletInputService start=disabled >nul 2>&1

:: Tat Touch Keyboard
sc config TouchInputService start=disabled >nul 2>&1

:: Tat Parental Controls
sc config WpcMonSvc start=disabled >nul 2>&1

:: Tat Windows Biometric
sc config WbioSrvc start=disabled >nul 2>&1

:: Tat Smart Card
sc config SCardSvr start=disabled >nul 2>&1
sc config ScDeviceEnum start=disabled >nul 2>&1

:: Tat Secondary Logon
sc config seclogon start=disabled >nul 2>&1

echo.
echo  [THANH CONG] Da vo hieu hoa drivers khong can thiet!
echo  [%DATE% %TIME%] Vo hieu drivers >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 27. INTEL SERVICES OPTIMIZER
:: =====================================================
:intel_services
cls
echo.
echo  +======================================================================+
echo  ^|              INTEL SERVICES OPTIMIZER                                ^|
echo  +======================================================================+
echo.
echo  [INFO] Tat cac Intel services khong can thiet...

sc config jhi_service start=disabled >nul 2>&1
echo  - jhi_service (Intel DAL)
sc config WMIRegistrationService start=disabled >nul 2>&1
echo  - WMIRegistrationService
sc config Intel(R) Capability Licensing Service TCP IP Interface start=disabled >nul 2>&1
echo  - Intel Capability Licensing Service
sc config Intel(R) TPM Provisioning Service start=disabled >nul 2>&1
echo  - Intel TPM Provisioning Service
sc config ipfsvc start=disabled >nul 2>&1
echo  - ipfsvc (Intel Innovation Platform)
sc config IntelAudioService start=disabled >nul 2>&1
echo  - IntelAudioService
sc config igccservice start=disabled >nul 2>&1
echo  - igccservice (Intel Graphics Command Center)
sc config iaStorAfsService start=disabled >nul 2>&1
echo  - iaStorAfsService (Intel Optane)

echo.
echo  [THANH CONG] Da toi uu Intel Services!
echo  [%DATE% %TIME%] Intel Services >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh

:: =====================================================
:: 28. AMD SERVICES OPTIMIZER
:: =====================================================
:amd_services
cls
echo.
echo  +======================================================================+
echo  ^|              AMD SERVICES OPTIMIZER                                  ^|
echo  +======================================================================+
echo.
echo  [INFO] Tat cac AMD services khong can thiet...

reg query "HKLM\System\CurrentControlSet\Services\AMD Crash Defender Service" >nul 2>&1
if %errorlevel%==0 (
    sc config "AMD Crash Defender Service" start=disabled >nul 2>&1
    echo  - AMD Crash Defender Service
)

reg query "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" >nul 2>&1
if %errorlevel%==0 (
    sc config "AMD External Events Utility" start=disabled >nul 2>&1
    echo  - AMD External Events Utility
)

reg query "HKLM\System\CurrentControlSet\Services\amdlog" >nul 2>&1
if %errorlevel%==0 (
    sc config "amdlog" start=disabled >nul 2>&1
    echo  - amdlog
)

reg query "HKLM\System\CurrentControlSet\Services\AMDRyzenMasterDriverV22" >nul 2>&1
if %errorlevel%==0 (
    sc config "AMDRyzenMasterDriverV22" start=disabled >nul 2>&1
    echo  - AMDRyzenMasterDriverV22
)

echo.
echo  [THANH CONG] Da toi uu AMD Services!
echo  [%DATE% %TIME%] AMD Services >> "C:\GL-TWEAK_Logs\Log.txt"
pause
goto menu_chinh
