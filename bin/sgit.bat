@echo off & setlocal
set batchPath=%~dp0
powershell.exe -executionpolicy bypass -File "%batchPath%sgit.ps1" %*
