use ldao_db;

load data local infile 'users.csv'
   into table users
   fields terminated by ','
   lines terminated by '\n';
  
load data local infile 'suggestion.csv'
    into table suggestion
    fields terminated by ','
    lines terminated by '\n';
   
load data local infile 'person.csv'
    into table person
    fields terminated by ','
    lines terminated by '\n';

load data local infile 'institution.csv'
    into table institution
    fields terminated by ','
    lines terminated by '\n';

load data local infile 'event.csv'
    into table events
    fields terminated by ','
    lines terminated by '\n';
