@echo off
set output_file=%USERPROFILE%\Desktop\output.txt

echo Enumerating Windows Server Information... > "%output_file%"
echo. >> "%output_file%"

:: === SYSTEM INFORMATION ===
echo === System Version === >> "%output_file%"
ver >> "%output_file%"
echo. >> "%output_file%"

echo === Hostname === >> "%output_file%"
hostname >> "%output_file%"
echo. >> "%output_file%"

echo === System Information === >> "%output_file%"
systeminfo >> "%output_file%"
echo. >> "%output_file%"

echo === Installed Updates === >> "%output_file%"
wmic qfe get Caption,Description,HotFixID,InstalledOn >> "%output_file%"
echo. >> "%output_file%"

echo === Installed Software === >> "%output_file%"
wmic product get name,version,vendor >> "%output_file%"
echo. >> "%output_file%"

echo === Drivers === >> "%output_file%"
driverquery >> "%output_file%"
echo. >> "%output_file%"

:: === USER INFORMATION ===
echo === Current User === >> "%output_file%"
whoami >> "%output_file%"
echo. >> "%output_file%"

echo === User Details === >> "%output_file%"
net user %USERNAME% >> "%output_file%"
echo. >> "%output_file%"

echo === User Accounts === >> "%output_file%"
net users >> "%output_file%"
echo. >> "%output_file%"

echo === Local Groups === >> "%output_file%"
net localgroup >> "%output_file%"
echo. >> "%output_file%"

echo === User Privileges === >> "%output_file%"
whoami /priv >> "%output_file%"
echo. >> "%output_file%"

echo === User Groups === >> "%output_file%"
whoami /groups >> "%output_file%"
echo. >> "%output_file%"

echo === Group Policy Results === >> "%output_file%"
gpresult /R >> "%output_file%"
echo. >> "%output_file%"

:: === NETWORK INFORMATION ===
echo === Network Configuration === >> "%output_file%"
ipconfig /all >> "%output_file%"
echo. >> "%output_file%"

echo === Active Connections === >> "%output_file%"
netstat -ano >> "%output_file%"
echo. >> "%output_file%"

echo === ARP Table === >> "%output_file%"
arp -a >> "%output_file%"
echo. >> "%output_file%"

echo === Routing Table === >> "%output_file%"
route print >> "%output_file%"
echo. >> "%output_file%"

echo === Shared Folders === >> "%output_file%"
net share >> "%output_file%"
echo. >> "%output_file%"

echo === Network Resources === >> "%output_file%"
net view \\%COMPUTERNAME% >> "%output_file%"
echo. >> "%output_file%"

echo === Windows Firewall Settings === >> "%output_file%"
netsh advfirewall show allprofiles >> "%output_file%"
echo. >> "%output_file%"

:: === SYSTEM SERVICES & TASKS ===
echo === All Services === >> "%output_file%"
sc query state=all >> "%output_file%"
echo. >> "%output_file%"

echo === Windows Services Details === >> "%output_file%"
wmic service get name,displayname,pathname,startmode >> "%output_file%"
echo. >> "%output_file%"

echo === Running Tasks === >> "%output_file%"
tasklist /svc >> "%output_file%"
echo. >> "%output_file%"

echo === Scheduled Tasks === >> "%output_file%"
schtasks /query /fo LIST /v >> "%output_file%"
echo. >> "%output_file%"

:: === SECURITY & PERMISSIONS ===
echo === Registry Startup Programs (Local Machine) === >> "%output_file%"
reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run >> "%output_file%"
echo. >> "%output_file%"

echo === Registry Startup Programs (Current User) === >> "%output_file%"
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run >> "%output_file%"
echo. >> "%output_file%"

echo === Startup Applications === >> "%output_file%"
wmic startup get caption,command >> "%output_file%"
echo. >> "%output_file%"

echo === ACLs for ProgramData === >> "%output_file%"
icacls C:\ProgramData >> "%output_file%"
echo. >> "%output_file%"

echo === ACLs for System32 === >> "%output_file%"
icacls C:\Windows\System32 >> "%output_file%"
echo. >> "%output_file%"

echo Enumeration completed! Results saved in %output_file%.
pause
