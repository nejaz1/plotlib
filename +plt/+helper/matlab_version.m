function varargout = matlab_version
%% Description
%   Determine version of matlab being used
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

versionNum = sscanf (version, '%d.%d.%d') ;
versionNum = 10.^(0:-1:-(length(versionNum)-1)) * versionNum ;

varargout = {versionNum};
