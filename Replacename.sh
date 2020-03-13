# !/bin/bash
# User Input and Replace String Template “Hello <<UserName>>, How are you?”
# Author: Naresh
# Date: 13/03/2020
message="Hello <<UserName>>, How are you?"
echo "Enter the name "
read name
while [ ${#name} -lt 3 ]
do
echo "name should be 3 minimum charcter."
echo "Enter Again."
read name
done
message=${message/<<UserName>>/$name}
echo $message
