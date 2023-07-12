# Coverage to determine the size of a subnet
Using coverage to determine the size of a subnet using MATLAB

We have to populations A and B and we want to count how many individuals there are of type A. We propose to take advantage of the connection structure between people of type A, using a mathematical expression known
as the coverage of a sample. The methods that can be used are “SnowBall sampling” and “Random-walk sampling” in which, under certain assumptions, type A individuals form a network. And we proposed a criterion to develop
the sample that is tested under different assumptions. Use is made of connection models between individuals of the “ Small-Worlds ” type and of the theory of the coverage of a sample. In addition to decide whether to stop or not the sample and avoid surfing the network blindly.

### “Small-Worlds” networks
They are networks that simulate how people are interconnected in the world. An example:

![image](https://github.com/YairCCastillo/ConvergeSubnet/assets/49602985/947861bb-40ac-43c9-9e21-f2a6afa0c685)

where N: Number of de nodos, k: Number of edges connecting to its neighboring nodes, p: Probability of changing the connection of 2 nodes.



### Singletons
Singletons are individuals who only appear once in the sample. When the number of singletons is high within a sample, it indicates that the variability of the categories is high and the sample size is very small. An example:

![image](https://github.com/YairCCastillo/ConvergeSubnet/assets/49602985/b2f61234-940d-425e-aebb-2e2233d97509)

### Coverage
The coverage of a sample is defined as the proportion of the population of individuals that are represented in a sample. The formula is $C\approx 1-s/n$, where $s$ are the singleton and $n$ is the size of the sample. An example:

![image](https://github.com/YairCCastillo/ConvergeSubnet/assets/49602985/8999710d-00ff-4e9c-b1eb-856e423b80b7)
The converage is giving by $C=9/38+6/38+6/38=21/38\approx 0.55$

## Simulations
In this technique, generations of individuals will be used, and each generation will be taken as the sample. In each sample or generation, singletons will be calculated, and based on that, the mathematical expression of coverage will be utilized. 

![image](https://github.com/YairCCastillo/ConvergeSubnet/assets/49602985/5ccad49e-3284-41f4-8daa-0ca67a0de85b)
![image](https://github.com/YairCCastillo/ConvergeSubnet/assets/49602985/4cc9099c-5076-4e47-9da0-ab0781ba1bd0)

To observe the behavior of the estimated coverage, ten simulations were conducted with N = 1000, k = 3, and varying values of p = 0.1, 0.2, 0.3, 0.5, 0.8, and 1.

![image](https://github.com/YairCCastillo/ConvergeSubnet/assets/49602985/cc948693-28fb-4bef-b418-81e658c8a8c6)

