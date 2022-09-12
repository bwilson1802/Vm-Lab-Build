############################# V1 #################################

#open M20740C Lab 4

New-VM -Name LON-TestSVR2 -MemoryStartupBytes 512MB -Path C:\ProgramData\Microsoft\Windows\Hyper-V\
New-VHD -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-TestSVR2.vhdx" -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName LON-TestSVR2 -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-TestSVR2.vhdx"
Set-VMDvdDrive -VMName LON-TestSVR2 -ControllerNumber 1 -Path "C:\Users\bwils\Desktop\MSSA\ISO\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

Start-VM –Name LON-TestSVR2
Get-VM LON-TestSVR2

#open the VM
#click next
#click install
#server 2016 datacenter 
#click next
#click accept
#click next
# custom
#ok
#Pa55w.rd tab Pa55w.rd
#ok


############################# V2 #################################



############
New-VM -Name RTR -MemoryStartupBytes 512MB -Path C:\ProgramData\Microsoft\Windows\Hyper-V\
New-VHD -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\RTR.vhdx" -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName RTR -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\RTR.vhdx"
Set-VMDvdDrive -VMName RTR -ControllerNumber 1 -Path "C:\Users\bwils\Desktop\MSSA\ISO\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
Start-VM –Name RTR
Get-VM RTR
connect-vm

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.1 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.1 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.1 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.1 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10

############
New-VM -Name LON-DC1 -MemoryStartupBytes 512MB -Path C:\ProgramData\Microsoft\Windows\Hyper-V\
New-VHD -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-DC1.vhdx" -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName LON-DC1 -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-DC1.vhdx"
Set-VMDvdDrive -VMName LON-DC1 -ControllerNumber 1 -Path "C:\Users\bwils\Desktop\MSSA\ISO\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
Start-VM –Name LON-DC1
Get-VM LON-DC1

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.10 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10

############
New-VM -Name LON-SVR1 -MemoryStartupBytes 512MB -Path C:\ProgramData\Microsoft\Windows\Hyper-V\
New-VHD -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-SVR1.vhdx" -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName LON-SVR1 -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-SVR1.vhdx"
Set-VMDvdDrive -VMName LON-SVR1 -ControllerNumber 1 -Path "C:\Users\bwils\Desktop\MSSA\ISO\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
Start-VM –Name LON-SVR1
Get-VM LON-SVR1

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.11 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10

############
New-VM -Name LON-SVR2 -MemoryStartupBytes 512MB -Path C:\ProgramData\Microsoft\Windows\Hyper-V\
New-VHD -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-SVR2.vhdx" -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName LON-SVR2 -Path "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\LON-SVR2.vhdx"
Set-VMDvdDrive -VMName LON-SVR2 -ControllerNumber 1 -Path "C:\Users\bwils\Desktop\MSSA\ISO\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
Start-VM –Name LON-SVR2
Get-VM LON-SVR2

new-netipaddress -InterfaceIndex 2 -IPAddress 10.10.1.12 -PrefixLength 26 -AddressFamily IPv4 -defaultgateway 10.10.0.1  
Set-DnsClientServerAddress -InterfaceIndex 2 -serveraddress 10.10.1.10



############################# V3 #################################

<#
hardcode the parm in C:\Users\bwils\Desktop\MSSA\PowerShell\HyperV Create.csv

Example CSV lines:
$VMName - RTR
$MemoryPath - C:\ProgramData\Microsoft\Windows\Hyper-V\
$VHDPath - "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\$VMName.vhdx"
$VMDisk - C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\$VMName.vhdx
$RAM - 512
$ISO - C:\Users\bwils\Desktop\MSSA\ISO\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO



#>


# Sets each parm and builds all the VMs in the CSV
import-csv "C:\Users\bwils\Desktop\MSSA\PowerShell\HyperV Create.csv" | foreach-object {
$VMName = $_.VMName
$MemoryPath = $_.MemoryPath
$VHDPath = $_.VHDPath
$VMDisk = $_.VMDisk
$RAM = $_.RAM
$ISO = $_.ISO

# hard coded memory size

New-VM -Name $VMName -MemoryStartupBytes 512MB -Path $MemoryPath
New-VHD -Path $VHDPath -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName $VMName -Path $VMDisk
Set-VMDvdDrive -VMName $VMName -ControllerNumber 1 -Path $ISO
Start-VM –Name $VMName
Get-VM $VMName
}


############################# V4 #################################

<#
Excel config file C:\MyLab -> convert to csv
Add the values for the machines to be created
Change the hard coded memory sizes
click the install tasks

#>

import-csv "C:\MyLab\Test_Config_File.csv" | foreach-object {
$VMName = $_.VMName
$MemoryPath = $_.MemoryPath
$VHDPath = $_.VHDPath
$VMDisk = $_.VMDisk
$RAM = $_.RAM
$ISO = $_.ISO

# hard coded memory size

New-VM -Name $VMName -MemoryStartupBytes 512MB -Path $MemoryPath
New-VHD -Path $VHDPath -SizeBytes 60GB -Dynamic
Add-VMHardDiskDrive -VMName $VMName -Path $VMDisk
Set-VMDvdDrive -VMName $VMName -ControllerNumber 1 -Path $ISO
Start-VM –Name $VMName
Get-VM $VMName
}

#open the VM
#click next
#click install
#server 2016 datacenter 
#click next
#click accept
#click next
# custom
#ok
#Pa55w.rd tab Pa55w.rd
#ok

<#
PSSession for vitural switch & config IP

#>

Set-ExecutionPolicy RemoteSigned
Enable-PSremoting
Get-PSSessionConfiguration




