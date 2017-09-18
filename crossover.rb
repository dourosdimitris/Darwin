def crossover(population, crossoverPoint, chromosomeLength)

	newGeneration = []

	case crossoverPoint
	when 0
	  	puts "Crossover Point: #{crossoverPoint}"
	  	for chromosome in (0..(population.length - 1)).step(2)
			#puts chromosome
			a = population[chromosome]
			b = population[chromosome + 1]
			#puts a, b
			c = a[0..((chromosomeLength/2)-1)] + b[(chromosomeLength/2)..-1]
			d = b[0..((chromosomeLength/2)-1)] + a[(chromosomeLength/2)..-1]
			#puts c, d
			newGeneration << c
			newGeneration << d
		end
	when 1
	  puts '1'
	when 2
	  puts '2'
	else
	  puts "Not supported crossover point!"
	end

	return newGeneration
end
