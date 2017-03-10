function varargout=subplot(nRow,nCol,nFocus)
%% Description
%   Wrapper for creating a styled subplot window
%   subplot(varargin) set the properties specified in varargin to
%   a newly created figure window.
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'nRow'                  : number of rows
%       'nCol'                  : number of columns
%       'nFocus'                : focus of current subplots
% Example: 
%   (1) make a subplot with 1xrow, 2xcolumns, set focus to col 1
%       h = pub.subplot(121);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

% count number of open figure windows
c = get(0,'children');
if isempty(c)
    plt.figure;
end;

narg = nargin;
if narg==0
    h = subplot(121);
elseif narg==1
    h = subplot(nRow);
elseif narg==2
    h = subplot(nRow,nCol);    
elseif narg==3
    h = subplot(nRow,nCol,nFocus);    
end;
varargout = {h};
