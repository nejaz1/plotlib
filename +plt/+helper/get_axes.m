function ax = get_axes(H)
%% Description
%   H:  handle to a figure, or multiple axes
%       If H is a handle to a figure, then options are applied to every subplot.
%       If H is a handle to an axes, then options are applied to the axes only

ax        = {};   % list of axis
if (length(H)==1 && isa(H,'matlab.ui.Figure')) % user gave figure handle
    % find all children and put them into axisList
    h = H.Children;
    for i=1:length(h)
        ax = {h(i),ax{:}};
    end;
elseif iscell(H)                          % user gave a cell array of axis handles
    ax = H;
else
    ax = {H};                             % user gave a single axis
end;
