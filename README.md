# Miscellaneous scripts
Scripts to solve minor annoyances.

## disable-hp-print-task.ps1
Did you install HP Printer Software and later find your Windows computer constantly turns itself on after you tell it to sleep? Does `powercfg /lastwake` show this?:
```
> powercfg /lastwake
Wake History Count - 1
Wake History [0]
  Wake Source Count - 1
  Wake Source [0]
    Type: Presume Wake Timer
    Owner: [SERVICE] \Device\HarddiskVolume3\Windows\System32\svchost.exe (SystemEventsBroker)
    Owner Supplied Reason: Windows will execute 'NT TASK\HP\HP Print Scan Doctor\Printer Health Monitor' scheduled task that requested waking the computer.
```

HP appears unaware of the problem and/or is unwilling to stop having the task do this[[1]](https://h30434.www3.hp.com/t5/Printer-Setup-Software-Drivers/Printer-Health-Monitor-task-keeps-waking-PC-from-sleep-state/td-p/8505024)[[2]](https://h30434.www3.hp.com/t5/Printer-Setup-Software-Drivers/NT-TASK-HP-HP-Print-Scan-Doctor-Printer-Health-Monitor-keeps/td-p/8365766)[[3]](https://www.reddit.com/r/sysadmin/comments/w1ir1b/hp_smart_app_schedules_windows_wake_up/).

You can use this script to clear the permission for the task to wake the computer. The HP updater resets the flag on the scheduled task, so the fight to stop it from doing so is an ongoing battle; I set up a scheduled task to run this script with various triggers-- at startup and daily every hour. For the "Action", run `powershell` with the argument `-executionpolicy bypass -File "C:\path\to\disable-hp-print-task.ps1"`. This should ensure the task gets the option turned back off soon after the updater runs.
