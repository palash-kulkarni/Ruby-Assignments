#!/usr/bin/ruby
def palindrome
	start_index=0
	print "Enter the String to check whether it is palindrome or not"
	input_string=gets.chomp
	end_index=(input_string.size-1)
	input_string.delete(' ')
	while start_index<=end_index do
		if input_string[start_index].casecmp(input_string[end_index])
			start_index+=1
			end_index-=1
			result_flag=1
		
		else
			result_flag=0
			break
		end
	end
	if result_flag==1
		puts "Entered String #{input_string} is Palindrome"
	else
		puts "Entered String #{input_string} is not Palindrome"
	end
end

palindrome
		