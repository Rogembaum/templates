<#
powershell.exe -noexit "& 'C:\admin\Get-Description-OU\get-description-ou\main.ps1'
#>


$success = $false;
$path_parent = ",ou=Groups,DC=corp,dc=domain,DC=local"
do {
    $path_dir = Read-Host -Prompt 'Введите название директории (пример: Коммерческий.1) '
    Write-Host "You input server '$path_dir'"
    $identity="ou="+$path_dir+$path_parent

    try{
        $otv=(Get-ADOrganizationalUnit -Identity $identity -properties description).description
        $success = $true;
    }
    catch {
        Write-Host -ForegroundColor Red $_.Exception.Message "или такой директории не существует"
        Write-Host -ForegroundColor Red "Повторите попытку, пожалуйста"
        $success = $false;
    }
} while ($success -eq $false)


Write-Host -ForegroundColor Green "Ответственный за директорию ""$path"" " $otv