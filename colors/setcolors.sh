#!/bin/bash

if [ $0 != "bash" && $0 != "-bash"]; then
    echo "This command should be 'sourced' in your bash shell"
    echo $0
else
./colortest -w

echo -ne "What color would you like ? "

read color

echo "You chose $color"

./colortest | grep "\<$color\>" | perl -ne '$_ =~ m/([\d]+)\s*:\s*(.)(.)\/(.)(.)\/(.)(.)/; print "#!/bin/sh\n\nexport PROMPT_COLOR_NUM=\"$1\"\nexport PROMPT_COLOR=\"38;5;$1\"\nexport CURSOR_COLOR=\"rgb:$2$2$3$3/$4$4$5$5/$6$6$7$7\"\n"' > ~/.bash_prompt_colors

    if [ -f "$RC_FILE" ]; then
        source $RC_FILE
    fi

fi
