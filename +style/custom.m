function varargout = custom(colours,varargin)
%% Description
%   Makes a custom style from the base default style sheet
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get base default styles
c           = plt.defaults.colours(colours);
opt         = plt.defaults.general(c);
opt.general = plt.helper.getUserOptions(varargin,opt.general);

p   = plt.defaults.plots;
for i=1:length(p)
    opt = addstruct(opt,plt.defaults.(p{i}));
end;
varargout = {opt};
