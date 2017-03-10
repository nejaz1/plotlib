function varargout = updateUserOptions(opts,newOpts,fields)
% function Opt=updateUserOptions(options,Opt);
% 
% Update user option structure with update values
%
% INPUTS
%   opts:           a structure of user options
%   newOpts:        override opts with corresponding values from newOpts
%   fields:         if provided, only update these fields 
% OUTPUT:
%   varargout:      a structure of updated user options
%
% Naveed Ejaz
% ejaz.naveed@gmail.com
% 2/2017

if ~isempty(newOpts)
    fname   = fieldnames(newOpts);
    if nargin==3
        fname = intersect(fname,fields);
    end;
    
    for i=1:length(fname)
        if isstruct(newOpts.(fname{i}))
            opts.(fname{i})     = plt.helper.updateUserOptions(opts.(fname{i}),newOpts.(fname{i}));
        else
            opts.(fname{i})     = newOpts.(fname{i});
        end;
    end;
end;
varargout = {opts};

