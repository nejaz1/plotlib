function image(x,varargin)
%% Description
%   Make a stylized image plot for the matrix x
%   This is a wrapper function for imagesc_rectangle in the dataframe toolbox
%   varargin can be used to alter properties of the plot
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,
%       Use help lineplot to get plotting options for parent function in
%       dataframe toolbox
%       'style'             : style to be applied to the figure
%       'leg'               : cell array of string to set as labels
%                             if leg is set to 'auto' or 'none', legend is
%                             automatically generated or suppressed
%       'leglocation'       : set location of the legend
%                               (north,east,west,south)
% Example: 
%   (1) plot matrix x 
%       plt.image(x);
%   (2) plot matrix x with colormap parula
%       plt.image(x,'MAP',colormap(parula));
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
leg         = opts.leg;
legloc      = opts.leglocation;
map         = opts.MAP;
opts        = rmfield(opts,{'leg','leglocation'});
opts        = plt.helper.makeVararginOptions(opts);

%   - make plot
plt.helper.dataframe.imagesc_rectangle(x,opts{:});
if ~strcmp(leg,'none')
    colormap(map); 
    colorbar(legloc);
else
    colorbar('off');
end;
plt.helper.set_font(gca,sty);    



