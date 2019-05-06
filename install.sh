project_directory()
{
   if [[ "$OSTYTPE" == "darwin"* ]]
   then
      TARGET_FILE=$0
      cd `dirname $TARGET_FILE`
      TARGET_FILE=`basename $TARGET_FILE`
      # Iterate down a (possible) chain of symlinks
      while [ -L "$TARGET_FILE" ]
      do
        TARGET_FILE=`readlink $TARGET_FILE`
        cd `dirname $TARGET_FILE`
        TARGET_FILE=`basename $TARGET_FILE`
      done
      PROJECT_DIRECTORY= echo `pwd -P` | echo $(sed -E 's/\/scripts//g') | sed -E 's/\/.git\/hooks//g'
   else
      SCRIPT=$(readlink -f "$0")
      PROJECT_DIRECTORY= echo $(dirname "$SCRIPT") | echo $(sed -E 's/\/scripts//g') | sed -E 's/\/.git\/hooks//g'
   fi
   echo $PROJECT_DIRECTORY
}
PROJECT_DIRECTORY="$(project_directory)"
install()
{
   if [[ "$OSTYPE" == "darwin"* ]]
   then
      cp -RL $PROJECT_DIRECTORY"/hooks" $PROJECT_DIRECTORY"/.git"
   elif [[ "$OSTYPE" == "msys" ]]
   then
      cp -rl $PROJECT_DIRECTORY"/hooks" $PROJECT_DIRECTORY"/.git"
   else
      cp -rl $PROJECT_DIRECTORY"/hooks" $PROJECT_DIRECTORY"/.git"
   fi
   if [ ! -f ".ssh/id_rsa" ]
   then
      read -p "Github email address: " EMAIL
      ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f ".ssh/id_rsa"
}
install
# Pause at end
read -p "Press enter to continue"
exit
