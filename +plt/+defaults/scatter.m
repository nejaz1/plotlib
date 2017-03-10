function varargout = scatter
%% Description
%   Defaults used for scatter plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

opt.scatter.regression      = 'linear';
opt.scatter.intercept       = 1;

varargout   = {opt};
