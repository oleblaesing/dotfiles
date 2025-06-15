function l
  if test -f "$argv"
    less $argv
  else
    ls -al $argv
  end
end
