PROMPT=$'\n%B%{$fg[blue]%}<[%b%{$fg[yellow]%}%D{%a %b %d, %I:%M:%S}%B%{$fg[blue]%}]%b
%B%{$fg[blue]%} [%{$fg[green]%}%n%b%{$fg[white]%}@%B%{$fg[cyan]%}%m%{$fg[blue]%}]%b%{$reset_color%} - %B%{$fg[blue]%}[%b%{$reset_color%}%~%B%{$fg[blue]%}]%b
%B%{$fg[blue]%}<[%{$fg[red]%}%#%{$fg[blue]%}]%B%{$fg[blue]%}$(git_prompt_info)%B%{$fg[blue]%}>%b %{$reset_color%}'
PS2=$' %B%{$fg[blue]%}->%b%{$reset_color%}  '
