# @Author: dieuson
# @Date:   2018-02-12 14:15:59
# @Last Modified by:   Dieuson Virgile
# @Last Modified time: 2018-02-26 17:29:01
#  xmacrorec2 > test2.file for recording
while true;
	do xmacroplay "$DISPLAY" < test.file;
	# time=$(( ( RANDOM % 7200 )  + 3600 ));
	time=300;
	echo "sleep time:" $time;
	sleep $time;
done;