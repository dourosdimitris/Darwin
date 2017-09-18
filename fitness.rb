def calculateFitness(initialPopulation)

	initialPopulationFitness = []

	initialPopulation.each do |chromosome|
		#puts chromosome
		initialPopulationFitness << chromosome.to_i(2) #Convert binary to decimal with .to_i(2)
	end

	return initialPopulationFitness
end

def calculateTotalFitness(initialPopulation)

	fTotal = 0

	initialPopulation.each do |chromosome|
		#Calculate population fitness
		fTotal += chromosome.to_i(2) #Convert binary to decimal with .to_i(2)
	end

	return fTotal
end

def calculatePopulationSelectionProbability(populationFitness, fTotal)

	populationSelectionProbability = []

	populationFitness.each do |chromosomeFitness|
		populationSelectionProbability << (Float(chromosomeFitness) / Float(fTotal)).round(ROUNDINGDIGITS)
	end

	return populationSelectionProbability
end
