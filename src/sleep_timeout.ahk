#Persistent

t_start := 900000 ; пропуск загрузки ПК: 15 минут (однократно)
dt := 10000 ; частота опроса таймера: 1 раз/в 10 секунд
t_timeout := 300000 ; время бездействия = 5 минут
EnvSet, ENV_SLEEP, state_work ; записываю в ENV_SLEEP "state_work" (строка)
SetTimer, start, % t_start ; запускаю первый таймер 15 минут - идет загрузка ПК
return

start:
  SetTimer, start, Off ; таймер start сработал однократно
  SetTimer, timeout, % dt ; запуск основного таймера
  return

timeout:
  EnvGet, state, ENV_SLEEP ; считываю значение ENV_SLEEP в state

  if (A_TimeIdlePhysical < t_timeout && state = "state_sleep"){
    EnvSet, ENV_SLEEP, state_work ; записываю в ENV_SLEEP "state_work" (строка)
  }
  else if (A_TimeIdlePhysical >= t_timeout && state = "state_work"){
    EnvSet, ENV_SLEEP, state_sleep ; записываю в ENV_SLEEP "state_sleep" (строка)
    Run % "C:\Windows\System32\rundll32.exe PowrProf.dll,SetSuspendState" ; Переход в сон
  }
  return

