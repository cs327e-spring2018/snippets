import csv, sys, string, math

path = None
slashes = None

# usage: python gen_ddl.py csv_file_to_be_converted
if len(sys.argv) != 2:
	print('Invalid number of parameters')
	print('Usage: python gen_ddl.py <path_to_input_csv_file>')
	print('Example: python gen_ddl.py datasets/airbnb/austin/2017-03-17/listings.csv')
	sys.exit()
	
csv_file = sys.argv[1]
print('csv file: ' + csv_file)

filename, extension = csv_file.rsplit('.', 1)

if filename.find('/') > -1:
	path, name = filename.rsplit('/', 1)
	slashes = '/'
elif filename.find('\\') > -1:
	path, name = filename.rsplit('\\', 1)
	slashes = '\\'
else:
	name = filename

sql_file = path + slashes + 'create_' + name + '.sql'
print('sql file: ' + sql_file)	
	
table_name = name.title()
print('table name: ' + table_name)

def round_up(x):
    return int(math.ceil(x / 10.0)) * 10		
		
with open(sql_file, 'w') as out_file:
	out_file.write('create table ' + table_name + '(\n')

	with open(csv_file, 'rt', encoding='utf8') as in_file:
		reader = csv.reader(in_file, delimiter=',')
		header = next(reader)
		
		data_rows = []
		for row in reader:
			data_rows.append(row)
		
		last_row = len(data_rows) - 1
		data = data_rows[last_row]
	
		for i in range(len(header)):
			col_name = header[i]
			val = data[i]
			if val.isdigit():
				# val is an int or boolean
				val = int(val)
				if val == 1 or val == 0:
					out_file.write('   ' + col_name.strip() + ' boolean')
				else:
					out_file.write('   ' + col_name.strip() + ' integer')
			else:	
				if val.find('.') > -1:
					# val is a decimal
					precision = str(len(val))
					int_portion, decimal_portion = val.rsplit('.', 1)
					if len(decimal_portion) < 3:
						scale = str(len(decimal_portion))
					else:
						scale = '3'
					out_file.write('   ' + col_name.strip() + ' decimal(' + precision + ',' + scale + ')')
				else:
					out_file.write('   ' + col_name.strip() + ' varchar(' + str(round_up(len(val))) + ')')
			
			if i < len(header)-1:
				out_file.write(',\n')
			else:
				out_file.write('\n')
		
		out_file.write(');')

print('Finished generating ' + sql_file + '. Please open the file and verify the column names and datatypes before running the script.') 
