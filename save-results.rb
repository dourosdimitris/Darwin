require 'open-uri'
require 'gnuplot'

def saveResults(sequence, ftotal, lastGeneration)
	txt_filename = 'results.txt'
	png_filename = 'population_fitness.png'

	print "Generating Results... "

	open(txt_filename, 'w') do |txtfile|
	  txtfile.puts ftotal, lastGeneration
	end

	system %{cmd /c "start #{txt_filename}"}

	Gnuplot.open do |gp|
	  Gnuplot::Plot.new( gp ) do |plot|
	  
	    plot.title  "Population Fitness"
	    plot.xlabel "Epoch"
	    plot.ylabel "Fitness"
	    
	    x = (0..sequence.length).collect { |v| v.to_i }
	    y = sequence.collect { |v| v.to_i }

	    plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
	      ds.with = "linespoints"
	      ds.notitle
	    end
	  end
	end

	puts "Done!"

end



