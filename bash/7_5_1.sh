#!/bin/bash

month=`date +%m`
year=`date +%Y`
echo "current month is $month"
if (( $month <= 7 )) && (( $month % 2 != 0 )) || (( $month >= 8 )) && (( $month % 2 == 0 )); then
  echo "this month has 31 days"
elif (( $month != 2 )); then
  echo "this month has 30 days"
else
  if (( $year % 400 == 0 )) || (( $year % 4 == 0 )) && (( $year % 100 != 0 )); then
    echo "leap year, hence Feb has 29 days"
  else
    echo this month has 28 days
  fi
fi
