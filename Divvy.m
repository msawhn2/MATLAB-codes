%%
%%Divvy rider data analysis: avg duration, avg age,
%%rider and and starting hour histograms, and stations
%% near me
%% Mani Sawhney
%%U of Illinois, Chicago
%%CS 109, Fall 2017
%%Project #12

function Divvy()
fprintf('** Divvy Analysis Program **\n');
fprintf('\n');

filename = input ('Divvy ridership file to analyze> ', 's');
analysis = input ('Analysis to perform (1-5, 0 to exit)> ');

while (analysis~=0)
    

Result = DivvyAnalysis (filename, analysis);
analysis = input ('Analysis to perform (1-5, 0 to exit)> ');
end
fprintf('\n');
fprintf('** Done **\n');
fprintf('\n');
end


function Result = DivvyAnalysis(filename, analysis)

if exist(filename, 'file')~= 2
     fprintf('**Error: file "%s" cannot be found\n', filename);
     Result = '**Error: file not found';
     return;
end

if analysis ==1
    Result = AverageDuration(filename);
    
elseif analysis == 2
    Result = AverageAge(filename);
    
elseif analysis == 3
    Result = DurationHistogram(filename);
    
elseif analysis == 4
    Result = RideHistogram(filename);
    
elseif analysis ==5
    Result = StationsNearMe();
    
else
    Result = '**Error: invalid analysis parameter';
end
end

    function AvgDuration = AverageDuration (file)
        data = load(file);
        N = length (data);
        r = sum(data(:,3));
        AvgDuration = (r/60)/N;
       fprintf('Average ride duration: %f %s\n', AvgDuration,'minutes' );
    end

    function AvgAge = AverageAge(file)
        data = load(file);
        c= clock();
        currentyear = c(1);
        x=data(:,7);
        LI=(x==0);
        x(LI)=[];
        age = currentyear-x;
        N=length(age);
        AvgAge = sum(age)/N;
        fprintf('Average ride age: %f %s\n', AvgAge,'years old');
        
    end

    function Result = DurationHistogram(file)
        data = load(file);
        y=data(:,3);
        z=y/60;
        c1=0; c2=0; c3=0; c4=0; c5=0;
        for i=1:length(z)
            if z(i)<=30
                c1=c1+1;
            elseif z(i)>30 && z(i)<=60
                c2=c2+1;
            elseif z(i)>60 && z(i)<=120
                c3=c3+1;
            elseif z(i)>120 && z(i)<=240
                c4=c4+1;
            else
                c5=c5+1;
            end
        end
       Result= fprintf('Ride duration breakdown: \n');
        fprintf('# rides <= 30 mins: %d \n', c1);
        fprintf('# rides <= 1 hour: %d \n',  c2);
        fprintf('# rides <= 2 hours: %d \n', c3);
        fprintf('# rides <= 4 hours: %d \n', c4);
        fprintf('# rides >  4 hours: %d \n', c5);
    end

    function Result = RideHistogram(file)
        data= load(file);
        z= data (:,1);
        r=0:23;
        xlim([0 23]);
        h = histcounts(z);
       %Result = z;
       Result= plot(r',h, 'r+-');
        title('# of rides starting each hour');
        xlabel('starting hour');
        ylabel('# of rides');
        
        
    end
    
    function Result = StationsNearMe()
         data=load('divvy-stations.csv');
        lat1= input('Enter your latitude> ');
        long1= input ('Enter your longitude> ');
         miles= input ('How many miles? ');
         lat2=data(:,2);
         long2=data(:,3);
         Distances = DistBetween2Points(lat1, long1, lat2, long2);
        % LI= (Distances<=miles);
         [sortedDistances,sortedIndex] = sort(Distances);
         LI=(sortedDistances<=miles);
         sortedDistances=sortedDistances(LI);
         id=data(:,1);
         sortedID=id(LI);
         sortedID=id(sortedIndex);
         c=0;
         for i=1:length(sortedDistances)
           name = GetStationName (sortedID(i));
           Result=  fprintf('Station %d: %f miles, "%s"\n',sortedID(i), sortedDistances(i), name);
           c=c+1;
         end
         
        fprintf('# of stations %d \n', c);
         
         
    end
    
         
         


          
                
    