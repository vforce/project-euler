#!/bin/bash

#month=`date +%m`
month=2
year=`date +%Y`

case $month in 
  1|3|5|7|8|10|12) echo this month has 31 days;;
  4|6|9|11) echo this month has 30 days;;
  *) 
    if (( $year % 400 == 0 )) || (( $year % 4 == 0 )) && (( $year % 100 != 0 )); then
      echo this month has 29 days
    else
      echo this month has 28 days
    fi
    ;;
esac
