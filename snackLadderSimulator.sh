#!/bin/bash -x
echo "Welcome to the snack and ladder simulator"
playerFirstPosition=0
playerSecondPosition=0
countDicePlayed=0
numberOfPlayer=2
function play() {
while [[ $playerFirstPosition -ne 100 && $playerSecondPosition -ne 100 ]] 
do
 if [[ $numberOfPlayer -eq 2 ]]
 then
	diceNumber=$(( RANDOM%6+1 ))
	 echo "First player position:" $playerFirstPosition 
	(( countDicePlayed++ ))
	choice=$(( RANDOM%3+1 ))
 	case $choice in
    1)
	   #no play
	   playerFirstPosition=$playerFirstPosition ;;
    2)
	   #ladder
	   playerFirstPosition=$(( $playerFirstPosition+$diceNumber )) ;;
    3)
 	   #snack
	   playerFirstPosition=$(( $playerFirstPosition-$diceNumber )) ;;
  esac
  if [[ $playerFirstPosition -gt 100 ]]
  then 
      playerFirstPosition=$(( $playerFirstPosition-$diceNumber ))
  fi
  
  if [[ $playerFirstPosition -eq 100 ]]
  then 
      echo "Player first is the winner"
		break
  fi
  
  if [[ $playerFirstPosition -lt 0 ]]
  then 
      playerFirst=0
  fi
  (( numberOfPlayer-- ))

elif [[ $numberOfPlayer -eq 1 ]]
then
   diceNumber=$(( RANDOM%6+1 ))
	echo "Second player position :" $playerSecondPosition 
   (( countDicePlayed++ ))
   choice=$(( RANDOM%3+1 ))
   case $choice in
    1)
      #no play
      playerSecondPosition=$playerSecondPosition ;;
    2)
      #ladder
		playerSecondPosition=$(( $playerSecondPosition+$diceNumber )) ;;
    3)
      #snack
      playerSecondPosition=$(( $playerSecondPosition-$diceNumber )) ;;
  esac
  if [[ $playerSecondPosition -gt 100 ]]
  then 
      playerSecondPosition=$(( $playerSecondPosition-$diceNumber ))
  fi
  if [[ $playerSecondPosition -eq 100 ]]
  then 
      echo "Player second is the winner"
      break
  fi
  
  if [[ $playerSecondPosition -lt 0 ]]
  then 
      playerSecondPosition=0
  fi
  numberOfPlayer=2
fi
done
}
play
echo "Number of time dice was played to win the game:" $countDicePlayed
 
