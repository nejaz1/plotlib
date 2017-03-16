function varargout = hist
%% Description
%   Defaults used for hist plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)


opt.hist.percent        = 0;
opt.hist.numcat         = 25;
opt.hist.barwidth       = 0.8;

varargout   = {opt};
