function varargout = drawline
%% Description
%   Defaults used for drawing a stright line
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

opt.drawline.dir            = 'horz';
opt.drawline.legend         = 'none';
opt.drawline.markertype     = '.';
opt.drawline.facealpha      = 0.3;
opt.drawline.edgecolor      = 'none';
opt.drawline.plotfcn        = 'mean';
opt.drawline.errorfcn       = 'stderr';

varargout   = {opt};
