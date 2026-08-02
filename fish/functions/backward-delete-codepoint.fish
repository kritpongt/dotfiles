function backward-delete-codepoint --description 'Delete one codepoint instead of the whole cluster'
	set -l cursor (commandline -C)
	test $cursor -eq 0; and return
	set -l buf (commandline)
	set -l left (string sub -l (math $cursor - 1) -- $buf)
	set -l right (string sub -s (math $cursor + 1) -- $buf)
	commandline -r -- "$left$right"
	commandline -C (math $cursor - 1)
end