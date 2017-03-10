function varargout = get_style_sub(style,subID)
%% Description
%   Gets a subscript from the provided style
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

fname = fieldnames(style);
sty   = [];
for i=1:length(fname)
    if iscell(style.(fname{i}))
        sty.(fname{i}) = style.(fname{i}){subID};
    else
        sty.(fname{i}) = style.(fname{i});
    end
end;
varargout = {sty};

