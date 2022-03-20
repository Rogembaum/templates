#########################################
# VARIABLES
#########################################


$setRemoteDir="T:\share\dir.200"
$setNetworkDir="\\server\share\dir.200"



Invoke-Command -ComputerName hv-9.corp.milecom.ru -ScriptBlock { Remove-Item -Path $Using:setRemoteDir }
Invoke-Command -ComputerName hv-9.corp.milecom.ru -ScriptBlock { New-Item -Path $Using:setRemoteDir -ItemType "directory" }

$Acl = Get-Acl -Path $setNetworkDir
$groupRead="Name.number - Чтение"
$groupChange="Name.number - Запись-Удаление"

<#
!!!!!!!!!!!!!!!!
Локацию нужно смотреть - англ или русс
#>
$groupAdmins="Domain Admins"
$groupSys="System"


<#
Group HOSTNAME\Administrators adds automaticaly from parent folder
#>
$AccessRuleRead = New-Object System.Security.AccessControl.FileSystemAccessRule("$groupRead","ReadAndExecute","ContainerInherit,ObjectInherit","None","Allow")
$AccessRuleChange = New-Object System.Security.AccessControl.FileSystemAccessRule("$groupChange","Modify","ContainerInherit,ObjectInherit","None","Allow")
$AccessRuleAdmins = New-Object System.Security.AccessControl.FileSystemAccessRule("$groupAdmins","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$AccessRuleSys = New-Object System.Security.AccessControl.FileSystemAccessRule("$groupSys","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$AccessRuleDeny = New-Object System.Security.AccessControl.FileSystemAccessRule("Все","Delete","Deny")

$acl.SetAccessRule($AccessRuleRead)
$acl.SetAccessRule($AccessRuleChange)
$acl.SetAccessRule($AccessRuleAdmins)
$acl.SetAccessRule($AccessRuleSys)
$acl.SetAccessRule($AccessRuleDeny)


#Disable inheritance
<#
The first parameter is responsible for blocking inheritance from the parent folder. It has two states: “$true” and “$false”.
The second parameter determines whether the current inherited permissions are retained or removed. It has the same two states: “$true” and “$false”.
#>
$acl.SetAccessRuleProtection($true,$false)
$acl | Set-Acl $setNetworkDir