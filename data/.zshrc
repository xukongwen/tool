# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

#ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#用fzf打开文件
fe() {
	IFS=$'\n' files=($(find ~ -not -path '*/\.*' -a \( -type d -o -type f \) | fzf --query="$1" --multi --select-1 --exit-0))
	[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# run emacs as clint
alias e='emacsclient --create-frame --alternate-editor="" >/dev/null 2>&1'
alias note='e ~/k/write/notes/note.org'

# 一些自定义快捷命令
alias n='grep' 
alias t='tree -d'
alias tt='tree'
alias ll='ls -lah'
alias xx='clear'
alias ..='cd ..'
# 升级
# 打开bashrc
alias zz='vim ~/.zshrc'
# writeing
alias s='vim ~/k/write/book/all-notes.md'
alias todo='vim ~/k/write/notes/todo.md'
alias wday='vim ~/k/write/notes/work-log.md'
alias day='vim ~/k/write/notes/day.md'
alias tunnel='e ~/k/write/novel/greentunnel.org'
alias la='ls -A'
alias l='ls -CF'
alias v='vim'
#alias re='sudo reboot'
alias reborn='source ~/.zshrc'
alias xc='xmonad --recompile'
alias xr='xmonad --restart'
# git
alias add='git add .'
alias commit='git commit -m "hi"'
alias push='git push'
alias pull='git pull'
alias gitemail='git config --global user.email "oabdao@gmail.com"'
alias gitname='git config --global user.name "xukongwen"'
# fzf 多选
alias f='fzf -m --bind ctrl-a:select-all,ctrl-d:deselect-all'
# 一些自写功能
re() {
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast ~/video/capture/"$1".mkv
}

ml() {
   n -rc $1 * | sort -r -n -t ':' -k 2
}

n1(){
	sed -i "1i$1" ~/kongwen/write/book/all-notes.md
}

n2(){
	sed -i "1i$1" ~/kongwen/write/notes/note.md
}


cha(){
	cat $1 |f
}

an(){
	sudo pacman -S $1
}

ziti(){
	sudo cp $1 /usr/share/fonts/truetype
	sudo fc-cache -v -f
}

update(){
	sudo pacman -Syy
	sudo pacman -Syu
}
gitall(){
	git add .
	git commit -m "hi"
	git push
}

count-word() {
	file=$1; shift
	for word in $@; do				     echo "${word} $(grep -c $word $file)"
							 done
	    }


source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# 默认editor
#export VISUAL=vim
#export EDITOR="$VISUAL"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# auto jump
[[ -s /home/k/.autojump/etc/profile.d/autojump.sh ]] && source /home/k/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# juypter-lab
export PATH="/home/k/.local/bin:/home/k/bin:$PATH"
#export PATH="$PATH:/home/k/bin"
# qutebroswer
export QT_XCB_GL_INTEGRATION=none

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
