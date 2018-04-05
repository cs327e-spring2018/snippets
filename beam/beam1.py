# First Beam Job
# To run: python beam1.py
#

from __future__ import absolute_import

import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions

def parse_records(line):
	tokens = line.split(",")
	return tokens[0]
	
with beam.Pipeline(options=PipelineOptions()) as p:
    
	lines = p | 'ReadFile' >> beam.io.ReadFromText('gs://utcs-spr2018-datasets/zillow/no_header/Zip_MedianRentalPrice_1Bedroom.csv')
	
	zipcodes = lines | 'SplitLines' >> (beam.Map(parse_records))
        
	zipcodes | 'WriteFile' >> beam.io.WriteToText('/home/shirley_cohen/code/tmp/zipcodes', file_name_suffix='.txt')
