# Set the working directory to the script directory
$scriptDir = $PSScriptRoot
Set-Location -Path $scriptDir

# Get the version number from version.txt
$version = Get-Content -Path "./src/version.txt"

# Directory paths
$sourceDirectoryx64 = "./build/release/x64"
$sourceDirectoryx86 = "./build/release/x86"
$destinationDirectory = "./release"

# Remove existing files in the destination directory
Remove-Item -Path $destinationDirectory\* -Force -Recurse

# Create the destination directory if it doesn't exist
if (-not (Test-Path -Path $destinationDirectory)) {
    New-Item -ItemType Directory -Path $destinationDirectory | Out-Null
}

# Copy .msi (x64) files and rename them
Get-ChildItem -Path $sourceDirectoryx64 -Filter *.msi | ForEach-Object {
    $newFileName = $_.BaseName + "-v$version-x64" + $_.Extension
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $newFileName
    Copy-Item -Path $_.FullName -Destination $destinationPath
}
# Copy .msi (x86) files and rename them
Get-ChildItem -Path $sourceDirectoryx86 -Filter *.msi | ForEach-Object {
    $newFileName = $_.BaseName + "-v$version-x86" + $_.Extension
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $newFileName
    Copy-Item -Path $_.FullName -Destination $destinationPath
}

Write-Host "Files copied and renamed successfully."
