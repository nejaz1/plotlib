function varargout = image
%% Description
%   Defaults used for image plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

opt.image.YDir          = 'reverse';
opt.image.MAP           = plt.defaults.colourmap('hot');
opt.image.leg           = 'auto';
opt.image.leglocation   = 'eastoutside';

varargout   = {opt};
