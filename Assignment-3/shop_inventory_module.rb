module ShopInventoryModule
  def ShopInventoryModule.list_product
	inventory_file=File.open("inventory.txt","r")
	puts "List is as :"
	puts "Product_id,Product_Name,Price,Stock_Item,Company_Name :"
	puts inventory_file.read
	inventory_file.close
  end

  def ShopInventoryModule.search_product
	  product_search_flag=0
	  print "Enter the Product Name :"
	  product_name=gets.chomp
    puts "List is as :"
    puts "Product_id,Product_Name,Price,Stock_Item,Company_Name :"
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
end