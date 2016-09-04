function varargout=make_figure(varargin)
%% Description
%   Wrapper for creating a styled figure window
%   make_figure(varargin) set the properties specified in varargin to
%   a newly created figure window.
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'type'                  : type of paper (e.g. a4/usletter)
%       'color'                 : background color [r,g,b]
% Example: 
%   (1) make a figure in a4 with a white background
%       h = make_figure('papertype','a4','color',[1 1 1]);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Default figure parameters
type        = 'a4';
units       = 'centimeters';
color       = [1 1 1];  
vararginoptions(varargin,{'type','color'});  

%% 1. Setting up figure and returning handle
h       = figure;
ppos    = get(h,'position');
set(h,'position',[1 1 ppos(3:4)],'papertype',type,'paperunits',units,'color',color);
varargout = {h};
