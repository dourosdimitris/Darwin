require 'open-uri'
require 'gnuplot'

$txt_filename = "results.txt"

def showResults(sequence)

	print "Opening Results file... "
	system %{cmd /c "start #{$txt_filename}"}
	puts "Done!"

	if @visualization == true then 
		print "Plotting Results. "
		puts "Plot may take some seconds to open..."
		Thread.new {
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
		}
	end

end

def log(title, message)

	open($txt_filename, 'a') do |log|
		log.puts title
		log.puts "\t#{message}"
	end
end

def clearLog
	open($txt_filename, 'w') do |log|
		log.puts Time.now
		log.puts ""
	end
end
