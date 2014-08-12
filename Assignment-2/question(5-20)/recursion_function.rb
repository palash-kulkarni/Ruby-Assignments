#!/usr/bin/ruby

def print_words counter	
	string_one="RUBY parses a file by looking for <br/> one of the special tags that tells it to start interpreting the text as RUBY code. The parser then executes all of the code it finds until it runs into a RUBY closing <br/> tag."
	string_one=string_one.split(/\W+/)	
	if(counter<=string_one.size)
		print "#{string_one[counter]} "
	end
	counter+=1
	print_words counter
end

print_words 0