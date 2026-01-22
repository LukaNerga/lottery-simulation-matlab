# 6/36 Lottery Simulation 🎲

## Project Description
This project analyzes a 6/36 lottery game using theoretical probability and Monte Carlo simulation. The goal is to compare exact hypergeometric probabilities with empirical results, analyze extra probability events, and simulate prize pool distribution.

This project was developed as part of an EE300 probability/statistics assignment.

## Project Overview
- Lottery type: 6/36  
- Each ticket selects 6 distinct numbers from 36  
- A fixed winning combination is generated  
- Each simulated ticket is compared against the winning numbers  
- The number of matches (0–6) is recorded  
- Results are analyzed numerically and visually  

Randomness is controlled using a fixed random seed for reproducibility.

## Objectives
- Compute exact probabilities for 0–6 matches  
- Estimate probabilities using Monte Carlo simulation  
- Compare empirical and theoretical results  
- Analyze additional probability events  
- Simulate prize pool distribution  
- Visualize PMF, CDF, and simulation variability  

## Probability Model
The number of matches follows a hypergeometric distribution:
- Population size: 36  
- Success states: 6  
- Number of draws: 6  

The probability of getting exactly k matches (k = 0–6) is computed analytically and used as a reference.

## Simulation Details
- Up to 1,000,000 tickets are simulated  
- Each ticket contains 6 unique numbers  
- Simulation is executed in blocks to avoid memory issues  
- Matches with the winning combination are counted  
- Empirical probabilities are computed from frequencies  

Multiple runs are performed to demonstrate statistical variability.

## Output Summary
- Winning number combination  
- Table of matches vs empirical and theoretical probabilities  
- Empirical PMF and CDF  
- Extra probability event results  
- Prize pool distribution and estimated payouts  

## Extra Probability Events
- Probability of winning money (X ≥ 3)  
- Probability of a big win (X ≥ 5)  
- Probability a ticket contains number 7  
- Probability a ticket contains a number divisible by 3  
- Probability a ticket contains exactly one number divisible by 5  

All are computed analytically using combinatorics.

## Prize Pool Simulation
- Total prize pool: $1,000,000  
- Prize categories: 3, 4, 5, and 6 matches  
- Pool is distributed using weighted percentages  
- Winner counts come from simulation results  
- Average payout per winner is calculated  

## Visualizations
- Empirical vs theoretical distribution  
- PMF and CDF plots  
- Extra event probability plots  
- Comparison of multiple simulation runs  

## Requirements
- MATLAB or GNU Octave  
- No external toolboxes required  

## Possible Extensions
- Other lottery formats (6/42, 5/50, etc.)  
- Expected value per ticket  
- Performance optimization  
- Data export  
- Confidence intervals  

## Author
**Luka Nergadze**  
EE300 – Lottery Simulation & Probability Analysis
