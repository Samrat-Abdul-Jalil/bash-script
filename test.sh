#!/bin/bash

for folder in *
do
    if [ -d $folder ]
    then 
       c=0
       for file in ./$folder/*
       do
      
       h=$file
       IFS='/.'
       g=( $h )
       IFS='_'
       k=( ${g[3]} )
       
       
       ((c++))
       if(( ${k[1]#0} >=1 && ${k[1]#0} <=12 ))
       then
         if(( ${k[2]#0} >=1 && ${k[2]#0} <=31 ))
         then
          if(( ( ${k[2]#0} == 29 || ${k[2]#0} ==30 || ${k[2]#0} ==31)&& ${k[2]#0} ==2 ))
          then
               echo "not valid gorib $file "  
           else 
            if(( ${k[2]#0} == 31 && ( ${k[1]#0} ==2 || ${k[1]#0} ==4|| ${k[1]#0} ==6 || ${k[1]#0} ==9 || ${k[1]#0} ==11 )))
            then
                 echo "not valid gorib $file "
             else 
               echo "all good"
             fi
          fi
         else 
            echo "not valid date $file "    
         fi 
       else 
        echo "not valid $file " 
       fi
       done
    fi
done       
