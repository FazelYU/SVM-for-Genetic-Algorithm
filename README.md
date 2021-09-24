---NOTE: I am currently working on the documentation and the readiblity of the code. Sorry about it :) !

Abstract:

The initial population of an evolutionary algorithm is an important factor in speed and the probability of convergence of the algorithm. The initial population is often selected uniformly from the feasible space. This work proposes a method for selecting a promising initial population for the genetic algorithm. After sampling the feasible space with several local searches, we use a support vector machine (SVM) to learn the relation between the cartesian orientation of a point and its prospective final fitness value. The points with a good fitness estimation are the promising initial points that are passed to the downstream genetic algorithm.  

We call our approach as Learned Genetic Algorithm or LGA since it is based on machine learning. Empirical experiments on classical test functions and the problem of optimal design of a PID controller of an AC-servo-motor illustrate that our approach increases the speed and accuracy of the genetic algorithm. Specifically, we achieved up to 25% improvement in the integral of the time weighted square error (ITSE) of the closed loop controllers.

Refer to Paper.pdf for more information
