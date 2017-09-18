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
		@initialPopulation = []
		@chromosomeLength = 0
		@initialPopulationFitness = []
		@initialPopulationSelectionProbability = []
		@fTotal = 0
		@roulette = []
		@probabilitySum = 0
		@selectedPopulation = []
		@generation = []
		@target = "111111" # target in binary or ftotal?

		@initialPopulation = loadData(ARGV[0])

		puts "Initial Population:"
		puts "\t#{@initialPopulation}"

		@chromosomeLength = @initialPopulation[0].length

		puts "Chromosome Length:"
		puts "\t#{@chromosomeLength}"

	end

	def run

		@initialPopulationFitness = calculateFitness(@initialPopulation)

		puts "Initial Population Fitness:"
		puts "\t#{@initialPopulationFitness}"

		@fTotal = calculateTotalFitness(@initialPopulation)

		puts "Total Fitness:" 
		puts "\t#{@fTotal}" 

		@initialPopulationSelectionProbability = calculatePopulationSelectionProbability(@initialPopulationFitness, @fTotal)
		
		puts "Initial Population Selection Probability:"
		puts "\t#{@initialPopulationSelectionProbability}"

		@roulette = createRoulette(@initialPopulationSelectionProbability)

		puts "Roulette:"
		puts "\t#{@roulette}"

		@selectedPopulation = selection(@initialPopulation)

		puts "Selected Population:"
		puts "\t#{@selectedPopulation}"

# => GENERATION WORKS. TODO LOOP UNTIL REACHES TARGET.
#		while .to_i(2) $i < $num  do
#		   puts("Inside the loop i = #$i" )
#		   $i +=1
#		end
		@generation = crossover(@selectedPopulation, CROSSOVERPOINT, @chromosomeLength)
		puts ""
		puts @generation
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