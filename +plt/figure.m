function varargout=figure(varargin)
%% Description
%   Creating a styled figure window
%   figure(varargin) set the properties specified in varargin to
%   a newly created figure window.
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'bgcolor'               : background color [r,g,b]
%       'menubar'               : toolbar and menubar toggle 
%                                   'none' (default), 'figure'
%       'resize'                : is figure resizable? 
%                                   ''on' (default), 'off'
% Example: 
%   (1) make a figure with a white background
%       h = plt.figure;
%   (1) make a figure with a black background
%       h = plt.figure('bgcolor',[0 0 0]);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

sty             = style.get;
sty.canvas      = plt.helper.getUserOptions(varargin,sty.canvas);
canvasOpt       = plt.defaults.canvas(sty.canvas.type);
sty.canvas      = addstruct(sty.canvas,canvasOpt);

%% 1. Creating figure, setting default canvas properties and returning handle
h = figure;
plt.helper.set_canvas(sty.canvas);
varargout = {h};
