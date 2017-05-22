function varargout = plots
%% Description
%   Defaults used for all plot in library
%   WARNING: changing values here will change default behaviour for plots
%   when no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% line plot
opt.line.plotfcn        = 'mean';

%% bar plot
opt.bar.plotfcn         = 'mean';
opt.bar.barwidth        = 0.6;
opt.bar.capwidth        = 0.1;
opt.bar.gapwidth        = [0.8 0 0 0];
opt.bar.edgecolor       = 'none';
opt.bar.errorcolor      = plt.defaults.colours('black');

%% trace plot
opt.trace.errorfcn      = 'stderr';

%% scatter plot
opt.scatter.regression      = 'linear';
opt.scatter.intercept       = 1;
opt.scatter.alpha           = 0.7;

%% xy plot
opt.xy.plotfcn_x        = 'mean';
opt.xy.plotfcn_y        = 'mean';

%% hist plot
opt.hist.percent        = 0;
opt.hist.numcat         = 25;
opt.hist.barwidth       = 0.8;

%% box plot
opt.box.plotall             = 0;

%% image plot
opt.image.YDir          = 'reverse';
opt.image.MAP           = plt.defaults.colourmap('hot');
opt.image.leg           = 'auto';
opt.image.leglocation   = 'eastoutside';

%% draw line plot
opt.drawline.dir            = 'horz';
opt.drawline.legend         = 'none';
opt.drawline.markertype     = '.';
opt.drawline.facealpha      = 0.3;
opt.drawline.edgecolor      = 'none';
opt.drawline.plotfcn        = 'mean';
opt.drawline.errorfcn       = 'stderr';

varargout   = {opt};

