# Cross-Platform LaTeX Cleanup

This directory contains cleanup scripts for removing LaTeX auxiliary files while preserving source (.tex) and output (.pdf) files.

## Windows (PowerShell)
```powershell
.\cleanup.ps1
```

## macOS/Linux (zsh/bash)
```bash
chmod +x cleanup.sh
./cleanup.sh
```

## What gets removed:
- All files except *.tex and *.pdf
- Common examples: .aux, .log, .fdb_latexmk, .fls, .out, .synctex.gz, .DS_Store, etc.

## What gets preserved:
- *.tex (LaTeX source files)
- *.pdf (Generated PDF files)
- cleanup scripts themselves

Both scripts will show you what will be removed and ask for confirmation before proceeding.