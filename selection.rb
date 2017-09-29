def selection(population)
	
	selectedPopulation = []
	choosen = false

	population.count.times do |m|
		choosen = false
		rnd = rand.round(ROUNDINGDIGITS); #puts rnd
		population.count.times do |chromosome|
			if rnd <= @roulette[chromosome] then
				if choosen == false then
					selectedPopulation << population[chromosome]
					choosen = true
					#puts "Selected"
				end
			end
		end
	end

	#puts @roulette

	return selectedPopulation

end