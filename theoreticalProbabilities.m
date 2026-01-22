function p = theoreticalProbabilities()
% hypergeometric probs for 6/36 game (0..6 matches)

    totalNums = 36;
    pick = 6;
    totalComb = nchoosek(totalNums, pick);

    p = zeros(1, pick+1);
    for k = 0:pick
        p(k+1) = nchoosek(pick, k) * nchoosek(totalNums - pick, pick - k) / totalComb;
    end
end
