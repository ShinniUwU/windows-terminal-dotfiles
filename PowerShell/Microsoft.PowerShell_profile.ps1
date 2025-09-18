# suppress loading message 
$OriginalVerbosePreference = $VerbosePreference
$VerbosePreference = 'SilentlyContinue'

# clear the host
Clear-Host

function Run-IfInstalled {
    param ([string]$Command)
    if (Get-Command $Command -ErrorAction SilentlyContinue) {
        try {
            & $Command
        } catch {
            Write-Verbose ("Failed to run {0}: {1}" -f $Command, $_)
        }
    }
}

# runs Fetch based on what you have
Run-IfInstalled hyfetch
Run-IfInstalled fastfetch
Run-IfInstalled neofetch

# starship
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"

# load Starship
Invoke-Expression (&starship init powershell)

# restore verbose preference
$VerbosePreference = $OriginalVerbosePreference
