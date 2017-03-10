function varargout=figure(varargin)
%% Description
%   Creating a styled figure window
%   figure(varargin) set the properties specified in varargin to
%   a newly created figure window.
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'type'                  : type of paper (e.g. a4/usletter)
%       'color'                 : background color [r,g,b]
%       'menubar'               : toolbar and menubar toggle (none/figure)
%       'resize'                : is figure resizable? (on/off)
% Example: 
%   (1) make a figure in a4 with a white background
%       h = plt.figure('papertype','a4','color',[1 1 1]);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

if isempty(varargin)
    varargin = {'menubar','none','resize','on'};
end;

%% 0. Default figure parameters
type        = 'a4';
units       = 'centimeters';
color       = [1 1 1];  
menubar     = 'figure';
resize      = 'on';
vararginoptions(varargin,{'type','color','menubar','resize'});  

%% 1. Setting up figure and returning handle
h       = figure;
ppos    = get(h,'position');
set(h,'position',[1 1 ppos(3:4)],'papertype',type,'paperunits',units,'color',color,...
      'menubar',menubar,'resize',resize);
varargout = {h};
