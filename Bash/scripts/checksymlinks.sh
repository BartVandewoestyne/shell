function checksymlinks(){
    OLDIFS=$IFS
    IFS=$'\n'
    find . -type l -print | while read TARGET; do
        BASE=`echo ${TARGET%/*}`
        SRC=$(readlink "$TARGET")
        SRC="$BASE/$SRC"        
        if [ ! -e "$SRC" ]; then
            echo -e "\033[31m BAD  LINK: $SRC\n        -> $TARGET"
        else
            echo -e "\033[32m GOOD LINK: $SRC"
        fi
    done
    IFS=$OLDIFS
}
