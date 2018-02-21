# @Author: dieuson
# @Date:   2018-02-12 14:15:59
# @Last Modified by:   Dieuson Virgile
# @Last Modified time: 2018-02-12 14:25:56
while true;
	do xmacroplay "$DISPLAY" < test.file;
	time=$(( ( RANDOM % 7200 )  + 3600 ));
	echo "sleep time:" $time;
	sleep $time;
done;