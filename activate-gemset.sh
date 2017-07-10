# usage: "source activate-gemset.sh" 

_GEMSET="2.2.3@gemsetname" #change the ruby version and the gemset name

if [[ ! $_OLD_PS1 ]] ; then

	rvm use $_GEMSET

	_OLD_PS1=$PS1
	PS1="\\e[4m$_GEMSET\\e[0m:\\w$ "

	deactivate () {
		rvm use default
		PS1=$_OLD_PS1
		_OLD_PS1=""
		unset -f deactivate
	}
else 
	echo -e "\\e[31mError: variable \$_OLD_PS1 already exists. You probably forgot to call 'deactivate'\\e[39m"
fi

