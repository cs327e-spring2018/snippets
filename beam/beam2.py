# Second Beam Job
# To run: python beam2.py
#

from __future__ import absolute_import

import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions

def convert_month(month):
	month_len = len(str(month))
	if month_len == 1:
		month_str = "0" + str(month)
	else:
		month_str = str(month)
	return month_str

def parse_line(line):

	parsed_records = []
	
	tokens = line.split(",")
	zipcode_with_quotes = tokens[0]
	zipcode = int(zipcode_with_quotes.strip('"'));
		
	start_index = 58;
	end_index = start_index + 12;
	
	year = 2015;
	month = 1;
	day = "01"	
	price = 0.0
		
	for i in range(start_index, end_index):
		price = tokens[i]
		date = str(year) + "-" + convert_month(month) + "-" + day
		parsed_records.append((zipcode, date, price))
		month += 1
	
	return parsed_records
		
	
with beam.Pipeline(options=PipelineOptions()) as p:
    
	lines = p | 'ReadFile' >> beam.io.ReadFromText('gs://utcs-spr2018-datasets/zillow/no_header/Zip_MedianRentalPrice_1Bedroom.csv')
	
	list_records = lines | 'CreateListRecords' >> (beam.Map(parse_line))
        
	list_records | 'WriteFile' >> beam.io.WriteToText('/home/shirley_cohen/code/tmp/list_records', file_name_suffix='.txt')
