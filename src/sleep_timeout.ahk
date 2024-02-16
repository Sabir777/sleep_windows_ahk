#Persistent

t_start := 900000 ; ������� �������� ��: 15 ����� (����������)
dt := 10000 ; ������� ������ �������: 1 ���/� 10 ������
t_timeout := 300000 ; ����� ����������� = 5 �����
EnvSet, ENV_SLEEP, state_work ; ��������� � ENV_SLEEP "state_work" (������)
SetTimer, start, % t_start ; �������� ������ ������ 15 ����� - ���� �������� ��
return

start:
  SetTimer, start, Off ; ������ start �������� ����������
  SetTimer, timeout, % dt ; ������ ��������� �������
  return

timeout:
  EnvGet, state, ENV_SLEEP ; �������� �������� ENV_SLEEP � state

  if (A_TimeIdlePhysical < t_timeout && state = "state_sleep"){
    EnvSet, ENV_SLEEP, state_work ; ��������� � ENV_SLEEP "state_work" (������)
  }
  else if (A_TimeIdlePhysical >= t_timeout && state = "state_work"){
    EnvSet, ENV_SLEEP, state_sleep ; ��������� � ENV_SLEEP "state_sleep" (������)
    Run % "C:\Windows\System32\rundll32.exe PowrProf.dll,SetSuspendState" ; ������� � ���
  }
  return

