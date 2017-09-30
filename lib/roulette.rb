def createRoulette(populationSelectionProbability)

	probabilitySum = 0
	roulette = []

	populationSelectionProbability.each do |probability|
		probabilitySum = (probabilitySum + probability)#.round(5)
		roulette << probabilitySum
	end

	return roulette
end

