# Darwin

A simple implementation of genetic algorithm. 

It implements the basic phases of a genetic algorithm:

* Initial population
* Fitness function
* Selection
* Crossover
* ~~Mutation~~ (to do)




## Get it

Download and unzip in a folder.




## Use it

``` bash
    bundle install
```

``` bash
    ruby darwin.rb input.txt 100 -p
```

1st argument is the input file (An initial population).
2nd argument is the number of Generations to run.
3rd argument is a flag weather to plot the result or not.

_Plotting depends on [gnuplot](http://www.gnuplot.info). Make sure you have gnuplot installed on your system and system PATH._



Example output (in Windows) of a population of 500 32bit-long chromosomes for 100 generations:


![alt text](http://deltalab.gr/assets/github/darwin/plot.jpg)




## How it works

### Initial population
The algorithm gets chromosomes (binary strings) as input. Minimum chromosome length is 2 bits.

### Fitness
* Fitness of the chromosome is calculated as the decimal value of it (in other words as the sum of the values of its genes). The probability that an individual will be selected for reproduction is based on its fitness score.
* Fitness of the population is calculated as the sum of chromosomes' fitness.

### Selection
Selection is based on a "roulette" (random numbers generator). The probabilities of the chromosomes in the previous step get normalized and the selection is done by the "roulette". 

### Crossover
Crossover function currently supports crossover only in the middle of the chromosome, exchanging the right part of the chromosome (tail genes) between the parents.

![alt text](http://deltalab.gr/assets/github/darwin/crossover.png)

### Mutation
To do...



## TODO
* Detect chromosomes' length variances before running the algorithm (although it works even with length variances)
* Select point of crossover (currently in the middle of the chromosome)
* Parallelization of calculations



## Copyright

Copyright (c) 2017 Dimitrios Douros. See LICENSE for details.
