function varargout = get_colours_alpha(c,lvl)
%% Description
%   Synthetically create alpha value for provided colours based on the
%   desired alpha lvl
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

if ~iscell(c)
    cAlpha  = alphaHelper(c,lvl);
else
    N       = length(c);
    cAlpha  = cell(1,N);

    for i=1:N
        cAlpha{i}   = alphaHelper(c{i},lvl);
    end;
end;
varargout = {cAlpha};


function [cAlpha] = alphaHelper(c,alphaLvl)

if isequal(c,repmat(c(1),1,3))          % different rules for gray scales
    cAlpha              = c + [1 1 1] * alphaLvl;
    cAlpha(cAlpha>1)    = 1;
else
    ci          = (1-alphaLvl)*max(c);
    ci          = c + ci;
    ci(ci>1)    = 1;
    cAlpha      = ci;
end;
