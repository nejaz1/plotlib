function drawline(x,varargin)
%% Description
%   Make a stylized straight line for data x
%   This is a wrapper function for the lineplot in the dataframe toolbox
%   varargin can be used to alter properties of the plot
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,
%       Use help lineplot to get plotting options for parent function in
%       dataframe toolbox
%       'style'             : style to be applied to the figure

% Example: 
%   (1) plot a horizontal line x using the default plotting style
%       plt.drawline(x);
%   (2) plot a vertical line x using the default plotting style
%       plt.drawline(x,'dir','vert');
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

%   - draw main line
M = fcneval(sty.drawline.plotfcn,x);
drawline(M,'dir',opts.dir,'color',sty.general.linecolor,...
                          'linestyle',sty.general.linestyle,...
                          'linewidth',sty.general.linewidth);

if length(x)>1
    %   - make patch
    SE      = fcneval(sty.drawline.errorfcn,x);
    
    if strcmp(opts.dir,'horz')
        XLIM    = get(gca,'xlim');
        x1 = [XLIM(1), XLIM(1), XLIM(2), XLIM(2)];
        y1 = [M-SE, M+SE, M+SE, M-SE];
        h  = patch(x1,y1,sty.general.errorcolor);
    else
        YLIM    = get(gca,'ylim');
        x1 = [M-SE, M-SE, M+SE, M+SE];
        y1 = [YLIM(1), YLIM(2), YLIM(2), YLIM(1)];
        h  = patch(x1,y1,sty.general.errorcolor);
    end;
end;    
set (h,'FaceAlpha',opts.facealpha,'edgecolor',opts.edgecolor);
