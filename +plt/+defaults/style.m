function [colours,opt] = style(styID)
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
        colours     = {'blue','green','red','black','lightgray','darkgray'};
    case 'gray'
        colours     = {'black','lightgray','darkgray','black','lightgray','darkgray'};
        opt.general.markertype  = {'o','v','^'};
        opt.general.linestyle   = {'-','-','-','--','--','--'};
end;

