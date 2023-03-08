#!/bin/bash

for folder in *
do
    if [ -d $folder ]
    then 
    temper=0
    IFS='/.'
    j=( $folder  )
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
               echo "tempared file name :  $file " 
               ((temper++)) 
           else 
            if(( ${k[2]#0} == 31 && ( ${k[1]#0} ==2 || ${k[1]#0} ==4|| ${k[1]#0} ==6 || ${k[1]#0} ==9 || ${k[1]#0} ==11 )))
            then
                 echo "tempared file name :  $file"
                 ((temper++)) 
             else 
             d=0
             while IFS=$' \n' read -r -a sam
              do
             
              if ((d==0))
              then
              d=1
              if [ "${g[2]}" != "${sam[1]}" ]
               then
                 echo "tempared file name :  $file"
                 ((temper++)) 
              fi
              else 
               d=0
               if [ "${g[3]}" != "${sam[3]}" ]
               then
                 echo "tempared file name :  $file"
                 ((temper++)) 
              fi
                 
              fi
              done < "$file"
             
               
             fi
          fi
         else 
            echo "tempared file name :  $file"   
            ((temper++))  
         fi 
       else 
        echo "tempared file name :  $file" 
        ((temper++)) 
       fi
       done
       echo "number of temperd file in ${j[0]}: $temper"
    fi
done       
