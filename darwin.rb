require './inputdata'
require './fitness'
require './roulette'
require './selection'
require './crossover'

ROUNDINGDIGITS = 3 
CROSSOVEROPTIONS = [0, 1, 2]
CROSSOVERPOINT = CROSSOVEROPTIONS[0]

class GeneticAlgo

	def initialize 
		@population = []
		@chromosomeLength = 0
		@populationFitness = []
		@populationSelectionProbability = []
		@fTotal = 0
		@roulette = []
		@probabilitySum = 0
		@selectedPopulation = []
		@generation = []

		@population = loadData(ARGV[0])

		puts "Initial Population:"
		puts "\t#{@population}"

		@chromosomeLength = @population[0].length

		puts "Chromosome Length:"
		puts "\t#{@chromosomeLength}"

		@meanFTotal = 0

	end

	def run

		@populationFitness = calculateFitness(@population)

		puts "Initial Population Fitness:"
		puts "\t#{@populationFitness}"

		@fTotal = calculateTotalFitness(@population)

		puts "Total Fitness:" 
		puts "\t#{@fTotal}" 

		@populationSelectionProbability = calculatePopulationSelectionProbability(@populationFitness, @fTotal)
		
		puts "Initial Population Selection Probability:"
		puts "\t#{@populationSelectionProbability}"

		@roulette = createRoulette(@populationSelectionProbability)

		puts "Roulette:"
		puts "\t#{@roulette}"

		@selectedPopulation = selection(@population)

		puts "Selected Population:"
		puts "\t#{@selectedPopulation}"

# => GENERATION WORKS. TODO LOOP UNTIL NO Improvement.

		until (@fTotal  )
		  	@generation = crossover(@selectedPopulation, CROSSOVERPOINT, @chromosomeLength)
		  	@populationFitness = calculateFitness(@generation)
		  	@fTotal = calculateTotalFitness(@generation)
		  	@populationSelectionProbability = calculatePopulationSelectionProbability(@populationFitness, @fTotal)
		  	@roulette = createRoulette(@populationSelectionProbability)
		  	@selectedPopulation = selection(@generation)

		  	puts @fTotal
			puts "\t#{@generation}"
		end
		
	end

end

if ARGV.length == 0 then
	puts "HELP"
	puts "Usage: ruby darwin.rb [input file]"
	puts "Example: 'ruby darwin.rb input.txt'"
else
	puts "Darwin"
	puts "A simple genetic algorithm with roulette selection."
	puts "Copyright 2017 - Dimitrios Douros"
	puts ""
	g = GeneticAlgo.new
	g.run
end