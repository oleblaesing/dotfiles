function fish_prompt
  set -l __last_command_exit_status $status

  if not set -q -g __fish_arrow_functions_defined
    set -g __fish_arrow_functions_defined

    function _git_branch_name
      set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
      if set -q branch[1]
        echo (string replace -r '^refs/heads/' '' $branch)
      else
        echo (git rev-parse --short HEAD 2>/dev/null)
      end
    end

    function _is_git_dirty
      not command git diff-index --cached --quiet HEAD -- &>/dev/null
      or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
    end
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l cwd "[$(prompt_pwd | path basename)]"
  set cwd "$cyan$cwd"

  set -l repo_info "[$(_git_branch_name)]"

  if test $repo_info = "[]"
    set repo_info ""
  else
    if _is_git_dirty
      set repo_info "$red$repo_info$yellow!"
    else
      set repo_info "$green$repo_info"
    end
  end

  set -l return_code "[$__last_command_exit_status]"

  if test $__last_command_exit_status = 0
    set return_code "$green$return_code"
  else
    set return_code "$red$return_code"
  end

  echo -n -s $cwd $repo_info $return_code $normal ' 🐧 '
end
