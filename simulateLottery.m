function [cnt, emp, win] = simulateLottery(N)
% sim N tickets for 6/36, counts how many matches

    totalNums = 36;
    pick = 6;

    % winning combo (6 distinct nums)
    win = sort(randperm(totalNums, pick));

    cnt = zeros(1, pick+1); % 0..6 matches

    step = 10000; % block size so it does not die
    for i = 1:step:N
        last = min(i + step - 1, N);
        blockSize = last - i + 1;

        % random tickets (each has 6 distinct nums)
        tickets = zeros(blockSize, pick);
        for j = 1:blockSize
            tickets(j,:) = randperm(totalNums, pick);
        end

        % how many nums in ticket are in win
        m = sum(ismember(tickets, win), 2);

        % update counts for 0..6 matches
        for k = 0:pick
            cnt(k+1) = cnt(k+1) + sum(m == k);
        end
    end

    emp = cnt / N; % empirical probs
end
