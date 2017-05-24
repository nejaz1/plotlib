function varargout = hist(x,varargin)
%% Description
%   Make a stylized hist plt for data x
%   This is a wrapper function for the histplot in the dataframe toolbox
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
%       plt.hist(x);
%   (2) plot x against y using, a user defined custom style, group in green
%       plt.hist(x,'style',sty);
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
opts        = plt.helper.makeVararginOptions(opts);

%   - make plot
[count,nbin] = plt.helper.dataframe.histplot(x,opts{:},'CAT',CAT);
plt.helper.set_font(gca,sty);

if nargout>1
    varargout = {count,nbin};
elseif nargout>0
    varargout = {count};
end;


