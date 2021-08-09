#requires -v 3
param($cmd)

$commands = commands

if ('--version' -contains $cmd -or (!$cmd -and '-v' -contains $args)) {
    
}
