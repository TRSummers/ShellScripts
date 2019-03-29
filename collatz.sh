#!/bin/bash
	rm ./collatz.log

	clear
	echo "=========================================="
	echo "=========================================="
	read -p "Enter a whole number: " NUMBER
	read -p "Do you want all the underyling calculations (y or n)? " yorn

	let x=NUMBER

	if [ $yorn = "y" ];then
		read -p "Calculating all integers (below and inclusive of) $NUMBER"
		let orig=$NUMBER
	else
		#read -p "norn = $yorn "
		let orig=2
	fi

	function odd(){
		let prev=NUMBER
		let NUMBER=(NUMBER*3)+1
		let aore=1 
	}
	
	function even(){
		let prev=NUMBER
		let NUMBER=NUMBER/2
		let aore=0 
	}

	function log(){

		if [[ $aore -eq 1 ]]; then	
			echo "Original Number: $x : Calculated Number (3x$prev+1)=$NUMBER Steps: $steps " >>collatz.log 
		else
			echo "Original Number: $x : Calculated Number ($prev/2)=$NUMBER Steps: $steps " >>collatz.log 
		fi
	}


	while [[ $orig>1 ]];
	do

		while [[ $NUMBER>1 ]];
		do
			odd_or_even=$((NUMBER%2))
		
			let steps+=1

			if [[ $odd_or_even>0 ]]; then
				odd
				log
			else 
				even
				log
			fi
			if [[ $NUMBER -eq 1 ]]; then
				echo "=================================================" >>collatz.log
				echo "=================================================" >>collatz.log
			fi
		done

		let total=$steps
		echo "Number: $x took $total to reach 1"
		let NUMBER=$orig-1
		let x-=1
		let orig-=1
		let steps=0
	done
