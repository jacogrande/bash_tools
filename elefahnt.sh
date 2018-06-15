INPUT=$1;
ADDED="";
printf "" > $HOME/elefahnt.txt;
grep -o . <<< $INPUT | while read c
do
	echo "+" >> $HOME/elefahnt.txt;
done

COUNT=$(uniq -c $HOME/elefahnt.txt);
COUNT=$(echo $COUNT | tr -d " " )
LENGTH="${#COUNT}"
LENGTH=$((LENGTH-1))
COUNT="${COUNT:0:LENGTH}"
COUNT=$((COUNT / 2))
for i in $(seq 1 $COUNT)
do
	ADDED="$ADDED ";
done

if [ "${#ADDED}" -gt "30" ]; then
	ADDED="${ADDED:0:45}"
fi

TEXT_TOP=" /~~~\ "
TEXT_MID="|  ?  |"
TEXT_BOT=" \~~~/"

INPUT_LENGTH="${#INPUT}";
EXTRACTION=$(((INPUT_LENGTH - 71) - 1));
if [ $((EXTRACTION % 2)) == "0" ]; then
	EXTRACTION=$((INPUT_LENGTH - 71));
fi
TEXT_MID2="${INPUT:71:EXTRACTION}";

SIDE_LENGTH=$(((71-EXTRACTION)/2));
ADDED2="";

HUGE=false;

if [ "${#INPUT}" -gt "71" ];then
	HUGE=true;
fi

if [ "${#INPUT}" -gt "0" ]; then

	for i in $(seq 0 1 $INPUT_LENGTH)
	do
		if [ "$i" == "0" ]; then
			TEXT_TOP=" /~~"
			TEXT_MID="|   "
			TEXT_BOT=" \~~"

		elif [ "$i" == "71" ]; then
			TEXT_MID="$TEXT_MID   |\n*   ";
			for i in $(seq 1 1 $SIDE_LENGTH)
			do
				TEXT_MID="$TEXT_MID ";
			done
		elif [ "$i" -gt "71" ]; then
			TEXT_MID="$TEXT_MID${TEXT_MID2:$((i-72)):1}"

		else
			TEXT_TOP="$TEXT_TOP~"
			TEXT_MID="$TEXT_MID${INPUT:$((i-1)):1}"
			TEXT_BOT="$TEXT_BOT~"
		fi

		if [ "$i" == "${#INPUT}" ]; then
			TEXT_TOP="$TEXT_TOP~~\ "
			if [ $HUGE == true ]; then
				for i in $(seq 1 1 $SIDE_LENGTH)
				do
					TEXT_MID="$TEXT_MID ";
				done
				TEXT_MID="$TEXT_MID  *";
			else
				TEXT_MID="$TEXT_MID   | ";
			fi
			TEXT_BOT="$TEXT_BOT~~/ ";
		fi
	done

fi
echo "";
echo "$TEXT_TOP";
printf "$TEXT_MID \n"
echo "$TEXT_BOT";

ELEFAHNT="n   \        ___     ___ n    \      /   \~~~/   \ n     \    (\033[7;36m     \033[1;36moo \033[7;36m     \033[0m)-----, n      \     \___      __/      \ n              ]|   /[   el    |\ n               |::/\  /____\   / ^ n                -  |__|    |__|"

printf "${ELEFAHNT//n/\n$ADDED}"
echo "";
say -v Daniel $INPUT
echo "";

