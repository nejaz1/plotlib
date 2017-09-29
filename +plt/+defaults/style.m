function [canvas,colours,opt] = style(styID)
%% Description
%   Default plotting parameters specified by the style styID
%   Define additional styles within the switch statement. Users can create
%   their own styles for their projects and use the style package to point
%   towards the user-defined style
%
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

opt = [];
switch(styID)
    case 'default'
        colours                 = {'blue','green','red','orange','aqua','magenta','yellow','black'};
        opt.general.linestyle   = {'-','-','-','-','-','-','-','-',...
                                   '--','--','--','--','--','--','--','--'};
        canvas                  = 'blackonwhite';
        opt.save.journal        = 'brain';
        opt.legend.leglocation  = 'eastoutside';
    case 'gray'
        colours                 = {'black','lightgray','darkgray','black','lightgray','darkgray'};
        canvas                  = 'blackonwhite';
        opt.save.journal        = 'brain';
        opt.general.markertype  = {'o','v','^'};
        opt.general.linestyle   = {'-','-','-','--','--','--'};
    case 'nomarker'
        colours                 = {'blue','green','red','orange','aqua','magenta','yellow','black'};
        opt.general.linestyle   = {'-','-','-','-','-','-','-','-',...
                                   '--','--','--','--','--','--','--','--'};
        opt.general.markertype  = 'none';
        canvas                  = 'blackonwhite';
        opt.save.journal        = 'brain';
        opt.legend.leglocation  = 'eastoutside';        
end;

