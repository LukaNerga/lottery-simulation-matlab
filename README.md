Lottery Simulation (6/36 Game) – EE 300 Probability Project

Student: Luka Nergadze 

Project Overview

This project simulates a 6/36 lottery to study discrete probabilistic events. 
Both theoretical probabilities (hypergeometric distribution) and empirical 
probabilities from MATLAB simulations are computed and compared.

Key points:

Sampling without replacement

Monte Carlo simulation with 1,000,000 tickets

Analysis includes PMF, CDF, and graphs

Reproducibility using fixed seeds

Random Experiment

Winning ticket: 6 distinct numbers from 1–36

Player ticket: 6 distinct numbers from 1–36

Random variable X = # of matches → {0,1,2,3,4,5,6}

X follows a hypergeometric distribution
​

Events Studied

Main outcomes: X = 0…6

Extra events:

Win money: X ≥ 3

Big win: X ≥ 5

Ticket contains 7

At least one number divisible by 3

Exactly one number divisible by 5

Simulation & Results

MATLAB code generates 1,000,000 random tickets

Empirical PMF closely matches theory

Graphs include PMF, CDF, and extra event charts

Fixed vs random seeds demonstrate reproducibility and randomness

Prize Money Simulation

Fake prize pool: $1,000,000

Payouts based on matches (3 → small, 4 → medium, 5 → big, 6 → jackpot)


Conclusion

Theoretical and empirical results match closely

Simulation demonstrates combinatorial reasoning and probability concepts

Multiple events and graphs confirm correct implementation and reproducibility


Files

runLotterySimulation.m

simulateLottery.m

theoreticalProbabilities.m

pmf_cdf.m


References

EE 300 Course Materials, SDSU Georgian Campus

Ross, S. M. (2014). Introduction to Probability and Statistics for Engineers and Scientists

MATLAB Documentation

ChatGPT & Claude (2025) — for explanations and code formatting
