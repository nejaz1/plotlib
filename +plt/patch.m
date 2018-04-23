function patch(x,varargin)
%% Description
%   Make a patch for data specified in range x
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,
%       x                   : range specified by (x1,x2)
%       'style'             : style to be applied to the figure

% Example: 
%   (1) plot a horizontal patch spanning (x1,x2) using the default plotting style
%       plt.patch([x1,x2]);
%   (2) plot a vertical line x using the default plotting style
%       plt.patch([x1,x2],'dir','vert');
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. If no figure exists, open a new one
c = get(0,'children');
if isempty(c)
    plt.figure;
end;

%% 1. Determine whether a plot style was provided
%   - if not, then use default style set
idx   = find(strcmp(varargin(:),'style'));
if isempty(idx)
    sty         = style.get;
    sty.general = plt.helper.updateUserOptions(sty.general,sty.(mfilename),...
                                                         fieldnames(sty.general));
else
%   - load user-provided style instead
    sty         = varargin{idx+1};
    idx         = ismember(1:length(varargin),[idx,idx+1]);
    varargin    = varargin(~idx);
end;

%% 2. Make line plot and set font levels to default
%   - parse inputs
opts        = plt.helper.getUserOptions(varargin,sty.(mfilename));
sty.general = plt.helper.updateUserOptions(sty.general,opts,fieldnames(sty.general));
sty.general = plt.helper.get_style_sub(sty.general,1);
sty.legend  = plt.helper.updateUserOptions(sty.legend,opts,fieldnames(sty.legend));


%   - make patch
SE = x;

if strcmp(opts.dir,'horz')
    
    XLIM    = get(gca,'xlim');
    x1 = [XLIM(1), XLIM(1), XLIM(2), XLIM(2)];
    y1 = [x(1), x(2), x(2), x(1)];
    h  = patch(x1,y1,sty.general.errorcolor);
else
    YLIM    = get(gca,'ylim');
    x1 = [x(1), x(1), x(2), x(2)];
    y1 = [YLIM(1), YLIM(2), YLIM(2), YLIM(1)];
    h  = patch(x1,y1,sty.general.errorcolor);
end;
set(h,'FaceAlpha',opts.facealpha,'edgecolor',opts.edgecolor);
uistack(h,'bottom');

