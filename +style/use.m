function varargout = use(sty_name)
%% Description
%   Gets/Sets the name and file location of the current selected plotting style
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. House-keeping to make sure file and names point to the right dir
%   - Get the name/location of current plotting style
sFile   = getenv('PLTSTYLEFILE');
sName   = getenv('PLTSTYLENAME');

%   - if no environment variable set, use the default/name location
if isempty(sName)
    sName   = '$DEFAULT$';
end;
if isempty(sFile)
    sFile   = '$DEFAULT$';
end;


if nargin==0
    if nargout>0
        varargout = {sName,sFile};
    else
        fprintf('style:\t%s\ndir:\t%s\n',sName,sFile);
    end;
else
    %   - Set the name/location of current plotting style
    setenv('PLTSTYLENAME',sty_name);
end;