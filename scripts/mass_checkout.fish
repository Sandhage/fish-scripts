function mass_checkout --description "Recursively move over all git projects within current working directory and checkout each to designated branch."
    set CUR_DIR (pwd)

    for i in (find . -name ".git" | cut -c 3-)
        # We have to go to the .git parent directory to call the pull command
        cd "$i";
    	cd ..;

    	printf '%s%s%s%s%s...\n' "Moving [" (command git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//') "] to greener pastures in '" $argv "'"

    	# Checkout to desired branch
    	command git checkout $argv

    	# Lets get back to the CUR_DIR
    	cd $CUR_DIR
	echo ""
    end

    echo "... Diadromous fish travel between salt water and fresh water as part of their lifecycles; so, too, do we." 
    echo "~ FIN. ~"
end
