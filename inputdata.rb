def loadData(filepath)

	@array = []

	File.open(filepath, "r") do |f|
	  f.each_line do |line|
	    @array << line.chomp
	    #puts line
	  end
	end
	
	return @array
end
