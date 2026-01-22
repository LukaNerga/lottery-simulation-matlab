% runLotterySimulation.m
% ee300 project - lottery thing (6/36)

close all;      
clear; clc;    

% fix seed 
seed = 1234567;
rng(seed);
fprintf('rng seed = %d\n', seed);

N = 1000000; % Num of tickets

fprintf('\nrunning 6/36 lottery with N = %d tickets...\n', N);

[counts, empProb, winNum] = simulateLottery(N);

theoProb = theoreticalProbabilities();

[pmfVals, cdfVals] = pmf_cdf(empProb);

disp('winning numbers:');
disp(winNum);

% print probs table
fprintf('\nMatches   Count        EmpProb       TheoProb\n');
for k = 0:6
    fprintf('  %d        %7d    %.6f    %.6f\n', ...
        k, counts(k+1), empProb(k+1), theoProb(k+1));
end

% pmf / cdf print (just to see numbers)
fprintf('\nPMF (empirical, P(X = k)):\n');
disp(pmfVals);

fprintf('CDF (empirical, P(X <= k)):\n');
disp(cdfVals);

%% extra events  

% win money : 3 or more matches
p_win_money = sum(theoProb(4:7));   % X = 3,4,5,6

% big win : 5 or 6 matches
p_big_win = sum(theoProb(6:7));     % X = 5,6

% total combinations of tickets
totalComb = nchoosek(36, 6);

% ticket has number 7
no7Comb   = nchoosek(35, 6);        % tickets with no 7
p_has_7   = 1 - no7Comb / totalComb;

% ticket has at least one number divisible by 3
% numbers not div by 3 : 24 of them
noDiv3Comb       = nchoosek(24, 6);
p_at_least1_div3 = 1 - noDiv3Comb / totalComb;

% ticket has exactly ONE number divisible by 5
% mult of 5: 5,10,15,20,25,30,35 -> 7 nums
% others: 29 nums not mult of 5
goodDiv5Comb    = nchoosek(7, 1) * nchoosek(29, 5);
p_exactly1_div5 = goodDiv5Comb / totalComb;

fprintf('\nextra events:\n');
fprintf('P(win money, X >= 3)                 = %.6f\n', p_win_money);
fprintf('P(big win, X >= 5)                   = %.6f\n', p_big_win);
fprintf('P(ticket has number 7)               = %.6f\n', p_has_7);
fprintf('P(ticket has num divisible by 3)     = %.6f\n', p_at_least1_div3);
fprintf('P(exactly 1 num divisible by 5)      = %.6f\n', p_exactly1_div5);

%% plots for extra events 

extraVals = [p_win_money, p_big_win, p_has_7, p_at_least1_div3, p_exactly1_div5];

figure;
bar(extraVals);
set(gca, 'XTick', 1:5, 'XTickLabel', ...
    {'win X>=3', 'big X>=5', 'has 7', 'has div3', '=1 div5'});
xtickangle(20);
ylabel('prob');
title('extra event probs (theory)');
grid on;

figure;
pie(extraVals, {'win X>=3', 'big X>=5', 'has 7', 'has div3', '=1 div5'});
title('extra event weight graph');

%% prize money 

totalMoney = 1000000;  % fake total pool

% weights for 3,4,5,6 matches (just some percentages)
rawPerc = [4.42 3.90 4.16 39.52];
rawSum = sum(rawPerc);
share = rawPerc / rawSum;

pool3 = totalMoney * share(1);
pool4 = totalMoney * share(2);
pool5 = totalMoney * share(3);
pool6 = totalMoney * share(4); % jackpot

w3 = counts(3+1);
w4 = counts(4+1);
w5 = counts(5+1);
w6 = counts(6+1);

p3 = 0; if w3 > 0, p3 = pool3 / w3; end
p4 = 0; if w4 > 0, p4 = pool4 / w4; end
p5 = 0; if w5 > 0, p5 = pool5 / w5; end
p6 = 0; if w6 > 0, p6 = pool6 / w6; end

fprintf('\nprize money:\n');
fprintf('total pool = %d$\n', totalMoney);
fprintf('3 matches: winners = %d, pool = %.2f$, each ~ %.2f$\n', w3, pool3, p3);
fprintf('4 matches: winners = %d, pool = %.2f$, each ~ %.2f$\n', w4, pool4, p4);
fprintf('5 matches: winners = %d, pool = %.2f$, each ~ %.2f$\n', w5, pool5, p5);
fprintf('6 matches: winners = %d, pool = %.2f$, each ~ %.2f$\n', w6, pool6, p6);

%% main distribution plots

% empirical vs theoretical for X (0..6 matches)
figure;
bar(0:6, [empProb; theoProb]');
xlabel('matches (X)');
ylabel('prob');
title('empirical vs theoretical for number of matches');
legend('emp','theo');
grid on;

% pmf + cdf (emp)
figure;
subplot(2,1,1);
bar(0:6, pmfVals);
title('PMF: P(X = k)');
xlabel('k'); ylabel('pmf');

subplot(2,1,2);
stairs(0:6, cdfVals, 'LineWidth', 2);
title('CDF: P(X <= k)');
xlabel('k'); ylabel('cdf');
grid on;

%% 3 extra runs (just to show variation) 

numRuns = 3;
allEmp = zeros(numRuns, 7);

fprintf('\nnow doing %d more runs for pmf comparison...\n', numRuns);

for r = 1:numRuns
    [c_r, p_r] = simulateLottery(N);
    allEmp(r,:) = p_r;
end

figure;
bar(0:6, allEmp', 'grouped');
xlabel('matches');
ylabel('prob');
title('pmf from 3 different runs');
legend('run1','run2','run3');
grid on;

fprintf('\ndone.\n');
