#!/bin/sh

critical_temp=79
critical_color=#e60053
temp=$(sensors | grep CPU: | tr -d '(),CPU:' | tr -d '(), ' | tr -d '(),+' | echo $(sed s/...$//))

if [ $temp -gt $critical_temp ]
then
	printf " %%{T5}%%{F$critical_color} %%{T-}%s° " $temp
else
	printf " %%{T5} %%{T-}%s° " $temp
fi
