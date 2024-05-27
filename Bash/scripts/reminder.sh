#!/bin/sh

echo "Enter your reminder message.
When finished, enter a period (.) at
the beginning of a line and press Enter.
(Or press Ctrl-C or DEL to exit.)"

while :
do
    read MESSAGE
    if [ "$MESSAGE" = "." ]
    then
        break
    else
        echo $MESSAGE >> $HOME/Msgs/message.$$
    fi
done

cat << !!
Enter time and day you want to receive
the message, for example:

      0815am Jan 24
      8:15am Jan 24
      now + 1 day
      5 pm Friday

Then press Enter.

!!
read TIME

echo "at $TIME mail $LOGNAME $HOME/Msgs/message.$$"

at $TIME  << !!
mail $LOGNAME < $HOME/Msgs/message.$$
rm -f $HOME/Msgs/message.$$
!!
exit 0
