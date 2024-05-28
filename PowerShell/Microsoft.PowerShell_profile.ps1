# Clear the host
Clear-Host

# Run fastfetch (if installed)
fastfetch

# Set the environment variable for the Starship configuration
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"


# Initialize Starship prompt
Invoke-Expression (&starship init powershell)
