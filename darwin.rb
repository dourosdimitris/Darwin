require './lib/inputdata'
require './lib/fitness'
require './lib/roulette'
require './lib/selection'
require './lib/crossover'
require './lib/save-results'
require './lib/progress'

JUSTIFICATIONROWS = 40
ROUNDINGDIGITS = 6 
CROSSOVEROPTIONS = [0, 1, 2]
CROSSOVERPOINT = CROSSOVEROPTIONS[0]

class GeneticAlgo

	def initialize 

		print "Initializing Darwin...".ljust(JUSTIFICATIONROWS)

		@population = []
		@chromosomeLength = 0
		@populationFitness = []
		@populationSelectionProbability = []

		@fTotal = 0
		@fTotalSequence = []

		@roulette = []
		@probabilitySum = 0
		@selectedChromosomes = []
		@generation = []

		@population = loadData(ARGV[0])

		@noOfGenerations = ARGV[1].to_i

		@plotting = false

		if ARGV[2] == '-p' then 
			@plotting = true
		else
			@plotting = false
		end

		@chromosomeLength = @population[0].length

		@meanFTotal = 0

		clearLog

		log("Initial Population:", @population) 
		log("Chromosome Length:", @chromosomeLength) 

		puts "Done!"

	end

	def run

		@populationFitness = calculateFitness(@population)

		log("Initial Population Fitness:", @populationFitness)

		@fTotal = calculateTotalFitness(@population)

		log("Total Fitness:", @fTotal)

		@populationSelectionProbability = calculatePopulationSelectionProbability(@populationFitness, @fTotal)
		
		log("Initial Population Selection Probability:", @populationSelectionProbability)

		@roulette = createRoulette(@populationSelectionProbability)

		log("Roulette:", @roulette)

		@selectedChromosomes = selection(@population)

		log("Selected:", @selectedChromosomes)


		# LOOP UNTIL FOR No OF GENERATIONS
		for i in 1..@noOfGenerations do 
			@generation = crossover(@selectedChromosomes, CROSSOVERPOINT, @chromosomeLength)
		  	@populationFitness = calculateFitness(@generation)
		  	@fTotal = calculateTotalFitness(@generation)
		  	@populationSelectionProbability = calculatePopulationSelectionProbability(@populationFitness, @fTotal)
		  	@roulette = createRoulette(@populationSelectionProbability)
		  	@selectedChromosomes = selection(@generation)

		  	log("", "")

		  	log("GENERATION #{i}:", "-----")

		  	log("Population Fitness:", @fTotal)

		  	log("Generation:", @generation)

		  	log("Selected:", @selectedChromosomes)

		  	@fTotalSequence << @fTotal

			updateProgress(i, ARGV[1].to_i)

		end

		puts "Done!"

		showResults(@fTotalSequence, @plotting)

	end

end

if ARGV.length <= 1 then
	puts ""
	puts "---------------------------------------------------"
	puts "DARWIN"
	puts "A simple genetic algorithm with roulette selection."
	puts "Copyright 2017, Dimitrios Douros"
	puts "---------------------------------------------------"
	puts ""
	puts "HELP:"
	puts ""
	puts "Usage: ruby darwin.rb [input file] [Generations to run] [Plot]"
	puts ""
	puts "Example: 'ruby darwin.rb input.txt 1000 -p'"
	puts ""
	puts "WARNING: Gnuplot must be installed and added to system PATH in order"
	puts "\tto plot results. You can disable plotting by removing '-p' flag."
else
	puts ""
	puts "---------------------------------------------------"
	puts "DARWIN"
	puts "A simple genetic algorithm with roulette selection."
	puts "Copyright 2017, Dimitrios Douros"
	puts "---------------------------------------------------"
	puts ""

	g = GeneticAlgo.new
	
	g.run

end