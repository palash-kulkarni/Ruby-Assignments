#!/usr/bin/ruby

def arithmetic_operations(first_number,second_number,operation)  #Method to perform operations on two number
 	first_number=Integer(first_number)			 #casting string into an integer
        second_number=Integer(second_number)			 #casting string into an integer

	if operation=="+"					 #check for if operation is +
		result=first_number+second_number
	elsif operation=="-"					 #check for if operation is -
		if first_number>second_number
			result=first_number-second_number
		elsif second_number>first_number
			result=second_number-first_number
		end
	elsif operation=="/"					 #check for if operation is /
		if second_number==0				 #check if denominator is zero
			puts "Divide by zero Exception"
		else
			result=first_number/second_number
		end
	elsif operation=="%"					 #check for if operation is %
		if second_number==0
                        puts "Divide by zero Exception"		 #check if denominator is zero
                else
                        result=first_number%second_number
		end
	else
		puts "You have Entered the wrong Operation"	 #if entered operation is wrong

	end

	return result
end

print "Enter the first number"
first_number=gets.chomp						 #get input first number from user
print "Enter the second number"
second_number=gets.chomp					 #get input second number from user
print "Enter the operations(+,-,/,%)"
operation=gets.chomp						 #get input operation from user
result=arithmetic_operations first_number,second_number,operation
puts "Result on performing operation #{operation} on two numbers #{first_number} and #{second_number} is #{result}" #display result of operation
