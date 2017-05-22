function varargout = scatter(x,y,varargin)
%% Description
%   Make a stylized scatter plot for data x against y
%   This is a wrapper function for the scatterplot in the dataframe toolbox
%   varargin can be used to alter properties of the plot
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,
%       Use help scatterplot to get plotting options for parent function in
%       dataframe toolbox
%       'style'             : style to be applied to the figure
%       'intercept'         : determines whether an intercept is used
%                               1: use an intercept (default)
%                               0: fix intercept to go through (0,0)
%       'leg'               : cell array of string to set as labels
%                             if leg is set to 'auto' or 'none', legend is
%                             automatically generated or suppressed
%       'leglocation'       : set location of the legend
%                               (north,east,west,south)
% Output
%   varargout: Returns estimates related to the regression fit
%       r2                  : r-square for the line of best fit
%       b                   : regression coefficients
%       t                   : t-value
%       p                   : p-values for the parameter estimates

% Example: 
%   (1) plot x against y using the default plotting style
%       plt.scatter(x,y);
%   (2) plot x against y using, a user defined custom style
%       points in gray, marker size 4, no intercept
%       sty = style.custom({'gray'},'markersize',4);
%       plt.scatter(x,y,'style',sty,'intercept',0);
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
[r,b,t,p]   = plt.helper.dataframe.scatterplot(x,y,opts{:},'CAT',CAT);
plt.helper.set_font(gca,sty);

% return values (if required)
varargout = {r,b,t,p};



