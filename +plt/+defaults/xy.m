function varargout = xy
%% Description
%   Defaults used for xy plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)


opt.xy.plotfcn_x        = 'mean';
opt.xy.plotfcn_y        = 'mean';

varargout   = {opt};
