module Mixin_Module				#module
	
        def Mixin_Module.calculate_score(marks)			#method to calculate score
                score = ((marks[0]+marks[1]+marks[2]+marks[3]+marks[4])/5)
                puts "Score is #{score}"
        end
	
	def Mixin_Module.calculate_simple_interest(principle,rate,time)	  #method to calcualte simple interest
		simple_interest=((principle*rate*time)/100)
		puts "Simple Interest is #{simple_interest}"
	end
end

