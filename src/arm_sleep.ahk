;������������ �������� "state_sleep" � ���������� ����� ENV_SLEEP
EnvSet, ENV_SLEEP, state_sleep
; ������� � ���
Run % "C:\Windows\System32\rundll32.exe PowrProf.dll,SetSuspendState"
