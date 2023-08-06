# Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tiwahu.omp.json" | Invoke-Expression

<# Nice themes
-- takuya
-- tiwahu
-- hul10
#>

# Function
function lsall { Get-ChildItem $args -Force }
function Copy-Filtered { # from https://serverfault.com/questions/707085/copy-item-with-multiple-filter
    param (
        [string] $Source,
        [string] $Target,
        [string[]] $Filter
    )
    $ResolvedSource = Resolve-Path $Source
    $NormalizedSource = $ResolvedSource.Path.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    Get-ChildItem $Source -Include $Filter -Recurse | ForEach-Object {
        $RelativeItemSource = $_.FullName.Replace($NormalizedSource, '')
        $ItemTarget = Join-Path $Target $RelativeItemSource
        $ItemTargetDir = Split-Path $ItemTarget
        if (!(Test-Path $ItemTargetDir)) {
            [void](New-Item $ItemTargetDir -Type Directory)
        }
        Copy-Item $_.FullName $ItemTarget
    }
}

# Alias
Set-Alias vcpkg 'D:\Program Files\Vcpkg\vcpkg.exe'
Set-Alias lsa lsall
