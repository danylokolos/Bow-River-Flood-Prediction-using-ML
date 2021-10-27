# -*- coding: utf-8 -*-
"""
Created on Mon Oct 25 21:19:33 2021

@author: Danylo
"""

### Combine All Raw Data on Water Flows

import csv
from datetime import datetime, date, time, timezone
import numpy as np


# load validation coordinates
filename = "Daily__Oct-26-2021_02_46_02AM.csv"
fields = []
rows = []
with open(filename, 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    fields = next(csvreader)
    for row in csvreader:
        rows.append(row)



mydata = np.array(rows)

for idate in range(0,365*10):
    if idate == 0:
        fulldata[idate] = date.fromisoformat('2010-01-01')
    else:
        fulldata[idate] = fulldata[idate-1]+1
        
    
a = datetime.datetime.timestamp(datetime.now())

