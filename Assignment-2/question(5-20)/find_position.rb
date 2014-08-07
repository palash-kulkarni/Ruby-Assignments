#!/usr/bin/ruby

def count_word
	word_counter=0
	loop_counter=0
	string_one="RUBY parses a file by looking for <br/> one of the special tags that tells it to start interpreting the text as RUBY code. The parser then executes all of the code it finds until it runs into a RUBY closing <br/> tag."
	result=string_one.split(/\W+/)
	print "Positions of RUBY are "
	while loop_counter<result.size do
		if result[loop_counter].eql?"RUBY"
			print "\t#{(loop_counter+1)}"
		end
		loop_counter+=1
	end
	puts
end

count_word