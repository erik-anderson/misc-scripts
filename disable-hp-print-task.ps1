$task = Get-ScheduledTask -TaskPath "\HP\HP Print Scan Doctor\" -TaskName "Printer Health Monitor"
$task.Settings.WakeToRun = $False
$task | Set-ScheduledTask