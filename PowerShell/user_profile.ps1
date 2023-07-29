# Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tiwahu.omp.json" | Invoke-Expression

<# Nice themes
-- takuya
-- tiwahu
-- hul10
#>

# Function
function lsall { Get-ChildItem $args -Force }

# Alias
Set-Alias vcpkg 'D:\Program Files\Vcpkg\vcpkg.exe'
Set-Alias lsa lsall
