function varargout = get_shades(numShades,colourmapID,order)
%% Description
%   Fetches a number of evenly spaced RGB colours from the supplied 
%   colormapID. The RGB values are returned in a cell structure for use
%   with sty.custom() to create custom colour values for plots.
%   If function is called without any input, it displays a list of
%   available colormaps.
% Input
%   numShades:    integer of the number of shades to return. Value must be < 54.
%   colourmapID:  string of the colormap name to pull the colours from.
%                       - parula
%                       - jet
%                       - hsv
%                       - hot
%                       - cool
%                       - spring
%                       - summer
%                       - autumn
%                       - winter
%                       - gray
%                       - bone
%                       - copper
%                       - pink
%   order:        string specifying if returned shades 'increase' or 
%                   'decrease' in brightness in returned cell structure.
%                   For example, 'increase' will yeild shades that increase
%                   in brightness, such that the brightest shade will be in 
%                   varargout{1} and darkest in varargout{end}. Can be left
%                   empty.
%                       'increase'  (default)
%                       'decrease'
% Output
%   C:      cell structure of RGB required colours 
% Example: 
%   (1) List all supported colour maps in the default list 
%       plt.defaults.get_colorumap_vals('list');
%   (2) Get cell array of 12 evenly spaced rgb values for colormap 'gray'
%       in descending brightness order
%       c = plt.defaults.get_colorumap_vals(12,'gray','decrease');
% Author
%   Spencer Arbuckle (saarbuckle@gmail.com)

%% 1. Define a list of supported colormaps
% Note: all available colourmaps will work, but for brevity we list these.
colour_maps    = {'parula',...
                   'jet',...
                   'hsv',...
                   'hot',...
                   'cool',...
                   'spring',...
                   'summer',...
                   'autumn',...
                   'winter',...
                   'gray',...
                   'bone',...
                   'copper',...
                   'pink'};

%% 2. Display or return the RGB values of the list of colours
if nargin==0 || (length(numShades)==1 && strcmp(numShades,'list'))
    % no inputs provided, list colormaps
    fprintf('Available colormaps: \n')
    for i = 1:length(colour_maps)
        fprintf('\t %s \n',colour_maps{i});
        
    end
else
    % colourmap name provided
    cc = plt.defaults.colourmap(colourmapID);  % get RGB values from this colourmap 
    cc = cc(1:floor(end/numShades):end,:); % find evenly spaced RGB values from this colourmap
    
    % check ordering of shades ('increase' or 'decrease')
    if ~exist('order','var')
        order = 'increase';
    end
    switch order
        case 'increase' 
            % shades increase in brightness
            cc = cc;
        case 'decrease'
            % shades decrease in brightness
            cc = flipud(cc);
    end
    
    % assign shades to a cell structure so it can be used with sty.custom
    C = {};
    for i = 1:numShades
        C{i} = cc(i,:);
    end
end;


if nargout>0
    varargout = {C};
end;
