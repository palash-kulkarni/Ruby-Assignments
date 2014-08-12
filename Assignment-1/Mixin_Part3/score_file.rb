#!/usr/bin/ruby

$LOAD_PATH << "."
require "mixin_file"			

class Score

        include Mixin_Module

        def initialize					#initializing the instance variables of class
                @marks=Array.new(5)
                @score=0
        end

        def setter					#setter method to set marks in an array
                print "Enter Score of English"
                @marks[0]=Integer(gets.chomp)
                print "Enter Score of Maths"
                @marks[1]=Integer(gets.chomp)
                print "Enter the Score of Physics"
                @marks[2]=Integer(gets.chomp)
                print "Enter the Score of chemistry"
                @marks[3]=Integer(gets.chomp)
                print "Enter the Score of Computer Science"
                @marks[4]=Integer(gets.chomp)

        end

        def getter					#getter method to get marks
                return @marks
        end

        def calculate_score				
                Mixin_Module.calculate_score(@marks)	#calculate_score is called from module
        end
end

score_object=Score.new					#object of Score class is created
score_object.setter					#setter is called
score_object.calculate_score				#calculate_score method is called
