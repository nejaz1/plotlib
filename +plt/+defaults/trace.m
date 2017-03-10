function varargout = trace
%% Description
%   Defaults used for trace plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)


opt.trace.errorfcn      = 'stderr';

varargout   = {opt};
