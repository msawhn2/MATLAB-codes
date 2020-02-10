%%
%% GetStationName
%%
%% Given a Divvy station id, loads the Divvy file 'divvy-names.csv'
%% and returns the station name associated with this id.  Returns
%% the string 'Unknown station name' if a matching station is not
%% found.
%%
%% Prof. Joe Hummel
%% U. of Illinois, Chicago
%% CS109, Fall 2017
%% Project #12
%%
function Name = GetStationName(id)
  filename = 'divvy-names.csv';
  
  if exist(filename, 'file') ~= 2  %% doesn't exist:
      fprintf('**Error in GetStationName: cannot find "divvy-names.csv" file\n');
      Name = '?';
      return;
  end

  %% load file of station names, and search for matching id:
  %% MATLAB:
  %% names = dataset('File', filename, 'Delimiter', ',');
  %% LI = (names.ID == id);
  
  %% this works in MATLAB or Octave:
  [IDs, Names] = textread('divvy-names.csv', '%d %s', 'delimiter', ',');
  LI = (IDs == id);
  
  if sum(LI) == 0  %% not found:
      Name = 'Unknown station name';
  elseif sum(LI) == 1       %% found match:
      I = find(IDs == id);  %% what index was match?
      Name = Names{I};      %% use { } to extract string @ that index:
  else  %% found multiple matches, should never happen:
      Name = 'Multiple station names found, something is wrong...';
  end
end

  
  
  