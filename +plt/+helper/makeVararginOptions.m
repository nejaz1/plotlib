function varargout = makeUserOptions(options)
% function Opt=getUserOptions(options,Opt);
% 
% Converts user-option structure into a set of fieldnames and values
%
% INPUTS
%   options:        a structure of user options
% OUTPUT:
%   varargout:      a cell array of varargins with 'fieldname1',value1,...
%                   'fieldname2',value2 ...
% Naveed Ejaz
% ejaz.naveed@gmail.com
% 2/2017

if ~isempty(options)
    fname                       = fieldnames(options);
    N                           = 1:length(fname)*2;
    user_opt                    = cell(1,length(N));
    odd                         = mod(N,2);

    user_opt(logical(odd))      = fname;
    user_opt(logical(1-odd))    = struct2cell(options);
else
    user_opt = {};
end;

varargout = {user_opt};
