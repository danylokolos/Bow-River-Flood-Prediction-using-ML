close all
clear all

## Export Flow Rates

load('FlowRates.mat')

outputfile = 'FlowRatesCSV.csv';
fid = fopen(outputfile,'w+');

# print header
fprintf(fid,'Date,DateNum,Year,Month,Day,')
for ii=1:length(StationID)
  fprintf(fid,['FlowRate_' StationID(ii){1} ','])
end
fprintf(fid,'\n')

# print data
for ii=1:length(AllDatesNum)
  fprintf(fid,datestr(AllDatesNum(ii),'yyyy-mm-dd'))
  fprintf(fid,',')
  fprintf(fid,num2str(AllDatesNum(ii)))
  fprintf(fid,',')
  fprintf(fid,datestr(AllDatesNum(ii),'yyyy'))
  fprintf(fid,',')  
  fprintf(fid,datestr(AllDatesNum(ii),'mm'))
  fprintf(fid,',')  
  fprintf(fid,datestr(AllDatesNum(ii),'dd'))
  fprintf(fid,',')
  for jj=1:length(StationID)
    fprintf(fid,num2str(FlowRate(jj,ii)))
    fprintf(fid,',')
  end
  fprintf(fid,'\n')
  if mod(ii,100)==0
    display(['Wrote line ' num2str(ii) ' of ' num2str(length(AllDatesNum))])
  endif
end
fclose(fid)

##fprintf(fid,'%i