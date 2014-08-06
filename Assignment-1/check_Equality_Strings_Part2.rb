#!/usr/bin/ruby

def check_equality_strings first_string,second_string  #Method to Check whether the entered string is equal or not
	if first_string==second_string		       #check whether strings are equal or not
		return true			       #if yes then return true
	else
		return false			       #if no then return false
	end
end

print "Enter the first String :"
first_string=gets.chomp				       #get first input string from user
print "Enter the second string :"
second_string=gets.chomp			       #get second input string from user
result=check_equality_strings first_string,second_string
puts "Result of equality of two strings #{first_string} and #{second_string} is #{result}"  #display the result of equality of two strings

