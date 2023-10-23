#!/bin/bash

insert_contact(){									#Function for insert contact

echo "Give contact name:"
read -r name										#Reads the input the user gives and saves it in name
echo "$name">>contacts.list.    							#Saves the name to the contacts.list.

}

search_contact(){									#Function for search contact

echo -n "Give name or surname or phone of the contact you want: "
read -r find										#Reads the input the user gives and saves it in find
grep -i "$find" "contacts.list." || { echo "No such contact exists" && exit 1; }	#Use grep to find the find parameter in the contact list
											#if it doesnt find it it returns an error message and exits
}

delete_contact(){									#Function for delete contact

echo "Give surname of the contact:"							#Input message
read -r find										#Saves the input in find
grep "$find" "contacts.list." || { echo "No such contact exists" && exit 1; }		#Use grep to find the find parameter in the contact list else it exits
echo "Do you want to delete this contact: 1:Yes 2:No :"					#Confirmation message
read -r ans										#Answer to the message
if [ "$ans" -eq 1 ]									#if statement to delete the contract or exit
then
	grep -v "$find" contacts.list. > tmpfile && mv tmpfile contacts.list.		#Use grep to find the contact to delete
	echo "Contact Deleted"
else
	exit 1
fi
}

modify_contact(){		#Function for modify contatct

echo -n "Give surname of the contact you want: "							#Input message
read -r sur											#Save the input in sur
grep  "$sur" "contacts.list." || { echo "No such contact exists" && exit 1; }			#Use grep to show the contact
echo "Do you want to modify the contact? 1:Yes 2:No :"						#Confirmation message
read -r ans											#Save the answer
if [ "$ans" -eq 1 ]										#If statement to modify the contact or exit
then
	echo "What do you want to change 1:Name 2:Surname 3:PhoneNumber1 4:PhoneNumber2 :"	#Message to see what they want to modify
	read -r find										#Save the answer
	a=$(grep  "$sur" "contacts.list." | awk '{print $'"$find"'}')		    #Use grep to find the line they want to change and then awk to find the exact word
	if [ "$find" -eq 1 ]									#If statement to see which part of the contact to change
	then
		echo "Give name to replace:"
		read -r name
	 	sed -i 's/'"$a"'/'"$name"'/g' contacts.list.					#Sed commant to replace one word with another 

	elif [ "$find" -eq 2 ]
	then
		echo "Give surname to replace:"
                read -r name
                sed -i 's/'"$a"'/'"$name"'/g' contacts.list.

	elif [ "$find" -eq 3 ]
	then
		echo "Give number to replace:"
                read -r name
                sed -i 's/'"$a"'/'"$name"'/g' contacts.list.

	elif [ "$find" -eq 4 ]
        then
                echo "Give number to replace:"
                read -r name
                sed -i 's/'"$a"'/'"$name"'/g' contacts.list.

	else
		exit 1
	fi
else
	exit 1
fi
}

Sort_FirstName(){			#Function to sort the firstname
sort -k 1 contacts.list.		#Simple sort on the file
}

Sort_LastName(){			#Function to sort the firstname
sort -k 2 contacts.list.		#Sort the second column on the file
}

input=0
while [ "$input" -ne 7 ]		#While command to loop the menu
do
	echo "1) Insert Contact"	#The menu
	echo "2) Delete Contact"
	echo "3) Modify Contact"
	echo "4) Search Contact"
	echo "5) Sort Contacts by FirstName"
	echo "6) Sort Contacts by LastName"
	echo "7) Quit"
	echo "What do you want to do"
	read -r input

	if [ "$input" -lt 1 ] || [ "$input" -gt 7 ]		#If statement to make sure the user gives the correct numbers
	then
		echo "You must give number between 1-7"
		exit 1

	elif [ "$input" -eq 1 ]					#If statements to call the functions
	then
        	insert_contact

        elif [ "$input" -eq 2 ]
	then
		delete_contact
	elif [ "$input" -eq 3 ]
	then
		modify_contact
	elif [ "$input" -eq 4 ]
	then
		search_contact
	elif [ "$input" -eq 5 ]
        then
                Sort_FirstName
        elif [ "$input" -eq 6 ]
        then
                Sort_LastName
	else 
		exit 1
	fi


done
rm contacts.list.
exit 1
