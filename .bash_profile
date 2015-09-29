eval "$(rbenv init -)"

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export EDITOR=vim
export PS1="\[$(tput setaf 2)\]\u@\h\[$(tput setaf 3)\] \w\[$(tput setaf 2)\]\$(__git_ps1) $\[$(tput sgr0)\] "

if [ -f ~/.git-prompt.sh ]; then
    export GIT_PS1_SHOWDIRTYSTATE=true
    source ~/.git-prompt.sh
fi

alias ls="ls -o -G"
alias be="bundle exec"
alias ber="bundle exec rake"
alias br="source ~/.bash_profile"
alias bi="bundle install"

alias rspecs="be rspec"
alias bep="be puma"
alias fudge="be fudge build"
alias bej="fudge js"
alias djobs="be rake jobs:work"
alias pdfs="gach;be fuji_pdf_server start"
alias fudgejs="gac;./ci/prepare_host_app_for_test.sh;be fudge build js;"
alias pf="ruby parallel_fudge.rb"

alias invoicepdfs="gach;ber templates:install;ber templates:test[pretty,true]"
alias testrails="be rails s -p 4000"
alias dummy="cd /Users/toni.leigh/sage_one_uk/sage_one_advanced/advanced_uk/spec/dummy"
alias templates="cd /Users/toni.leigh/sage_one_uk/sage_one_advanced/advanced_uk;be rake sop_ui:jasmine_compile[force] RAILS_ENV=test"
alias evergreen="dummy;testrails"
alias jstest="templates;dummy;testrails"

alias testup="dummy;evergreen"
alias soptestup="cd /Users/toni.leigh/sop/sop_ui_components/spec/dummy;testrails"

alias gac="cd /Users/toni.leigh/sage_one_uk/sage_one_advanced"
alias gacuk="cd /Users/toni.leigh/sage_one_uk/sage_one_gac_uki"
alias gacus="cd /Users/toni.leigh/sage_one_uk/sage_one_gac_us"
alias gacup="gach;rails s"
alias ukup="ukh;rails s"
alias usup="ush;rails s"
alias gacbep="gach;bep"
alias ukbep="ukh;bep"
alias usbep="ush;bep"

alias pha="./ci/prepare_host_app.sh"
alias gacpha="gac;pha"
alias ukpha="uk;pha"
alias uspha="us;pha"

alias uk="cd /Users/toni.leigh/sage_one_uk/mysageone_uk"
alias us="cd /Users/toni.leigh/sage_one_uk/mysageone_us"

alias reset="git reset --soft HEAD~1;git reset;"

alias gach="cd /Users/toni.leigh/sage_one_uk/sage_one_advanced/host_app"
alias ukh="cd /Users/toni.leigh/sage_one_uk/mysageone_uk/host_app"
alias ush="cd /Users/toni.leigh/sage_one_uk/mysageone_us/host_app"

alias sop="cd /Users/toni.leigh/sop"

alias ..="cd .."
alias gpom="git push origin master"
alias gdiff="git diff > ~/diff-output.txt;open ~/diff-output.txt"
alias instr="cd /Users/toni.leigh/Configs/instructions"
alias configs="cd /Users/toni.leigh/Configs"
alias addconfig="configs; git add .;git c \"adds some more instructions\"; gpom; cd -;"
alias addbashpr="cp -rf /Users/toni.leigh/.bash_profile /Users/toni.leigh/Configs/.bash_profile; configs; git add .; git c \"updates aliases\"; gpom; cd -;"

alias vbp="vim ~/.bash_profile"
alias spad="git add .;git reset bank_feeds/spec/dummy/config/database.yml"

ntm() {
  cp ~/sublime-GACs/default-empty-project.sublime-project ~/sublime-GACs/$1.sublime-project
  cp ~/sublime-GACs/default-empty-project.sublime-workspace ~/sublime-GACs/$1.sublime-workspace
  git co master
  git pull origin master
  git cob $1
  open ~/sublime-GACs/$1.sublime-project
}

ntb() {
  cp ~/sublime-GACs/default-empty-project.sublime-project ~/sublime-GACs/$1.sublime-project
  cp ~/sublime-GACs/default-empty-project.sublime-workspace ~/sublime-GACs/$1.sublime-workspace
  git co $2
  git pull origin $2
  git cob $1
  open ~/sublime-GACs/$1.sublime-project
}

gc() {
  git commit -m "SOGACW-$1: $2"
}

gac-3513() {
  git add .
  git reset "bank_feeds/spec/dummy/config/database.yml"
  gc 3513 "$1"
}

export PATH="/usr/local/bin:$PATH"
