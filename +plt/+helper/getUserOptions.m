function options=getUserOptions(newOptions,defOptions)
% function Opt=getUserOptions(options,Opt);
% 
% Deals with user-option structure. It allows the user to specify user
% options as a structure, or as a set of fieldnames and values
%
% INPUTS
%   newOptions: either a structure of user options or a cell array
%            of varargins with 'fieldname1',value1,'fieldname2',value2 ...
% OPTIONAL:
%   defOptions:     structure of default options
%   allowed: Cell array of allowed fieldnames for error checking
% 
% Joern Diedrichsen
% j.diedrichsen@ucl.ac.uk
% 2/2015

if (nargin<2)
    defOptions = [];
end;
options = defOptions; 

% Deal with option structure
c=1;
while c<=length(newOptions)
    if (isstruct(newOptions{c}))
        names = fieldnames(newOptions{c});
        for f=1:length(names);
            options.(names{f})=newOptions{c}.(names{f});
        end;
        c=c+1;
        % Alternatively, deal with number of input strings
    elseif (ischar(newOptions{c}))
        if length(newOptions)==c
            error(sprintf('Option ''%s'' must be followed by a value',newOptions{c}));
        end;
        options.(newOptions{c})=newOptions{c+1};
        c=c+2;
    else
        error('Options must be either fieldnames or structures');
    end;
end;
