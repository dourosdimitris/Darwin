class GeneticAlgo

	def initialize 
		@initialPopulation = []
		@initialPopulationFitness = []
		@initialPopulationSelectionProbability = []
		@fTotal = 0
		@roulette = []
		@probabilitySum = 0
		@selectedPopulation = []

		File.open("input.txt", "r") do |f|
		  f.each_line do |line|
		    @initialPopulation << line
		    #puts line
		  end
		end

		puts "Initial Population:"
		puts @initialPopulation

	end

	def run
		@initialPopulation.each do |chromosome|
			#puts chromosome
			@initialPopulationFitness << chromosome.to_i(2)
			#Calculate population fitness
			@fTotal += chromosome.to_i(2)
		end

		puts "Initial Population Fitness:"
		puts @initialPopulationFitness

		puts "Total Fitness:" 
		puts @fTotal 

		@initialPopulationFitness.each do |chromosomeFitness|
			@initialPopulationSelectionProbability << (Float(chromosomeFitness) / Float(@fTotal)).round(5)
		end
		
		puts "Initial Population Selection Probability:"
		puts @initialPopulationSelectionProbability

		@initialPopulationSelectionProbability.each do |probability|
			@probabilitySum = (@probabilitySum + probability)
			@roulette << @probabilitySum
		end

		puts "Roulette:"
		puts @roulette

		puts ""

		# Todo select atoms for reproduction
		
		@initialPopulation.count.times do |n|
			chromosome = 0
			rnd = rand.round(5); puts rnd
			if rnd > @roulette[n] then
				chromosome += 1
				puts chromosome
			else
				@selectedPopulation << @initialPopulation[chromosome]
			end
			
		end

		puts "Selected Population:"
		puts @selectedPopulation
	end

end

g = GeneticAlgo.new
g.run