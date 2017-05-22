function varargout = custom(colours,varargin)
%% Description
%   Makes a custom style from the base default style sheet
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get base default styles
canvas      = 'paper';
opt         = plt.defaults.general(canvas,colours);
opt.general = plt.helper.getUserOptions(varargin,opt.general);
opt         = addstruct(opt,plt.defaults.plots);

varargout = {opt};
