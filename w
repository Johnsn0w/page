# Get the items to populate the options menu
# Pull the data for the files in particular repo folder

$username    = "Johnsn0w"
$folder      = "ps"
$folder_path = "https://api.github.com/repos/$username/page/contents/$folder"
$irm_path    = "https://raw.githubusercontent.com/$username/page/main/$folder/"

$options = (Invoke-RestMethod "$folder_path").name

# Display selection menu dynamically
Write-Host "Select an option:"
for ($i = 0; $i -lt $options.Count; $i++) {
    Write-Host "$($i + 1). Run $($options[$i])"
}

# Read user input
$key = [console]::ReadKey($true).KeyChar
Write-Host "`nYou selected: $key"

# Ensure key is a valid number
if ($key -match '^\d$') {
    $index = [int]::Parse($key) - 1  # Safer parsing
    if ($index -ge 0 -and $index -lt $options.Count) {
        Write-Host "Executing: $($options[$index])"
        irm "$irm_path$($options[$index])" | iex
    } else {
        Write-Host "Invalid selection (out of range)."
    }
} else {
    Write-Host "Invalid input (not a digit)."
}
