# SVM-for-Genetic-Algorithm

Abstract:
-------------------------------
In the recent years, metaheuristic algorithms are used to solve real-life complex problems arising from different fields such as economics, engineering, politics, management, and engineering. Intensification and diversification are the key elements of metaheuristic algorithm. The proper balance between these elements are required to solve the real-life problem in an effective manner. These algorithms are broadly classified into two categories namely single solution and population based metaheuristic algorithm. Single-solution based metaheuristic algorithms utilize single candidate solution and improve this solution by using local search. However, the solution obtained from single-solution based metaheuristics may stuck in local optima. The well-known single-solution based metaheuristics are simulated annealing, tabu search (TS), microcanonical annealing (MA), and guided local search (GLS). Population-based metaheuristics utilizes multiple candidate solutions during the search process. These metaheuristics maintain the diversity in population and avoid the solutions stuck in local optima. Some of well-known population-based metaheuristic algorithms are genetic algorithm (GA), particle swarm optimization (PSO), ant colony optimization (ACO), spotted hyena optimizer (SHO), emperor penguin optimizer (EPO), and seagull optimization (SOA) [43].

![alt text](https://github.com/FazelYU/SVM-for-Genetic-Algorithm/blob/main/figs/Abstract.png)

The initial population of an evolutionary algorithm can directly affect the speed and convergence of the algorithm. The initial population is often selected uniformly from the feasible space allowing the diversifaction of the algorithm. To enhance the intensification of the Genetic Algorithm, we propose a method for selecting a promising initial population. 

We first uniformly sample the feasible space, and run a gadient descent from each uniformly selected point to reach a local optimum. We store the optimal values in an array, and we select the local optimum value of the smalllest 5% of the obtained local optima as a treshhold T. We label the initial points based on the local optima obtained from the gradient descent; if the local optima is grater than T, the point is labeled as negative (-), otherwise, we label it as positive (+). A positive point is potentially a promising initinal point to the genetic algorithm. Based on the obtained dataset, we train a support vector machine (SVM) to predict wether a point is promising or not. After training the classifier, we uniformly sample from the feasible space and check if the SVM classifier accepts the point or not. If it passes the classifer's test, we keep the point in the initial population. We keep this process until we reach the required population size. We call this algorithm Learned Genetic Algorithm (LGA).

Empirical experiments on classical test functions and the problem of optimal design of a PID controller of an AC-servo-motor illustrate that our approach can improve the speed and accuracy of the genetic algorithm.

Methodology:
-----------------------
Figure below shows the frame work of the LGA algorithm:
<table>
  <tr>
    <td><img src="/figs/LGA_M.png" width=500 height=400> <figcaption>Fig.1.1 - LGA Training</td>
    <td><img src="/figs/LGA_U.png" width=500 height=400> <figcaption>Fig.1.2 - LGA Utilization</figcaption></td>
  </tr>
</table>
