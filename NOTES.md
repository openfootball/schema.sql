# Notes


### Table Event

team3:  

a boolean flag- if it is a knockout cup  if there's a match for 3rd place  (or if they do not care 
about who is no 3 or no 4) e.g. in the world cup there's a match for the 
3rd place (e.g Brazil - Netherlands)but in the Euro 2012 there's no 
match and in the Championsleague either, for example. 


### Table League

club:

a boolean flag if the team is a club (e.g. Manchester United) 
if true or a national (selection) team (e.g.  Italy) if false  -
basically a reverse copy of the national flag and, thus, redundant. 

### Table City

popm: 

the metropolitan population (thus, popm) and not the city proper population
e.g.  New York might have 10 m city proper and the metropolitan pop (popm( might have 15m or more) 

Note: This will change into its own table (metro w/ "standard" field pop)

### Table Region

nuts:  the eurostats code - kind of european iso region code 


### Table Country

s/c/d:

the type of "country"  e.g.  

- s => supranation  (actually there's now only one - e.g. the european union)
- c => country   
- d => dependency (e.g. Hong Kong, Puerto Rico, and so on) 


net:

the tld (top level domain) - the country domain e.g. .at ,.jp etc. 

fifa:

fifa country code 

motor:

the motor vehicle licence country code e.g.  A for Austria, D for Germany/Deutschland, etc.


### Table Place

kind:

Note:  Best to look in the three country/region/city models. They should have all a place_kind method e.g. 

~~~
def place_kind 
  if is_metro? 
    'MTRO' 
  elsif is_district? 
    'DIST' 
   else 
    'CITY' 
   end 
end 
~~~

