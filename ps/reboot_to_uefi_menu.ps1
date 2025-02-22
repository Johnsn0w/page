# Check if running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptPath = $PSCommandPath
    $workingDir = Get-Location  # Capture current directory
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -WorkingDirectory `"$workingDir`"" -Verb RunAs
    exit
}

Read-Host "Press enter to reboot into advanced boot options....."
Read-Host "Ok just double-checking, press enter again....."

shutdown /r /o /soft /t 0

Read-Host "rebooting..."

