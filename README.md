# Pewlett-Hackard-Analysis
## Overview of the analysis
Bobby's manager has given two more assignments with the employee database of Pewlett-Hackard. The first assignment is to determine the number of retiring employees per title. The second assignment is to determine which employees are eligibleto participate in the mentorship program. Both these analysis' would help Pewlett-Hackard with prepareing for the "silver tsunami". 


## Discrepencies in Code & Challenge Steps
There were two discrepancies when writing the code and following the challenge instructions. The first was in deliverable 1 step 11, where it asks to filter by to_date to get the current employees. To get the correct image given the challenge, I found that you had to skip that step and you would get the correct results, which does not make sense, since employees who have either already retired or quit the company would still be included. 

The second discrepancy was in the second deliverable, where there is no step to order the to_date column when using the DISTINCT ON function. This is crucial because the DISTINCT ON fucntion retrieves the top option for the given employee number in the data. This is an issue because if the to_date column is not sorted by descending, then you may not be getting the latest title the employee has. 

## Results
Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

- From analyzing the data, it can be seen that it is mostly senior engineers and senior staff that are retiring. They make up for more than 50% of the retiring employees.

- There are only 2 Managers retiring, so it is important for Pewlett-Hackard to start looking for replacements at that level.

- Assisstant Engineers and Technique Leaders have the least amount of employees retiring. 

- There are 1549 retiring employees eligible for the mentorship program. 


## Summary 
There are 72 458 roles that will need to be filled during silver tsunami. The silver tsunami is defined as those born between 1952-1995 as they would be retiring within the next few years.  As it begins, 16,981 roles would need to be filled. This was calculated from the first year of retirees being born on 1952 that are currently employees. The breakdown of the roles that need to be filled by year can be found in the summary folder. There are not enough qualified, retirement-ready employees to mentor the next generation. There are 1549 mentorship eligible employees but there are 16, 981 roles in the first year of the silver tsunami.. 