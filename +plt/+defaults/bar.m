function varargout = bar
%% Description
%   Defaults used for bar plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

opt.bar.plotfcn         = 'mean';
opt.bar.barwidth        = 0.8;

varargout   = {opt};
