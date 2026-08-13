zoxide init fish | source

function fish_greeting
	if set -q KONSOLE_VERSION
		fastfetch
	end
end

fnm env --use-on-cd | source

## append common directories for executable files to $PATH
fish_add_path ~/.local/bin ~/.cargo/bin ~/Applications/depot_tools

## functions
function __history_previous_command
	switch (commandline -t)
		case "!"
    commandline -t $history[1]; commandline -f repaint
		case "*"
			commandline -i !
	end
end

function __history_previous_command_arguments
	switch (commandline -t)
		case "!"
			commandline -t ""
			commandline -f history-token-search-backward
		case "*"
			commandline -i '$'
	end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
	bind -Minsert ! __history_previous_command
	bind -Minsert '$' __history_previous_command_arguments
	bind -Minsert \cl forward-word
	bind -Minsert ctrl-L clear-screen
else
	bind ! __history_previous_command
	bind '$' __history_previous_command_arguments
	bind \cl forward-word
	bind ctrl-L clear-screen
end

function history
	builtin history --show-time='%F %T ' $argv
end

function backup --argument filename
	cp $filename $filename.bak
end

function copy
	set count (count $argv | tr -d \n)
	if test "$count" = 2; and test -d "$argv[1]"
		set from (echo $argv[1] | trim-right /)
		set to (echo $argv[2])
		command cp -r $from $to
	else
		command cp $argv
	end
end

## aliases
alias la='eza -a --color=always --group-directories-first --icons=always'
alias ll='eza -l --color=always --group-directories-first --icons=always'
alias ls='eza -al --color=always --group-directories-first --icons=always'
alias lt='eza -aT --color=always --group-directories-first --icons=always'

## sort installed pkgs according to size in MB
alias bigpkg="expac -H M '%m\t%n' | sort -h | nl"
## list amount of -git packages
alias gitpkg='pacman -Q | grep -i "\-git" | sort | nl'
## recent installed pkgs
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

## get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"