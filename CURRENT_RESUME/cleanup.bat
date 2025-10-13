@echo off
echo Cleaning up LaTeX directory...
echo Keeping only *.tex and *.pdf files

:: List files that will be kept
echo.
echo Files to keep:
for %%f in (*.tex *.pdf) do echo   + %%f

echo.
echo Files to remove:
:: Show files that will be removed (everything except .tex, .pdf, and cleanup scripts)
for %%f in (*.*) do (
    if not "%%~xf"==".tex" (
        if not "%%~xf"==".pdf" (
            if not "%%f"=="cleanup.bat" (
                if not "%%f"=="cleanup.ps1" (
                    if not "%%f"=="cleanup.sh" (
                        if not "%%f"=="CLEANUP_README.md" (
                            echo   - %%f
                        )
                    )
                )
            )
        )
    )
)

echo.
set /p confirm="Do you want to proceed? (y/N): "
if /i not "%confirm%"=="y" goto :cancel

:: Remove all files except .tex, .pdf, and cleanup scripts
for %%f in (*.*) do (
    if not "%%~xf"==".tex" (
        if not "%%~xf"==".pdf" (
            if not "%%f"=="cleanup.bat" (
                if not "%%f"=="cleanup.ps1" (
                    if not "%%f"=="cleanup.sh" (
                        if not "%%f"=="CLEANUP_README.md" (
                            echo Removing: %%f
                            del /f /q "%%f" 2>nul
                        )
                    )
                )
            )
        )
    )
)

echo LaTeX cleanup completed!
goto :end

:cancel
echo Cleanup cancelled.

:end
pause