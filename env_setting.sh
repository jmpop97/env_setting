function gitignore_setting(){
    function empty_check(){
        if [ -s ".gitignore" ]; then
            echo "1"
            return
        else
            echo "0"
            return
        fi
    }
    function combine_check(){
        while IFS= read -r line; do
            if [[ "$line" == ".env"* ]]; then
                echo "1"
                return
            fi
        done < .gitignore
        if [[ "$line" == ".env"* ]]; then
            echo "1"
            return
        fi
        echo "0"
        return
    }


    bool_add=$(empty_check)
    if [ ${bool_add} -eq "1" ]; then
        bool_add=$(combine_check)
    fi
    echo "$bool_add"


    if ! [ ${bool_add} -eq "1" ]; then
        echo ".env" >> .gitignore
    fi


}
gitignore_setting