#!/bin/sh
create_key()
{
   ssh-keygen -f "./.ssh/id_rsa"
}
key_check()
{
   if [ -f "./.ssh/id_rsa" ]
   then
      echo "Key already exists"
   else
      echo "No Key found"
      create_key
   fi
}
run()
{
   echo "Input IP: "
   read IP
   echo "Input Port: "
   read PORT
   RESULT=$(ssh -p $PORT $IP -L 80:localhost:80)
   echo $RESULT
}
key_check
ssh-add ./.ssh/id_rsa
run
read -p "Press enter to continue"
exit
