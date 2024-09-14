#!/bin/bash 

Input_Folder_Path="$1"

# Check if the input path is provided and valid
if [ -z "$Input_Folder_Path" ]; then
    echo "The directory path is not provided."
    exit 1
elif [ ! -d "$Input_Folder_Path" ]; then
    echo "The input path $Input_Folder_Path is not a valid directory."
    exit 1 
else 
    echo "Path provided is a valid directory."
fi

# Create directories for different file types
mkdir -p "$Input_Folder_Path/Documents" "$Input_Folder_Path/cpp" "$Input_Folder_Path/css" "$Input_Folder_Path/python"

# Iterate over files in the input directory
for file in "$Input_Folder_Path"/*
do 
    if [ -f "$file" ]; then
        extension="${file##*.}"
        case "$extension" in 
            py)
                mv "$file" "$Input_Folder_Path/python/"
                ;;
            txt)
                mv "$file" "$Input_Folder_Path/Documents/"
                ;;
            css)
                mv "$file" "$Input_Folder_Path/css/"
                ;;
            cpp)
                mv "$file" "$Input_Folder_Path/cpp/"
                ;;
        esac
    fi
done

echo "File organization completed!"
