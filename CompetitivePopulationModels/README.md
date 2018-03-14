#Competitive Population Models
An $N$ step discrete time Markov Chain on $\mathbb{Z}_{k+1}^{n×n}$ where $k$ is the number of competing populations
and $n$ is the resolution of the simulation. The environment is separated into $n^2$ slots representing the spatial and environmental resources. The simulation then runs two events, the first is a death event, which occurs with probability μ, a user input, the second is a birth event where an empty slot $i$ is filled with members of population $A$ with probability:

$$  \mathbb{P}(i  \in A) = \frac{\sum_{j \in \Gamma(i) \cap A} \mathbb{P}( \text{cell $j$ gives birth} )  }{ | \Gamma(i)| }. $$
The $\mathbb{P}( \text{cell }j\text{ gives birth} )$ is a user input along with the death rate $\mu$. 
##Running the main file

##Visualising the Simulation: Producing a GIF output 


![Alt Text](/CyanobacteriaPopulationandCellularModels/CompetitivePopulationModels/ExampleOutputs)
