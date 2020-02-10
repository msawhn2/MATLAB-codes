%%
%% DistBetween2Points
%%
%% Returns the distance in miles between 2 points 
%% (lat1, long1) and (lat2, long2).
%% 
%% Prof. Joe Hummel
%% U. of Illinois, Chicago
%% CS109, Fall 2017
%% Project #12
%%
function Distance = DistBetween2Points(lat1, long1, lat2, long2)
  %%
  %% Reference: http://www8.nau.edu/cvm/latlon_formula.html
  %%
  earth_rad = 3963.1;  %% statue miles:

  lat1_rad = lat1 .* pi ./ 180.0;
  long1_rad = long1 .* pi ./ 180.0;
  lat2_rad = lat2 .* pi ./ 180.0;
  long2_rad = long2 .* pi ./ 180.0;

  %% distance between points in statue miles:
  Distance = earth_rad .* acos(...
    (cos(lat1_rad).*cos(long1_rad).*cos(lat2_rad).*cos(long2_rad)) ...
    + ...
    (cos(lat1_rad).*sin(long1_rad).*cos(lat2_rad).*sin(long2_rad)) ...
    + ...
    (sin(lat1_rad).*sin(lat2_rad)) ...
  );
end
