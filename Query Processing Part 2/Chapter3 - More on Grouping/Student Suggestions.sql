/*
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@ Copy the template headers below.          @@
@@ Modify content for your suggestion.       @@
@@ Paste below the last solution.            @@
@@ Submit a PR.                              @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/

--------------
-- OPTIONAL --
--------------
-- Name: Becky Shao
-- Twitter:
-- LinkedIn:www.linkedin.com/in/becky-shao
-- Facebook:
-- Website:
-- Date: 19/05/2021

--------------
-- Mandatory --
--------------
-- Suggestion: For the challenge in Chapter 3, I have used the below query and it returned the same results as your solution query. Would you please advise what's the difference between the two? 
-- explanation:
   To be honest, I can't tell the technical difference between this solution vs your one. I simply followed what I have learnt from the course and came up with this solution - got exactly same result. 

-----------------------------------------------
-----------------------------------------------

SELECT
COALESCE(cast(YEAR([Vaccination_Time]) as varchar(10)),'All Years') as Year
,COALESCE([Species],'All Species') as Species
,COALESCE(v.[Email],'All Staff') as Email
,COALESCE(p.First_Name,'') as First_Name
,COALESCE(p.Last_Name,'') as Last_Name
,COUNT(*) as Number_Of_Vaccinations
,MAX(YEAR(v.Vaccination_Time)) as Latest_Vaccination_Year
FROM [Animal_Shelter].[dbo].[Vaccinations] as v
inner join Persons as p
on v.Email = p.Email
group by grouping sets (
(),
(YEAR([Vaccination_Time])),
((v.Species)),
((v.Species), YEAR([Vaccination_Time])),
((v.Email),(p.First_Name),(p.Last_Name)),
((v.Email),(p.First_Name),(p.Last_Name),(v.Species))
)
order by Year, Species, Email;
