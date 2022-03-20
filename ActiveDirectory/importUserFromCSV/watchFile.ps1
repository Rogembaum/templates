$f=ls file_name.csv
$c="add_user_in_AD.ps1"

function watch($f, $command, $interval) {
    $sha1 = New-Object System.Security.Cryptography.SHA1CryptoServiceProvider
    $hashfunction = '[System.BitConverter]::ToString($sha1.ComputeHash([System.IO.File]::ReadAllBytes($file)))'
    $files = @{}

    foreach ($file in $f) {
        $hash = iex $hashfunction
        $files[$file.Name] = $hash
        echo "$hash`t$($file.FullName)"
    }
    while ($true) {
        sleep $interval
        foreach ($file in $f) {
            $hash = iex $hashfunction
            if ($files[$file.Name] -ne $hash) {
                iex $command
                $files[$file.Name] = $hash
            }
        }
    }
}

watch $f $c 5