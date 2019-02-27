function mass_branch_list --description "Recursively list all the git projects within your current working directory, as well as their working git branches."
    set CUR_DIR (pwd)

    echo ""
    printf '    %-30s \t%-15s \n' "Directory" "Working Branch"
    echo ""
    
    for i in (find . -name ".git" | cut -c 3-)
        # We have to go to the .git parent directory to call the pull command
        cd "$i";
    	cd ..;


        printf '    %-30s \t%-15s' (command git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//') (command git rev-parse --abbrev-ref HEAD)

    	# Lets get back to the CUR_DIR
    	cd $CUR_DIR
	echo ""
    end

    printf '\n  %s \n' "... Opportunities multiply as they are seized. - Sun Tzu, probably"
end
