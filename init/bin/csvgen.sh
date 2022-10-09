#!/bin/bash

n=1
if [ $# -ne 1 ];then
    echo "Usage $0 <count>"
    exit 1
fi
max=$1

file=data1.csv
truncate $file --size=0

echo "Timestamp,Open,High,Low,Close,Volume_(BTC),Volume_(Currency),Weighted_Price" >> $file
while [ $n -le $max ] ;do
    echo "$n,A$n,B$n,C$n,D$n,E$n,F$n,G$n" >> $file
    let n++
done
