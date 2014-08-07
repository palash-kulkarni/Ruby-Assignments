#!/usr/bin/ruby
def non_duplicate_numbers
	option='y'
	numbers=Array.new
	loop_counter=0
begin
	print "Do you want to add elements in array?(y/n)"
	option=gets.chomp
	if option=='y' or option=='Y'
		print "Enter the number to insert into array"
		num=gets.chomp
		numbers.insert(loop_counter,num)

	elsif option=='n' or option=='N'
		break

	else
		puts "Sorry you have entered a wrong choice"
	end	
	loop_counter+=1
	result=numbers.find_all { |e| numbers.count(e) == 1 }
end while option=='y' or option=='Y'
puts numbers
puts result
end
non_duplicate_numbers 