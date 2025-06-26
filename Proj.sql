show databases

use start

select * from Health
limit 5


select Country,count(Country) as no_of_employees
from Health
group by Country 
order by count(Country) desc
limit 5

select * from Health


# countries 
select distinct(Country) from Health
# comments
select distinct(comments) from Health





#What percentage of employees feel their employer supports mental health?


select seek_help,round((count(seek_help='Yes')*100/count(seek_help),2) as percent
from Health

#How many respondents would feel comfortable talking about mental health with coworkers?

select coworkers,count(coworkers) as employees
from Health
group by coworkers
select * from Health;

#How many respondents think discussing mental health at work would have negative consequences?

select obs_consequence,count(obs_consequence) as no_of_people
from Health
where obs_consequence='Yes'
group by obs_consequence

select Country from Health
where Country like 'U%'

#How many remote workers vs. office workers feel supported in mental health issues?

select remote_work,count(remote_work)  from Health
group by remote_work

#Which countries have the highest number of respondents?

select Country,count(Country) as no_of_people
from Health
group by Country
order by count(Country) desc
limit 1

#What percentage of employees feel their employer supports mental health?
select * from Health;

select seek_help,round(count(seek_help)*100/(select count(*) from Health),2) as percent
from Health
where seek_help='Yes'
group by seek_help

select Age,count(Age) as no_of_people
from Health
group by Age
order by count(Age) desc



# How does employer support for mental health vary by company size?
select no_employees,seek_help,count(seek_help)
from Health
group by no_employees,seek_help



#Which countries have the highest percentage of diagnosed mental health conditions?
select Country,round(count(Country)*100/(select count(*) from Health),2) as percent
from Health
group by Country
order by percent desc
limit 1


#Among employees who feel uncomfortable discussing mental health with their supervisors, how many were actually diagnosed?
select supervisor,treatment,count(supervisor)
from Health
group by supervisor,treatment

#Is awareness of mental health benefits higher among employees in large companies?
select no_employees,seek_help,count(no_employees),round(count(no_employees)*100/(select count(*) from Health)) as percent
from Health
where seek_help='Yes'
group by no_employees,seek_help 

#What percentage of remote employees vs. onsite employees feel supported by employer
select remote_work,seek_help as employer_supprted,round(count(remote_work)*100/(select count(*) from Health),2) as percent
from Health
group by remote_work,seek_help

#Find the top 3 company sizes with the highest % of employees diagnosed.



select no_employees,treatment,round(count(no_employees)*100/(select count(*) from Health),2) as percent
from Health
where treatment='Yes'
group by no_employees,treatment
order by percent desc
limit 3

#working in teh company taking traetment
select tech_company,treatment,count(tech_company) as people
from Health
where tech_company='Yes'
group by tech_company,treatment

#taking treatment and work interference
select treatment,work_interfere,count(treatment) as people
from Health
where treatment='Yes'
group by treatment,work_interfere

#country and employers providing higher services
select Country,seek_help,count(Country) 
from Health
group by Country,seek_help

#countries with mre than 200 reponces
select Country from Health
group by Country
having count(Country)>100

#diagnosis rate across age 30,40
select Age,treatment,count(treatment) from Health
where treatment='Yes' and Age>30 and Age<40
group by Age,treatment




#What is the average age of diagnosed vs. non-diagnosed employees?
select treatment,avg(Age) from Health
where treatment='Yes'
group by treatment

select treatment,avg(Age) from health
where treatment='No'
group by treatment


#Which company size group has the highest percentage of diagnosed employees?
select no_employees,SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS diagnosed_count,
ROUND(SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS diagnosed_percentage
from Health
group by no_employees





















