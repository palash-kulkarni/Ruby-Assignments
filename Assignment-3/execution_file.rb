#!/usr/bin/ruby
$LOAD_PATH << "."

require "shop_inventory_module"
  
class Shopkeeper
  include ShopInventoryModule
  
  @shop_name
  @shopkeeper_name
  @product_name
  @price
  @stock_item
  @company_name
  @product_id
	
  def initialize
    @product_id=0
	  inventory_file=File.new("inventory.txt","a+")
	  inventory_file.close
	  temp_file=File.new("temp.txt","a+")
	  temp_file.close
  end

  def getter 
	  print "Enter the Name of Shop"
	  @shop_name=gets.chomp
  end

  def setter
	  return @shop_name
  end

  def shopkeeper_menu
	  answer='y'
	  while answer=='y' or answer=='Y' do
      puts "1. Add Product"
	    puts "2. Remove Product"
      puts "3. List all products"
	    puts "4. Search Product by name"
	    puts "5. Edit Product details"
	    puts "Select any option(1-5)"
	    option=gets.chomp
	    option=Integer(option)
	    if(option==1)
	      add_product
      elsif(option==2)
		    remove_product
	    elsif(option==3)
		    ShopInventoryModule.list_product
	    elsif(option==4)
		    ShopInventoryModule.search_product
	    elsif(option==5)
		    edit_product_details
	    else
		    puts "You have enterted the wrong choice"
	    end
	    puts "Do you want to select options again from menu?"
	    answer=gets.chomp
	  end
  end

  def add_product
    @product_id+=1
	  puts "Enter the Product Name :"		
	  @product_name=gets.chomp
	  puts "Enter the Price :"
	  @price =gets.chomp
	  puts "Enter the Stock Item :"
	  @stock_item =gets.chomp
	  puts "Enter the company name :"
	  @company_name=gets.chomp
	  inventory_file=File.open("inventory.txt","a")
	  if inventory_file
	    inventory_file.write(@product_id)
		  inventory_file.write(",")
		  inventory_file.write(@product_name)
		  inventory_file.write(",")
		  inventory_file.write(@price)
		  inventory_file.write(",")
		  inventory_file.write(@stock_item)
		  inventory_file.write(",")
		  inventory_file.write(@company_name)
		  inventory_file.write("\n")
	  else
		  puts "Unable to open file"
	  end
	  inventory_file.close
  end

  def remove_product
    print "Enter the product_id to remove Product :"
	  @product_id=gets.chomp
	  inventory_file=File.open("inventory.txt","r+")
	  temp_file=File.open("temp.txt","w+")
	  inventory_file.each_line do |line|
  	  split_line=line.split(",")
  	  unless split_line[0].eql?(@product_id)
  	    temp_file.write(line)
  	  end
    end
  	temp_file.close
  	inventory_file.close
  	temp_file=File.open("temp.txt","r+")
  	inventory_file=File.open("inventory.txt","w+")
  	temp_file.each_line do |line|
  	  inventory_file.write(line)
  	end
  	inventory_file.close
  	temp_file.close
  end

  def edit_product_details
    product_search_flag=0
	  puts "Enter the product_id to edit its details"
	  @product_id=gets.chomp
	  puts "Enter the Product Name :"		
	  @product_name=gets.chomp
	  puts "Enter the Price :"
	  @price =gets.chomp
	  puts "Enter the Stock Item :"
	  @stock_item =gets.chomp
	  puts "Enter the company name :"
	  @company_name=gets.chomp
	  inventory_file=File.open("inventory.txt","r+")
	  temp_file=File.open("temp.txt","w+")
	  inventory_file.each_line do |line|
  	  split_line=line.split(",")
  	  if split_line[0].eql?(@product_id)
  	    temp_file.write("#{@product_id},#{@product_name},#{@price},#{@stock_item},#{@company_name}")
  		  product_search_flag = 1
  	  else
  		  temp_file.write(line)
  	  end
  	end
  	temp_file.close
  	inventory_file.close
  	if product_search_flag==1
  	  temp_file=File.open("temp.txt","r+")
  	  inventory_file=File.open("inventory.txt","w+")
  	  temp_file.each_line do |line|
  	    inventory_file.write(line)
  	  end
  	  inventory_file.close
  	  temp_file.close
  	else	
  	  puts "Product_id not found"
  	end
  end
end

class Costumer
  include ShopInventoryModule

  def initialize 
    inventory_file=File.new("inventory.txt","a+")
    inventory_file.close
    temp_file=File.new("temp.txt","a+")
    temp_file.close
    order_file=File.new("inventory.txt","a+")
    order_file.close
  end

  def getter
    print "Enter the Name of customer :"
    costumer_name=gets.chomp
  end

  def setter
    return costumer_name
  end

  def costumer_menu
    answer='y'
    while answer=='y' or answer=='Y' do
      puts "1. List Products" 
      puts "2. Search Product"
      puts "3. Buy Product"
      print "Enter the option(1-3) :"
      option=gets.chomp
      option=Integer(option)
      if(option==1)
        ShopInventoryModule.list_product
      elsif(option==2)
        ShopInventoryModule.search_product
      elsif(option==3)
        buy_product
      else
        puts "You have enterted the wrong choice"
      end
      puts "Do you want to select options again from menu?"
      answer=gets.chomp
    end
  end

  def buy_product
    product_search_flag=0
    
    print "Enter the Product_id :"
    product_id=gets.chomp
    inventory_file=File.open("inventory.txt","r+")
    temp_file=File.open("temp.txt","w+")
    inventory_file.each_line do |line|
      split_line=line.split(",")
      unless split_line[0].eql?(product_id)
        temp_file.write(line)
      end
      if split_line[0].eql?(product_id)
        flag=1
        new_line=check_manipulate_product(product_id,line)
        temp_file.write(new_line)
      end
    end
    temp_file.close
    inventory_file.close
    temp_file=File.open("temp.txt","r+")
    inventory_file=File.open("inventory.txt","w+")
    temp_file.each_line do |line|
      inventory_file.write(line)
    end
    inventory_file.close
    temp_file.close
    print "Enter the Costumer name:"
    costumer_name=gets.chomp
    print "Enter the Credit card number :"
    card_number=gets.chomp
    print "Enter the cvv :"
    cvv=gets.chomp
    order_file=File.open("order.txt","a")
    order_file.write("#{product_id},#{costumer_name},#{card_number},#{cvv}\n")
  end

  def check_manipulate_product(product_id,line)
    new_line=""
    inventory_file=File.open("inventory.txt","r+")
    temp_file=File.open("temp.txt","a+")
    inventory_file.each_line do |line|
      split_line=line.split(",")
      if split_line[0].eql?(product_id)
        stock_number=Integer(split_line[3])
        stock_number-=1
      end
      new_line="#{split_line[0]},#{split_line[1]},#{split_line[2]},#{stock_number},#{split_line[4]}"
    end
    return new_line
  end
end

puts "Are you a costumer or a shopkeeper?"
puts "1. Costumer"
puts "2. Shopkeeper"
print "select option 1 or 2 :"
user=gets.chomp
user=Integer(user)
if user==1
  costumer_obj=Costumer.new
  costumer_obj.costumer_menu
elsif user==2
  shopkeeper_obj=Shopkeeper.new
  shopkeeper_obj.shopkeeper_menu
else 
  puts "You have entered a wrong choice..!"
end