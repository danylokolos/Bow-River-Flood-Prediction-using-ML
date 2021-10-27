close all
clear all

# Matrix start and end datestr
startdate = '2010-01-01';
enddate = '2020-12-31';

# Dates Wanted
AllDatesNum = datenum(startdate):datenum(enddate);
AllDatesNum = AllDatesNum';
AllDatesString = datestr(AllDatesNum);

#File list
InputDir = 'C:/Users/Danylo/Documents/Education-2021-SAIT-MachineLearning/Assignments/MidTermProject/InputRawData-BowRiver/DailyData/'
FileList = dir([InputDir '/*.csv']);

FlowRate = zeros(length(FileList),length(AllDatesNum));

for iFile = 1:length(FileList)
  display(['Working on File: ' num2str(iFile) ' of ' num2str(length(FileList))])
  [A,B,C,D,E] = textread([InputDir FileList(iFile).name],'%s %f %s %f %s','delimiter',',','headerlines',2);
  display('File Read')
  numC = datenum(C(:,1),'yyyy/mm/dd');
  display('Date Read')
  StationID{iFile} = A(1,1){1};
##  for ii = 1:length(A)
    for jj = 1:length(AllDatesNum)
      clear ind ind2
      ind = find(AllDatesNum(jj) == numC);
      ind2 = find(B(ind)==1);
      if ind2>0
        FlowRate(iFile,jj) = D(ind(ind2));
      else
        FlowRate(iFile,jj) = -9999999;
      end
      
        
      
      
      
##      currentdate = datenum(C(ii,1),'yyyy/mm/dd');
##      ind = find(currentdate==AllDatesNum(jj));
##      if ind > 0
##        display('hello')
##      end
     if mod(jj,1000)==0
       display(['Day ' num2str(jj) ' completed of ' num2str(length(AllDatesNum))])
     end
      
    end
##  end
end

 
save('FlowRates.mat','StationID','FlowRate','AllDatesNum','AllDatesString')