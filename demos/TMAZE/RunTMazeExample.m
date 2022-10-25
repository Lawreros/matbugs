
clear
addpath('../../');
%2 by number trials matrix of response data
I = [ 0   NaN     0   NaN     0   NaN     0   NaN     0   NaN     0   NaN     0   NaN     0   NaN     0   NaN ...
      0   NaN     1   NaN     1   NaN     0   NaN     0   NaN     0   NaN     0   NaN     1   NaN     0   NaN ...
      0   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN ...
      1   NaN     1   NaN     1   NaN ;
      NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1 ...
      NaN     1   NaN     1   NaN     0   NaN     0   NaN     0   NaN     1   NaN     0   NaN     0   NaN     0 ...
      NaN     0   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1   NaN     1 ...
      NaN     1   NaN     1   NaN     1]; 
          
%1 by number trials vector of behavior data
le =[  1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1 ...
       1     1     0     1     0     0     1     0     1     0     1     1     1     0     0     0     1     0 ...
       1     0     0     1     0     1     0     1     0     1     0     1     0     1     0     1     0     1 ...
       0     1     0     1     0     1 ];


dataStruct = struct('n', I, 'T', size(I,2), 'le', le ); 

%guess some initial conditions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init1 = struct( 'x', randn(size(I)), ... 
                'xb', randn(size(le)) );
      init2 = struct('x', 2*randn(size(I)), ...
                'xb', randn(size(le)));
init3 = struct('x', -1*randn(size(I)), ...
                'xb', randn(size(le)));

initStructs(1) =  init1; initStructs(2) =  init2; initStructs(3) =  init3;
            
%run model%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eval(['filename = ''ModelTMaze.txt'''])

[samples, stats, structArray] = matbugs(dataStruct, ...
		fullfile(pwd, filename), ...
		'init', initStructs, ...
                'nChains', 3, ...
		'view', 0, 'nburnin', 10000, 'nsamples', 2000, ...
		'thin', 10, ...
		'monitorParams', ...
        {'p','x','pb','xb','finalpn','mu1','mu2'}, ...
                'Bugdir', 'C:/Program Files/WinBUGS14');
            

%plotting

plotstuff;            
 


