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
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox

# Alias
Set-Alias vim nvim

clear

# References

# VSDevShell.ps1 - https://gist.github.com/ArthurHNL/b29f008cbc7a159a6ae82a7152b1cb2a
# How to set up PowerShell prompt with Oh My Posh on Windows 11
# 	Japan Dev Guys - https://www.youtube.com/watch?v=5-aK2_WwrmM&t=23s