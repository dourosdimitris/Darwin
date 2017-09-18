def createRoulette(populationSelectionProbability)

	probabilitySum = 0
	roulette = []

	populationSelectionProbability.each do |probability|
		probabilitySum = (probabilitySum + probability)
		roulette << probabilitySum
	end

	return roulette
end

