#!/usr/bin/ruby

def capitalize_words
	loop_counter=0
	string_one="RUBY parses a file by looking for <br/> one of the special tags that tells it to start interpreting the text as RUBY code. The parser then executes all of the code it finds until it runs into a RUBY closing <br/> tag."
	result=string_one.split(/\W+/)
	while loop_counter<result.size do
		result[loop_counter].capitalize!
		print "#{result[loop_counter]} "
		loop_counter+=1
	end
	puts
end

capitalize_words