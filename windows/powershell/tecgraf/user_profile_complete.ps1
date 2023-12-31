# Path

Function Add-PathVariable {
    param (
        [string]$addPath
    )
    if (Test-Path $addPath){
        $regexAddPath = [regex]::Escape($addPath)
        $arrPath = $env:Path -split ';' | Where-Object {$_ -notMatch 
"^$regexAddPath\\?"}
        $env:Path = ($arrPath + $addPath) -join ';'
    } else {
        Throw "'$addPath' is not a valid path."
    }
}

#Alias

# terminal 

# venv
Set-Alias active-conan-2.0 D:\sdk\tools\venv-python-3.10-conan-2.0\Scripts\Activate.ps1
Set-Alias active-conan-1.0 D:\sdk\tools\venv-python-3.10\Scripts\Activate.ps1

function emccActivate {C:\Users\felipe\frontier\sdk\emsdk\emsdk activate 3.1.37}

Set-Alias active-emcc emccActivate

# git
function gn{git init}
# @args you can pass multi arguments for example
# ga fileName1 fileName2 
function add{git add @args}
function commit { git commit -m @args }
function pull{git pull origin master}
function gl{git log}
function glo{git log --oneline}
function gch{git checkout @args}

# @args is optional to add argument
function gb{git branch @args}
function gs{git status}
function gd{git diff}

# Alias
Set-Alias vim nvim



# Developement
# usage:
# $ pwsh-dev-x64.ps1 [MSVC|Clang|GCC|emcc|None]

# Where did I learng how to config it - https://www.youtube.com/watch?v=5-aK2_WwrmM&t=23s

[String]$Compiler = "gcc"

if ($Compiler -ne "MSVC" -and $Compiler -ne "Clang" -and $Compiler -ne "gcc" -and $Compiler -ne "emcc" -and $Compiler -ne "None") {
    Write-Error "Unknown compiler '$Compiler'; must be MSVC, Clang or GNU Compiler"
    Exit -1
}

Write-Host "Setting up environment variables..."

# Select compiler, aka , the eviroment variable CC and CXX 
# Select compiler, aka , the eviroment variable CC and CXX 
if ($Compiler -eq "emcc") {
    # Activate it first
    # Ex: C:\Users\felipe\frontier\sdk\emsdk\emsdk activate 3.1.37
    $_Compiler = "Emscripten gcc/clang-like replacement + linker emulating GNU ld"
    Set-Item -Path "env:CC" -Value "emcc"
    Set-Item -Path "env:CXX" -Value "em++"
	Write-Host "Selecting $_Compiler as C/C++ compiler."
}
elseif ($Compiler -eq "gcc") {
    $_Compiler = "GNU C Compiler"
	Add-PathVariable("C:\Users\felipemc\.conan\data\env-mingw\12.2\environ\test\package\ca33edce272a279b24f87dc0d4cf5bbdcffbc187\bin")
    Set-Item -Path "env:CC" -Value "gcc.exe"
    Set-Item -Path "env:CXX" -Value "g++.exe"
	Write-Host "Selecting $_Compiler as C/C++ compiler."
}
elseif ($Compiler -eq "MSVC") {
    $_Compiler = "MSVC"
	
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
	
	
    Set-Item -Path "env:CC" -Value "cl.exe"
    Set-Item -Path "env:CXX" -Value "cl.exe"
	
	Write-Host "Selecting $_Compiler as C/C++ compiler."
}
elseif ($Compiler -eq "Clang") {
    $_Compiler = "Clang"
    Set-Item -Path "env:CC" -Value "clang-cl.exe"
    Set-Item -Path "env:CXX" -Value "clang-cl.exe"
	
	Write-Host "Selecting $_Compiler as C/C++ compiler."
}else
{
	Write-Host "No Compiler Selected ."
}

# Prompt 
Import-Module Terminal-Icons

# August,3, 2022 New way to install oh-my-posh - https://ohmyposh.dev/docs/migrating
# Octobe, 19, 2022 - new way to install https://ohmyposh.dev/docs/installation/windows
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
Import-Module posh-git
# Load prompt config
# @se https://youtu.be/5-aK2_WwrmM?si=6pWFGpsF7x3V1DtV&t=1680
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'felipe.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression




# References

# VSDevShell.ps1 - https://gist.github.com/ArthurHNL/b29f008cbc7a159a6ae82a7152b1cb2a
# How to set up PowerShell prompt with Oh My Posh on Windows 11
# 	Japan Dev Guys - https://www.youtube.com/watch?v=5-aK2_WwrmM&t=23s

# 1 - Install Hack font and setup on PowerShell - https://youtu.be/5-aK2_WwrmM?t=171
# 2 - Default Terminal - https://youtu.be/5-aK2_WwrmM?t=268
# 3 - Install Scoop - iwr -useb get.scoop.sh | iex - https://youtu.be/5-aK2_WwrmM?t=374
# 4 - Install Git - winget install -e --id Git.Git
# 5 - Install neovim gcc - scoop install neovim gcc - https://youtu.be/5-aK2_WwrmM?t=506
# 6 - Install Terminal icons - Install-Module -Name Terminal-Icons -Repository PSGallery -Force https://youtu.be/5-aK2_WwrmM?t=1832            
# 6 - Setup User profile - https://youtu.be/5-aK2_WwrmM?t=607
#      - How to create PowerShell profile https://www.improvescripting.com/how-to-create-powershell-profile-step-by-step-with-examples/
#      - Do not forget: " . env$", there is a space dot on the beginning of the script
#      -  Test-Path $PROFILE
#      -  New-Item -Type File -Force $PROFILE

# How to use powershell
# $env:VCPKG_ROOT

# I dont not use PowerShell .. navy blue
# I had to manually create the file on $PROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
