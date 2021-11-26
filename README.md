# SVM-for-Genetic-Algorithm

Abstract:
-------------------------------
In the recent years, metaheuristic algorithms are used to solve real-life complex problems arising from different fields such as economics, engineering, politics, management, and engineering. Intensification and diversification are the key elements of metaheuristic algorithm. The proper balance between these elements are required to solve the real-life problem in an effective manner. These algorithms are broadly classified into two categories namely single solution and population based metaheuristic algorithm. Single-solution based metaheuristic algorithms utilize single candidate solution and improve this solution by using local search. However, the solution obtained from single-solution based metaheuristics may stuck in local optima. The well-known single-solution based metaheuristics are simulated annealing, tabu search (TS), microcanonical annealing (MA), and guided local search (GLS). Population-based metaheuristics utilizes multiple candidate solutions during the search process. These metaheuristics maintain the diversity in population and avoid the solutions stuck in local optima. Some of well-known population-based metaheuristic algorithms are genetic algorithm (GA), particle swarm optimization (PSO), ant colony optimization (ACO), spotted hyena optimizer (SHO), emperor penguin optimizer (EPO), and seagull optimization (SOA) [43].
<table align="center">
  <tr>
    <td><img src="/figs/Abstract.png" width=900 height=300> <figcaption> Fig.1.1-LGA Training </figcaption></td>
  </tr>
</table>

The initial population of an evolutionary algorithm can directly affect the speed and convergence of the algorithm. The initial population is often selected uniformly from the feasible space allowing the diversifaction of the algorithm. To enhance the intensification of the Genetic Algorithm, we propose a method for selecting a promising initial population. 

We first uniformly sample the feasible space, and run a gadient descent from each uniformly selected point to reach a local optimum. We store the optimal values in an array, and we select the local optimum value of the smalllest 5% of the obtained local optima as a treshhold T. We label the initial points based on the local optima obtained from the gradient descent; if the local optima is grater than T, the point is labeled as negative (-), otherwise, we label it as positive (+). A positive point is potentially a promising initinal point to the genetic algorithm. Based on the obtained dataset, we train a support vector machine (SVM) to predict wether a point is promising or not. After training the classifier, we uniformly sample from the feasible space and check if the SVM classifier accepts the point or not. If it passes the classifer's test, we keep the point in the initial population. We keep this process until we reach the required population size. We call this algorithm Learned Genetic Algorithm (LGA).

Empirical experiments on classical test functions and the problem of optimal design of a PID controller of an AC-servo-motor illustrate that our approach can improve the speed and accuracy of the genetic algorithm.

Methodology:
-----------------------
Figure below shows the frame work of the LGA algorithm:
<table>
  <tr>
    <td><img src="/figs/LGA_M.png" width=420 height=300> <figcaption> Fig.1.1-LGA Training </figcaption> </td>
    <td><img src="/figs/LGA_U.png" width=420 height=300> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td> 
  </tr>
</table>

Experiemental Evaluations:
--------------------------
The figures below show three well-known test function that work as a benchmark for the optimization problems:
<table>
  <tr>
    <td><img src="/figs/test%20cases/Michalewicz.png" width=250 height=250> <figcaption> Fig.1.1-LGA Training </figcaption></td>
    <td><img src="/figs/test%20cases/Rastrigian.png" width=250 height=250> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td>
    <td><img src="/figs/test%20cases/Schwefel.png" width=250 height=250> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td>  
  </tr>
</table>
The figures below show a uniform samplig and the local search alongside the labels of the points for each test function in the 2-D case. It also represents the area that the classifier accepts as positive points. 
<table>
  <tr>
    <td><img src="/figs/test%20cases/Michalewicz_Classified.png" width=300 height=250> <figcaption> Fig.1.1-LGA Training </figcaption></td>
    <td><img src="/figs/test%20cases/Rastrigian_Classified.png" width=300 height=250> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td>
    <td><img src="/figs/test%20cases/Schwefel_Classified.png" width=300 height=250> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td>  
  </tr>
</table>

The figures below, show the evaluation of the test functions in higher diminsions. 
* SS: Sampling Size == population size 
* UGA: uniform genetic algorithm or the ordinary genetic algorithm
* SGA: sampled genetic algorithm which runs a gradient descent on every point of the initial population
* LGA (SS=30): learned genetic algorithm (our approach) with initial population of size 30
* LGA (SS=100): learned genetic algorithm (our approach) with initial population of size 100
* X axis: the required precision for the global optimum
* Y axis: we run each algorithm a fixed number of times (100 experiements for each algorithm)
  * StalledRatio: the ratio of the number of experiements that could not achieve the required precision for the global optimum
  * PerfetInitRatio: the ratio of the number of experiements that had a solution in the initial population of the genetic algorithm that already satisfies the required precision for the global optimum
  * meanTime: the average running time of the utilization phase toreach the required precision for the global optimum
<table>
  <tr>
    <td><img src="/figs/results/mitchTef.png" width=300 height=500> <figcaption> Fig.1.1-LGA Training </figcaption></td>
    <td><img src="/figs/results/RastTEf.png" width=300 height=500> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td>
    <td><img src="/figs/results/scwTef.png" width=300 height=500> <figcaption> Fig.1.2-LGA Utilization </figcaption> </td>  
  </tr>
</table>

Case Study: Controller Design for an AC Servo Motor
-------------------------------------------------

#### Problem Definition:


Consider the transfer function of an AC Servo Motor alongside two PID controllers, one for position and one for speed:

<table>
  <tr> 
    <td><img src="/figs/systm.png" width=1200 height=300> <figcaption> Fig.1.1-LGA Training </figcaption></td>
  </tr>
</table>

Where, k <sub>t</sub>, J <sub>m</sub> and B<sub>m</sub> are constant physical attributes that describe the dynamics of the AC servo motor, and K=[k<sub>p1</sub>,k<sub>p2</sub>,k<sub>i1</sub>,k<sub>i2</sub>,k<sub>d1</sub>,k<sub>d2</sub>] are the PID controllers paramters (that we can choose). The goal is to find an optimal soultion for K that minimizes the Integral of the Time Squared Error criteria (ITSE) for the unit response of the system, constrained to reasonabel K values (`0 ≤ k ∈ K ≤ 10`), and the stability check (place of Zeros and Poles of the system). The ITSE criteria is defined as below:

<table align="center">
  <tr>
    <td> <img src="/figs/ITSE.png" width=200 height=100></td>
  </tr>
</table>

#### Results:

Figures below show the results of the UGA and LGA:

<table>
  <tr>
    <td><img src="/figs/results/PID/LGA_PID.png" width=500 height=300> <figcaption> Fig.1.1-LGA PID design </figcaption></td>
    <td><img src="/figs/results/PID/UGA_PID.png" width=500 height=300> <figcaption> Fig.1.2-UGA PID design </figcaption> </td>
  </tr>
</table>

Table below reports  the results alongside the results provided by Krohlo et.al:

<table align="center">
  <tr>
    <td><img align="center" src="/figs/results/PID/Table_PID.png" width=900 height=200> <figcaption> Fig.1.1-PID design </figcaption></td>
  </tr>
</table>




