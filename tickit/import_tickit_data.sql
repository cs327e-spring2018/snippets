\c tickit;

\copy Users from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/allusers_pipe.csv' (header FALSE, format csv, delimiter ',', encoding 'UTF8');

\copy Venue from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/venue_pipe.csv' (header FALSE, format csv, delimiter ',', null '\N', encoding 'UTF8');

\copy Category from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/category_pipe.csv' (header FALSE, format csv, delimiter ',', encoding 'UTF8');

\copy Date from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/date2014_pipe.csv' (header FALSE, format csv, delimiter ',', encoding 'UTF8');

\copy Event from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/allevents_pipe.csv' (header FALSE, format csv, delimiter ',', encoding 'UTF8');

\copy Listing from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/listings_pipe.csv' (header FALSE, format csv, delimiter ',', encoding 'UTF8');

\copy Sales from 'C:/utcs_work/cs327e_spring_2018/tickit/csv_data/sales_tab.csv' (header FALSE, format csv, delimiter ',', encoding 'UTF8');