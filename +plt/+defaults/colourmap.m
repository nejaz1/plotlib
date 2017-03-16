function varargout = colourmap(cmap)
%% Description
%   Get the colours defined by the colormap ID.
%   Colourmap ids are the same as defined in matlab e.g. hot, gray, parula
% Input
%   cmap:       string specifying which colormap is required 
%               (see matlab colormap function)

% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

nPoints = 64;   % number of discrete colours used within colourmap
varargout = {fcneval(cmap,nPoints)};

