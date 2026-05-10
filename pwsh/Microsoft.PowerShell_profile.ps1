# -- environment variables
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"

# -- vi mode
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Cursor

# -- beep sound
Set-PSReadLineOption -BellStyle None

# -- key binding
Set-PSReadLineKeyHandler -ViMode Insert -Chord 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -ViMode Insert -Chord 'Ctrl+n' -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord 'Ctrl+l' -Function ForwardWord

# -- modules
Import-Module posh-git
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'

# -- initial
Invoke-Expression (& { (zoxide init powershell | Out-String) })