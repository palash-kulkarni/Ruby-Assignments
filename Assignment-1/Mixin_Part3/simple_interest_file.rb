#!/usr/bin/ruby

$LOAD_PATH << "."
require "mixin_file"
class SimpleInterest				#Simple interest class

        include Mixin_Module

        def initialize				#constructor to intialize principle rate and time instance variables
                @principle=0
                @rate=0
		@time=0
        end

        def setter				#setter to set all instance variables from user
                print "Enter Principle"
                @principle=Integer(gets.chomp)
                print "Enter Rate"
                @rate=Integer(gets.chomp)
                print "Enter the time"
                @time=Integer(gets.chomp)

        end

        def getter				#getter method to get all instance variables
                return principle,time,rate
        end

        def calculate_simple_interest		
                Mixin_Module.calculate_simple_interest(@principle,@rate,@time)	#calculate_simple_interest method is called
        end
end

interest_object=SimpleInterest.new		#object of SimpleInterest class is created
interest_object.setter				#setter is called
interest_object.calculate_simple_interest	#calcualte_simple_interest is called
