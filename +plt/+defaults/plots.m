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
opt.bar.barwidth        = 1;
opt.bar.gapwidth        = [1 0.2 0.1 0];
opt.bar.capwidth        = 0.15 * opt.bar.barwidth;
opt.bar.edgecolor       = 'none';
opt.bar.errorcolor      = plt.defaults.colours('black');
opt.bar.dir             = 'vert';

%% trace plot
opt.trace.errorfcn      = 'stderr';
opt.trace.facealpha     = 1;
opt.trace.erroralpha    = 0.2;

%% scatter plot
opt.scatter.regression  = 'linear';
opt.scatter.intercept   = 1;
opt.scatter.facealpha   = 0.55;
opt.scatter.edgealpha   = 0.55;
opt.scatter.sizedata    = 50;

%% xy plot
opt.xy.plotfcn_x        = 'mean';
opt.xy.plotfcn_y        = 'mean';
opt.xy.facealpha        = 0.55;
opt.xy.edgealpha        = 0.55;
opt.xy.sizedata         = 50;

%% hist plot
opt.hist.percent        = 0;
opt.hist.numcat         = 25;
opt.hist.barwidth       = 1;
opt.hist.facealpha      = 0.65;
opt.hist.edgealpha      = 0.85;
opt.hist.type           = 'line';

%% box plot
opt.box.plotall         = 1;
opt.box.notch           = 0;
opt.box.boxwidth        = 0.6;
opt.box.gapwidth        = [0.8 0.3 0.1 0];
opt.box.outliersymbol   = '0';
opt.box.markersize      = 4;
opt.box.linewidth       = 1.5;
opt.box.medianwidth     = 1.5;
opt.box.whiskerwidth    = 1.5;
opt.box.facealpha       = 0.3;
opt.box.dir             = 'vert';

%% dot plot
opt.dot.sizedata        = 35;
opt.dot.meanwidth       = 3;
opt.dot.facealpha       = 0.6;
opt.dot.edgealpha       = 0.1;
opt.dot.plotall         = 2;
opt.dot.notch           = 0;
opt.dot.boxwidth        = 0.6;
opt.dot.gapwidth        = [0.8 0.3 0.1 0];
opt.dot.outliersymbol   = '0';
opt.dot.markersize      = 4;
opt.dot.linewidth       = 1.5;
opt.dot.whiskerwidth    = 1.5;
opt.dot.dir             = 'vert';

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

%% draw shaded patch
opt.patch.dir               = 'horz';
opt.patch.facealpha         = 0.3;
opt.patch.edgecolor         = 'none';

varargout   = {opt};

