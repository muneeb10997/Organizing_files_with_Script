#!/bin/bash 

Input_Folder_Path="$1"

#check that the input path is a valid directory or not 
if [ -z "$Input_Folder_Path" ]  
then 
    echo "The directory path is not provided."
    exit 1

elif [ ! -d "$Input_Folder_Path" ]
then
    echo "The input path $Input_Folder_Path is not a valid directory."
    exit 1 
else 
     echo Path provided is a valid directory

fi

mkdir -p "$Input_Folder_Path/Documents" "$Input_Folder_Path/c++" "$Input_Folder_Path/css" "$Input_Folder_Path/python" 

for file in "$1"/*
do 
  if [ -f "$file" ] 
  then
      extension="${file##*.}"
   
      if [ "$extension" == "py" ]
      then
          mv "$file" "$1/python/"

      elif [ "$extension" == "txt" ]
      then
          mv "$file" "$1/Documents/"

      elif [ "$extension" == "css" ]
      then
          mv "$file" "$1/css/"

      elif [ "$extension" == "cpp" ]
      then
          mv "$file" "$1/cpp/"
      fi
  fi
done

