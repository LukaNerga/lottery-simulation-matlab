function [pmfVals, cdfVals] = pmf_cdf(probArray)
% builds pmf and cdf from prob vector

    pmfVals = probArray;
    cdfVals = cumsum(pmfVals);
end
