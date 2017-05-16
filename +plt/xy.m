function xy(x,y,cat,varargin)
%% Description
%   Make a stylized xy plot for data x against y
%   This is a wrapper function for the lineplot in the dataframe toolbox
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
%   (1) plot x against y using the default plotting style
%       plt.line(x,y);
%   (2) plot x against y using, a user defined custom style
%       first group in blue, second group in green, marker size is 4
%       sty = style.custom({'blue','green'},'markersize',4);
%       plt.line(x,y,'style',sty);
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
opts        = plt.helper.getUserOptions(varargin,addstruct(sty.legend,sty.(mfilename)));
CAT         = sty.general;
opts        = plt.helper.makeUserOptions(opts);

%   - make plot
xyplot(x,y,cat,opts{:},'CAT',CAT);
plt.helper.set_font(gca,sty);    



