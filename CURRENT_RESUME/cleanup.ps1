# LaTeX Cleanup Script - Windows PowerShell Version
# This script removes ALL files except *.tex and *.pdf files
# Cross-platform repository compatible

Write-Host "Cleaning up LaTeX directory..." -ForegroundColor Green
Write-Host "Keeping only *.tex and *.pdf files" -ForegroundColor Yellow

# Get current directory
$currentDir = Get-Location
Write-Host "Current directory: $currentDir" -ForegroundColor Yellow

# Get all files except .tex and .pdf
$allFiles = Get-ChildItem -Path $currentDir -File
$filesToKeep = $allFiles | Where-Object { $_.Extension -eq ".tex" -or $_.Extension -eq ".pdf" }
$filesToRemove = $allFiles | Where-Object { $_.Extension -ne ".tex" -and $_.Extension -ne ".pdf" }

if ($filesToKeep.Count -gt 0) {
    Write-Host "Files to keep:" -ForegroundColor Green
    $filesToKeep | ForEach-Object {
        Write-Host "  ✓ $($_.Name)" -ForegroundColor Green
    }
}

if ($filesToRemove.Count -gt 0) {
    Write-Host "Files to remove:" -ForegroundColor Red
    $filesToRemove | ForEach-Object {
        Write-Host "  ✗ $($_.Name)" -ForegroundColor Red
    }
    
    Write-Host ""
    $confirm = Read-Host "Do you want to proceed? (y/N)"
    
    if ($confirm -eq "y" -or $confirm -eq "Y") {
        $filesToRemove | ForEach-Object {
            Write-Host "  Removing: $($_.Name)" -ForegroundColor Gray
            Remove-Item $_.FullName -Force
        }
        Write-Host "Cleanup completed!" -ForegroundColor Green
    } else {
        Write-Host "Cleanup cancelled." -ForegroundColor Yellow
    }
} else {
    Write-Host "No files to remove. Directory is already clean!" -ForegroundColor Green
}