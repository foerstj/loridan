:: This script is supposed to be executed from your DS installation folder.
:: TankCreator and gaspy are expected to be in sibling dirs.

:: name of map
set map=loridan
:: name of map, case-sensitive
set map_cs=Loridan
:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator
:: path of GasPy
set gaspy=..\gaspy

:: param
set mode=%1
echo %mode%

:: pre-build checks
pushd %gaspy%
venv\Scripts\python -m build.check_conversations %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_player_world_locations %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_moods %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_quests %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_dupe_node_ids %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_tips %map%
if %errorlevel% neq 0 pause
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  venv\Scripts\python -m build.check_cam_blocks %map%
  if !errorlevel! neq 0 pause
)
endlocal
popd

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% "%tmp%\Bits"
if %errorlevel% neq 0 pause
setlocal enableDelayedExpansion
if not "%mode%"=="light" (
  venv\Scripts\python -m build.add_world_levels %map% "%tmp%\Bits" "%doc_dsloa%\Bits"
  if !errorlevel! neq 0 pause
)
endlocal
popd
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "Minotaurus 2006" -title "%map_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
