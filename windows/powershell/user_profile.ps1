# Developement
# usage:
# $ pwsh-dev-x64.ps1 [MSVC|Clang]

param(
    [String] $Compiler = "MSVC"
)

if ($Compiler -ne "MSVC" -and $Compiler -ne "Clang") {
    Write-Error "Unknown compiler '$Compiler'; must be MSVC or Clang"
    Exit -1
}

Write-Host "Setting up environment variables..."

# VCPKG variables
# Write-Host "Setting up CMAKE VCPKG environment variables..."

#$env:CMAKE_TOOLCHAIN_FILE="[vcpkg root]/scripts/buildsystems/vcpkg.cmake"

# Visual Studio path <https://github.com/microsoft/vswhere/wiki/Find-VC>
$vsPath = &"${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationpath

Write-Host "Microsoft Visual Studio path = '$vsPath'"

# Use module `Microsoft.VisualStudio.DevShell.dll`
Import-Module (Get-ChildItem $vsPath -Recurse -File -Filter Microsoft.VisualStudio.DevShell.dll).FullName

Enter-VsDevShell -VsInstallPath $vsPath -SkipAutomaticLocation -DevCmdArguments '-arch=x64'

# NOTE: `-DevCmdArguments` are arguments to `vsdevcmd.bat`

# Select compiler
if ($Compiler -eq "MSVC") {
    $_Compiler = "MSVC"
    Set-Item -Path "env:CC" -Value "cl.exe"
    Set-Item -Path "env:CXX" -Value "cl.exe"
}
elseif ($Compiler -eq "Clang") {
    $_Compiler = "Clang"
    Set-Item -Path "env:CC" -Value "clang-cl.exe"
    Set-Item -Path "env:CXX" -Value "clang-cl.exe"
}

Write-Host "Selecting $_Compiler as C/C++ compiler."

# Prompt 
Import-Module Terminal-Icons

# August,3, 2022 New way to install oh-my-posh - https://ohmyposh.dev/docs/migrating
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
Import-Module posh-git
#Import-Module oh-my-posh
Set-PoshPrompt Paradox

# Alias
Set-Alias vim nvim

clear

# References

# VSDevShell.ps1 - https://gist.github.com/ArthurHNL/b29f008cbc7a159a6ae82a7152b1cb2a
# How to set up PowerShell prompt with Oh My Posh on Windows 11
# 	Japan Dev Guys - https://www.youtube.com/watch?v=5-aK2_WwrmM&t=23s

# 0 - Install PowerShell navy blue
# 1 - Install Hack font and setup on PowerShell - https://youtu.be/5-aK2_WwrmM?t=171
# 2 - Default Terminal - https://youtu.be/5-aK2_WwrmM?t=268
# 3 - Install Scoop - iwr -useb get.scoop.sh | iex - https://youtu.be/5-aK2_WwrmM?t=374
# 4 - Install Git - winget install -e --id Git.Git
# 5 - Install neovim gcc - scoop install neovim gcc - https://youtu.be/5-aK2_WwrmM?t=506
# 6 - Setup User profile - https://youtu.be/5-aK2_WwrmM?t=607
#      - How to create PowerShell profile https://www.improvescripting.com/how-to-create-powershell-profile-step-by-step-with-examples/
# 7 - Install-Module posh-git -Scope CurrentUser -Force 
# 8 - Install-Module oh-my-posh -Scope CurrentUser -Force

# How to use powershell
# $env:VCPKG_ROOT

# I dont not use PowerShell .. navy blue
# I had to manually create the file on $PROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1