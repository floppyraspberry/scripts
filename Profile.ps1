## Uncomment return to exit the script if needed
# return

## TODO: fix $defaultLocation, fix if/else logic

# Style default PowerShell Console
$shell = $Host.UI.RawUI
$shell.WindowTitle= "PS"
$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "White"

# Set variables
$dateTime = Get-Date
[Environment]::SetEnvironmentVariable('$date', $dateTime.Date)
[Environment]::SetEnvironmentVariable('$hour', $time.Hour)
$defaultLocation = [Environment]::GetEnvironmentVariable('defaultLocation')

# Load custom theme for Windows Terminal

# Import-Module posh-git
# Import-Module oh-my-posh
# oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh | Invoke-Expression
# oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"
## Source: https://www.youtube.com/watch?v=lu__oGZVT98 

# Set Default location
# Set-Location $defaultLocation
Write-Host($defaultLocation)


## Not sure what was intended here:

# Lazy way to use scripts as module:
# Set-Alias ConnectTo-SharePointAdmin ConnectTo-SharePointAdmin.ps1
# Set-Alias ConnectTo-EXO ConnectTo-EXO.ps1
# Set-Alias Get-MFAStatus MFAStatus.ps1
# Set-Alias Get-MailboxSizeReport MailboxSizeReport.ps1
# Set-Alias Get-OneDriveSizeReport OneDriveSizeReport.ps1

# Print to screen at startup
if (($hour -gt "6") -and ($time -lt "12"))
{ Write-Host("Good morning $env:UserName `n") }

if (($time -gt "12") -and ($time -lt "18"))
{ Write-Host("Good morning $env:UserName `n") }

if (($time -gt "18") -and ($time -lt "23"))
{ Write-Host("Good morning $env:UserName `n") }

if (($time -gt "23") -and ($time -lt "06"))
{ Write-Host("Good night $env:UserName `n") }

if (($time -gt "8") -and ($time -lt "10"))
{
    gsudo winget upgrade --all
    # update choco packages 
    
    Write-Host "Updating some systems...."
    gsudo choco upgrade all -y

    # $diff = Compare-Object (-ReferenceObject [Environment]::GetEnvironmentVariable('time') -DifferenceObject $time )
    # $oldTime = [Environment]::GetEnvironmentVariable('time')
    # $((Get-Date).AddMinutes($oldTime))
    # if ($diff -gt 16)
    {
        # Write-Host 
        # Write-Host $oldTime
        # Write-Host "Updating some systems...."
        # gsudo choco upgrade all -y
    }
    # if ($diff -lt 24)
    # {
    #     Write-Host
    #     Write-Host "Nothing updated...."
    #     Write-Host $oldTime
    # }
}

# notes and reminders
Write-Host ''
$t = $host.ui.RawUI.ForegroundColor
$host.ui.RawUI.ForegroundColor = "DarkGreen"
Write-Host ''

Write-Host 'Please remember: '

Write-Host 'Environment variables:' 'refreshenv', 'dir env:'
Write-Host ''
Write-Host 'Set default location from environment vars:'
Write-Host "Default location is: " $defaultLocation
Write-Host ''
Write-Host 'Searching: '
Write-Host 'Get-Content file -wait'
Write-Host 'Get-ChildItem -Recurse | Where {$_.Name -match 'specflow'} | Select Fullname' '==> looks for file name'
Write-Host 'Select-String -Path $defaultLocation -Pattern 'Safari' -quiet' '==> looks for file name'
Write-Host 'Get-ChildItem -Recurse | Select-String "dummy" -List | Select Path', '==> looks for string in files'
Write-Host 'Seach for string between strings: '
Write-Host 
Write-Host '$content = Get-Content -Raw -Path "C:\TEMP\test.txt" '
Write-Host '$results = $content | Select-String -Pattern "(?<=wordBefore).+?(?=wordAfter)" -AllMatches '
Write-Host 'foreach ( $result in $results )'
Write-Host '{'
Write-Host '     $result.Matches.Value | Out-File -FilePath "C:\TEMP\results.txt" # prints to file'
Write-Host '     $result.Matches.Value | Format-List # prints to console '
Write-Host '} '
Write-Host ' '
Write-Host 'Other string related stuff:'
Write-Host 'count string characters:' '$text | Measure-Object -Character'
Write-Host 'Compare diff:' 'Compare-Object -ReferenceObject (Get-Content -Path C:\Temp\Testfile1.txt) -DifferenceObject (Get-Content -Path C:\Temp\Testfile2.txt)'
Write-Host ''
Write-Host 'Create/delete stuff: '
Write-Host 'echo $null >> filename'
Write-Host ''
Write-Host 'Cleanup:' 
Write-Host 'Remove-Item C:\Temp -Verbose'  
Write-Host 'Delete folder content:', 'Get-ChildItem -Path C:\Temp | Remove-Item -Recurse -Force'
Write-Host ''
Write-Host 'Other: '
Write-Host 'Administrator terminal:' 'sudo wt'
Write-Host ''
Write-Host 'Docker'
Write-Host 'docker system prune'
Write-Host ''
Write-Host "linux"
Write-Host 'use' 'locate' " to search "
Write-Host ""
Write-Host 'Git'
Write-Host 'git remote prune origin' 'also see: https://www.git-tower.com/learn/git/faq/cleanup-remote-branches-with-git-prune'
Write-Host ''
Write-Host "CMD also see: ~\Private\Code snippets\CMD"
Write-Host ""
Write-Host 'Your Powershell version of today is: '($PsVersionTable.PSVersion )''
$IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress
Write-Host "(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress" = $IPAddress

# Estimated battery runtime
$host.ui.RawUI.ForegroundColor = $t
Write-Host ''
$MinutesRunTime = (Get-CimInstance win32_battery).EstimatedRunTime 
"The laptop will shut down at ~ $((Get-Date).AddMinutes($MinutesRunTime))"