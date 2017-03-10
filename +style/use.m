function varargout = use(sty_name)
%% Description
%   Gets/Sets the name and file location of the current selected plotting style
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

if nargin==0
    %   - Get the name/location of current plotting style
    sFile   = getenv('PLTSTYLEFILE');
    sName   = getenv('PLTSTYLENAME');

    if (isempty(sName) || isempty(sFile))
        % if no environment variable set, use the default/name location
        sName   = '$DEFAULT$';
        sFile   = '$DEFAULT$';
    end;

    if nargout>0
        varargout = {sName,sFile};
    else
        fprintf('style:\t%s\ndir:\t%s\n',sName,sFile);
    end;
else
    %   - Set the name/location of current plotting style
    setenv('PLTSTYLENAME',sty_name);
end;