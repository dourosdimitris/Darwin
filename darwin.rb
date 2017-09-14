class GeneticAlgo

	def initialize 
		@initialPopulation = []
		@initialPopulationFitness = []
		@initialPopulationSelectionProbability = []
		@fTotal = 0
		@roulette = []
		@probabilitySum = 0

		File.open("input.txt", "r") do |f|
		  f.each_line do |line|
		    @initialPopulation << line
		    #puts line
		  end
		end
		puts @initialPopulation

		@initialPopulation.each do |chromosome|
			#puts chromosome
			@initialPopulationFitness << chromosome.to_i(2)
			#Calculate population fitness
			@fTotal += chromosome.to_i(2)
		end
		puts @initialPopulationFitness

		puts @fTotal 

		@initialPopulationFitness.each do |chromosomeFitness|
			@initialPopulationSelectionProbability << (Float(chromosomeFitness) / Float(@fTotal)).round(5)
		end
		
		puts @initialPopulationSelectionProbability

		puts rand.round(5)

		@initialPopulationSelectionProbability.each do |probability|
			@probabilitySum = (@probabilitySum + probability)
			@roulette << @probabilitySum
		end

		puts @roulette

	end

end

g = GeneticAlgo.new