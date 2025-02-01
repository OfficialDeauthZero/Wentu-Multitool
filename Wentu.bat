@echo off
title Wentu Multitool - Enhanced Version
color 0A

:menu
cls
echo ==================================================
echo                  Welcome to Wentu!
echo           Your All-in-One Multitool Script
echo ==================================================
echo [1] Display System Information
echo [2] Scan Open Ports (Netstat and Nmap)
echo [3] Ping a Host
echo [4] Check Internet Connectivity
echo [5] Network Sniffer
echo [6] Disk Space & Memory Usage
echo [7] IP Lookup / DNS Info (nslookup)
echo [8] Exit Wentu
echo ==================================================
set /p choice="Enter your choice (1-11): "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto portscan
if "%choice%"=="3" goto pinghost
if "%choice%"=="4" goto checkinternet
if "%choice%"=="5" goto networksniffer
if "%choice%"=="6" goto diskmemory
if "%choice%"=="7" goto iplookup
if "%choice%"=="8" goto exit

:invalid
echo Invalid choice. Please select a valid option.
pause
goto menu

:sysinfo
echo ==================================================
echo Displaying System Information...
echo ==================================================
systeminfo
echo ==================================================
echo CPU Info:
wmic cpu get caption
echo ==================================================
echo Memory Info:
wmic memorychip get devicelocator, capacity
pause
goto menu

:portscan
echo ==================================================
echo Scanning for Open Ports (Netstat and Nmap)...
echo ==================================================
set /p target="Enter IP address or Hostname to scan: "
echo Scanning for open ports on %target%...
nmap %target%
pause
goto menu

:pinghost
echo ==================================================
echo Ping a Host
echo ==================================================
set /p host="Enter the host or IP to ping: "
ping %host%
pause
goto menu

:checkinternet
echo ==================================================
echo Checking Internet Connectivity...
echo ==================================================
ping google.com -n 4
pause
goto menu

:networksniffer
echo ==================================================
echo Running Network Sniffer (ARP and Netstat)...
echo ==================================================
echo [1] Show Active Network Connections (Netstat)
echo [2] View ARP Table
echo [3] DNS Info (nslookup)
echo [4] Return to Wentu Menu
echo ==================================================
set /p snifferchoice="Select your option (1-4): "

if "%snifferchoice%"=="1" (
    echo Showing active connections...
    netstat -an
    pause
    goto networksniffer
) 
if "%snifferchoice%"=="2" (
    echo Displaying ARP Table...
    arp -a
    pause
    goto networksniffer
) 
if "%snifferchoice%"=="3" (
    set /p domain="Enter the domain to look up: "
    nslookup %domain%
    pause
    goto networksniffer
) 
if "%snifferchoice%"=="4" goto menu

echo Invalid choice. Returning to Wentu Menu.
pause
goto menu

:diskmemory
echo ==================================================
echo Checking Disk Space and Memory Usage...
echo ==================================================
echo Disk Space:
wmic logicaldisk get deviceid, volumename, description, freespace
echo ==================================================
echo Memory Usage:
wmic os get freephysicalmemory, totalvisiblememorysize /format:list
pause
goto menu

:iplookup
echo ==================================================
echo IP Lookup and DNS Information (nslookup)...
echo ==================================================
set /p ip="Enter an IP Address or Domain: "
nslookup %ip%
pause
goto menu

:exit
echo Exiting Wentu Multitool. Goodbye!
pause
exit
