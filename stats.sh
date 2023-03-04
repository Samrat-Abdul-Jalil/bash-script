#!/bin/bash

cousrse_Id=1000
echo "Course Id,Max,Min,Average">stats.csv
for file in ./marks/*
do 
    if [ -f $file ]
      then
        
        max=0
        min=100
        total=0
        ((len=-1))
        flag=1
        while IFS=, read -r Id marks
        do
        ((len++))
        if ((len==0))
           then 
            continue
        fi
        ((total+=marks))
        
        if ((marks > max))
           then
             (( max=marks))
        fi
        if ((marks < min))
           then
             (( min=marks))
        fi
  
        done < $file
        avg=$(echo "scale=5;1.0*$total/$len" | bc -l)
        
         ((cousrse_Id++))
         Courses=CSE$cousrse_Id
        echo "$Courses,${max},${min},${avg}">>stats.csv
    fi

done
echo "Done"
