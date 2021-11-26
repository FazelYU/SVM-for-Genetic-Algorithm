# SVM-for-Genetic-Algorithm

Abstract:
-------------------------------
In the recent years, metaheuristic algorithms are used to solve real-life complex problems arising from different fields such as economics, engineering, politics, management, and engineering. Intensification and diversification are the key elements of metaheuristic algorithm. The proper balance between these elements are required to solve the real-life problem in an effective manner. These algorithms are broadly classified into two categories namely single solution and population based metaheuristic algorithm. Single-solution based metaheuristic algorithms utilize single candidate solution and improve this solution by using local search. However, the solution obtained from single-solution based metaheuristics may stuck in local optima. The well-known single-solution based metaheuristics are simulated annealing, tabu search (TS), microcanonical annealing (MA), and guided local search (GLS). Population-based metaheuristics utilizes multiple candidate solutions during the search process. These metaheuristics maintain the diversity in population and avoid the solutions stuck in local optima. Some of well-known population-based metaheuristic algorithms are genetic algorithm (GA), particle swarm optimization (PSO), ant colony optimization (ACO), spotted hyena optimizer (SHO), emperor penguin optimizer (EPO), and seagull optimization (SOA) [43].

![alt text](

The initial population of an evolutionary algorithm is the most important factor in speed and the
probability of convergence of the algorithm. The initial population is often selected uniformly from the
feasible space. In this article, we propose a method for selecting a promising initial population for the
genetic algorithm. We call our approach as Learned Genetic Algorithm or LGA since it is based on
machine learning. After sampling the feasible space with several local searches, we use a support vector
machine (SVM) to learn the relation between the cartesian orientation of a point and its prospective final
fitness value. The points with a good fitness estimation are the promising initial points that are passed to
the downstream genetic algorithm. Empirical experiments on classical test functions and the problem of
optimal design of a PID controller of an AC-servo-motor illustrate that our approach increases the speed
and accuracy of the genetic algorithm.
