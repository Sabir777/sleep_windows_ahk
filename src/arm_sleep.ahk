;Устанавливаю значение "state_sleep" в переменную среды ENV_SLEEP
EnvSet, ENV_SLEEP, state_sleep
; Переход в сон
Run % "C:\Windows\System32\rundll32.exe PowrProf.dll,SetSuspendState"
