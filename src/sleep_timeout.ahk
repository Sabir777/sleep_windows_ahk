#Persistent

t_start := 900000 ; пропуск загрузки ПК: 15 минут (однократно)
dt := 10000 ; частота опроса таймера: 1 раз/в 10 секунд
t_timeout := 300000 ; время бездействия = 5 минут
timeout_on := false ; флаг - против многократного засыпания
SetTimer, start, % t_start
return

start:
  SetTimer, start, Off
  SetTimer, timeout, % dt
  return

timeout:
  if (A_TimeIdlePhysical < t_timeout){
    timeout_on := false
  }
  else if (!timeout_on){
    timeout_on := true
    Run % "C:\Windows\System32\rundll32.exe PowrProf.dll,SetSuspendState" ; Переход в сон
  }
  return
