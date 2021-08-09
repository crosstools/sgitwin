#requires -v 3
param($cmd)

$commands = commands

$NewVersion = (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/crosstools/sgitwin/main/VERSION").Content
$CurrentVersion = Get-Content -Path "$psscriptroot\VERSION"

if ($NewVersion -ne $CurrentVersion) {
    Write-Warning -Message "Current Sgitwin Version: $CurrentVersion, New Version: $NewVersion, You are not up to date with Sgitwin. Please enter 'sgit install'."
} else {
    Write-Output "Current Sgitwin Version: $CurrentVersion, You're up to date with Sgitwin!"
}

if ('--version' -contains $cmd -or (!$cmd -and '-v' -contains $args)) {
    Write-Output "sgitwin windows $CurrentVersion"
} elseif (@($null, '--help', '/?') -contains $cmd -or $args[0] -contains '-h') {
    Invoke-Expression 'help' $args
} elseif ($commands -contains $cmd) {
    Invoke-Expression $cmd $args
} else {
    Write-Output "sgit: '$cmd' isn't a sgit command. See 'sgit help'."
    exit 1
}
