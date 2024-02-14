#Persistent

t_start := 900000 ; ������� �������� ��: 15 ����� (����������)
dt := 10000 ; ������� ������ �������: 1 ���/� 10 ������
t_timeout := 300000 ; ����� ����������� = 5 �����
timeout_on := false ; ���� - ������ ������������� ���������
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
    Run % "C:\Windows\System32\rundll32.exe PowrProf.dll,SetSuspendState" ; ������� � ���
  }
  return
