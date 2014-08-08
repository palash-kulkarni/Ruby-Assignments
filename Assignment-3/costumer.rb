#!/usr/bin/ruby

$LOAD_PATH << "."
require "shop_inventory_module"
class Costumer
  include shop_inventory

  def costumer_module.initialize 

	inventory_file=File.new("inventory.txt","a+")
	inventory_file.close
	temp_file=File.new("temp.txt","a+")
	temp_file.close
	order_file=File.new("inventory.txt","a+")
	order_file.close
  end

  def costumer_module.getter
    print "Enter the Name of customer :"
	@costumer_name=gets.chomp
  end

  def costumer_module.setter
    return costumer_name
  end

  def costumer_module.display_menu
  	answer='y'
	while answer=='y' or answer=='Y' do
	puts "1. List Products" 
	puts "2. Search Product"
	puts "3. Buy Product"
	print "Enter the option(1-3) :"
	option=gets.chomp
	  option=Integer(option)
	  if(option==1)
	    list_product
      elsif(option==2)
		search_product
	  elsif(option==3)
		buy_product
	  else
		puts "You have enterted the wrong choice"
	  end
	  puts "Do you want to select options again from menu?"
	  answer=gets.chomp
	end
  end

  def costumer_module.list_product
	inventory_file=File.open("inventory.txt","r")
	puts "List is as :"
	puts "Product_id,Product_Name,Price,Stock_Item,Company_Name :"
	puts inventory_file.read
	inventory_file.close
  end

  def costumer_module.search_product
	product_search_flag=0
	line=""
	print "Enter the Product Name :"
	product_name=gets.chomp
	inventory_file=File.open("inventory.txt","r+")
	inventory_file.each_line do |line|
	  split_line=line.split(",")
  	  if split_line[1]==(product_name)
  	    puts "Entered Product is found"
  		puts "\n#{line}\n"
  		product_search_flag=1
  		break
  	  end
  	end
  	if product_search_flag==0
      puts "Entered Product is not found"
  	end
  end

  def costumer_module.buy_product
	product_search_flag=0
	line=""
	print "Enter the Product_id :"
	product_id=gets.chomp
	print "Enter the Product Name:"
	product_name=gets.chomp
	print "Enter the Credit card number :"
	card_number=gets.chomp
	print "Enter the cvv :"
	cvv=gets.chomp
	order_file=File.open("order.txt","a")
		order_file.write("#{product_id},#{product_name},#{card_number},#{cvv}")
	shopkeeper_obj.check_manipulate_product
  end
end
costumer_obj=Costumer.new
costumer_obj.display_menu