# command
alias ll="ls -al"

# directory
alias localhost="cd ~/Sites"

# laravel
alias art="php artisan"
alias tinker="php artisan tinker"

# Jekyll

alias jks="bundle exec jekyll serve --drafts --port 3000"

# cd iCloud
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# cd blog
alias blog="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/paikwiki.github.io/"

# cd ~/Documents/Writing/making-website-with-gh-pages/
alias book="cd ~/Documents/Writing/making-website-with-gh-pages/"

# cp -rf ~/Documents/Writing/making-website-with-gh-pages/_book/* ~/Site/tmp/
alias bookpub="rm -rf ~/Sites/book/*; cp -rf ~/Documents/Writing/making-website-with-gh-pages/_book/* ~/Sites/book/;mac ip:local"

# create ebook
alias epub="gitbook epub ~/Documents/Writing/making-website-with-gh-pages/ ~/Documents/Writing/book-$(date '+%Y%m%d%H%M').epub"
alias pdf="gitbook pdf ~/Documents/Writing/making-website-with-gh-pages/ ~/Documents/Writing/book-$(date '+%Y%m%d%H%M').pdf"

# make directory with date and time
alias mkdate="mkdir $(date '+%Y%m%d-%H%M%S')"

# add LICENSE file
alias addlicense="license $1 > LICENSE"

# mkdir and cd
mkcdir () {
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}
alias mcd=mkcdir
