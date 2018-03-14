#Competitive Population Models
An $N$ step discrete time Markov Chain on $\mathbb{Z}_{k+1}^{n×n}$ where $k$ is the number of competing populations
and $n$ is the resolution of the simulation. The environment is separated into $n^2$ slots representing the spatial and environmental resources. The simulation then runs two events, the first is a death event, which occurs with probability μ, a user input, the second is a birth event where an empty slot $i$ is filled with members of population $A$ with probability:

$$  \mathbb{P}(i  \in A) = \frac{\sum_{j \in \Gamma(i) \cap A} \mathbb{P}( \text{cell $j$ gives birth} )  }{ | \Gamma(i)| }. $$
The $\mathbb{P}( \text{cell }j\text{ gives birth} )$ is a user input along with the death rate $\mu$. 

##Running the main file
Source the FunctionsWhichGenerateandPlottheModel.R file and run the modelsimulator(StartingMatrix, LikelihoodMap, NumberofTrials) function with inputs StartingMatrix an n by n matrix of the starting positions of each population, LikelihoodMap which is a list of 6 n by n matrices first 3 contain probaility of birth of an individual from populations 1 to 3 and the next three contain probability of death of an individual from populations 1 to 3. 

This saves numbered output.RDS files into your working directory. Each .RDS files contains 10 matrices, each one represents every tenth time step.

##Visualising the Simulation: Producing a GIF output
Gif extractor loads the .RDS files and saves .png files representing the model. For example output see: 
| Light   | Phosphate | Nitrogen |
| ---      | ---       | --- |
| ![Alt Text](ExampleOutputs/LightFirst.gif)  | ![Alt Text](ExampleOutputs/PhosphateFirst.gif)          |![Alt Text](ExampleOutputs/NitrogenFirst.gif) |
| ![Alt Text](ExampleOutputs/LightSecond.gif)  | ![Alt Text](ExampleOutputs/PhosphateSecond.gif)          |![Alt Text](ExampleOutputs/NitrogenSecond.gif) |




##Producing Migration Statistics




