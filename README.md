# BIFX 551 - Spring 2020
## Dr. Chris Malec

### Course Description:

This class provides an introduction to programming for bioinformatics, with a focus on programming in R and tools to communicate and develop your code. Emphasis will be placed on good development practices and reproducible research. Significant time will be spent learning to program within an integrated development environment, cleaning, visualizing, and analyzing data.

-	Instructor: Chris Malec, PhD
-  Email: cmalec@hood.edu
-  Instruction: Via Zoom [Join Meeting URL](https://wse.zoom.us/j/564883860)
-  Peer-interaction: The Hood Bio-informatics program has its own slack, and a channel for this class [here](https://app.slack.com/client/TNMM5SFRP/C01097J749M)
-	Office Hours: Zoom office hours will be held Wednesdays immediately after class. Appointments can be made for other times as needed.
-	Prerequisites: BIFX 501 or BIFX 502
-	Textbooks:
    * [R for Data Science](https://r4ds.had.co.nz/index.html) by Garrett Grolemund and Hadley Whickam
    * [R Packages](http://r-pkgs.had.co.nz/) by Hadley Wickham
    * [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) by Yihui Xie, J. J. Allaire, and Garrett Grolemund
    * [Hands-On Programming with R](https://rstudio-education.github.io/hopr) by Garrett Grolemund
- GitHub will be used for submitting homework and projects.
-	Updates on your course grade will be posted periodically on Blackboard.

### Learning Objectives
On completion of this course, students should be comfortable with the following:
-	Best practices for developing code
- Concepts of Reproducible Research
-	R programming and package development within RStudio
-	Version tracking using git
-	Collaborative software development using GitHub

### Grading:
- Homework (25%): Short reading assignments and exercises that reinforce what we discuss in class.
- In-class participation (25%): Engaging during class with the exercises and collaborating well with fellow students. **This will also include a two short one-on-one check-ins with the instructor.**
-	Course Projects (50%): There will be three larger projects that apply the individual concepts covered in class, homework, and readings.
    - Create a reproducible report from a biological dataset (20%) 
    - Create an automated reproducible report (15%)
    - Create an app with R shiny (15%).

- Attendance is not an explicit part of your grade, however your attendance is critical to your success.
        - If you must miss a class, getting notes from a classmate is your responsibility. 
        - More than three unexcused absences will drop your final grade by one letter grade. 

- The grading scale is as follows:

Letter Grade | Final Percentage
-------------|-----------------
A | 94-100%
A- | 90 - 93.99%
B+ | 87 - 89.99%
B | 83 - 86.99%
B- | 80 - 82.99%
C+ | 77-79.99%
C | 73 - 76.99%
C- | 70-72.99%
F | < 70%
### Academic Integrity:

You are expected to abide by the honor code and include it on your assignments. All work you turn in should be your own, or the work of your group in the case of a group project.  If you have any questions about what is acceptable help, ask me.

### Accommodations for Disabilities: 

This course is intended to be accessible for all students, including those with mental, physical, or cognitive disabilities, illness, injuries, impairments, or any other condition that tends to negatively affect one’s equal access to education. If at any point in the term, you find yourself not able to fully access the space, content, and experience of this course, you are welcome (and not required) to contact me by email, phone, or during office hours to discuss your specific needs. I also encourage you to contact the Office of Accessibility Services (301-696-3421 or AccessibilityServices@hood.edu). If you have a diagnosis or history of accommodations in high school or previous postsecondary institutions, Accessibility Services can help you document your needs and create an accommodation plan. By making a plan through Accessibility Services, you can ensure appropriate accommodations without disclosing your condition or diagnosis to course instructors.  


### Tentative Schedule
Reading assignments for each week should be read prior to class. Links are provided to online resources when available.

Date | Topic | Reading | Exercise
-----|-------|-----------|---------
Jan 21 | Welcome, Git/Github, R markdown | [Markdown](https://guides.github.com/features/mastering-markdown/) and [Chapter 2: HOPR](https://rstudio-education.github.io/hopr/basics.html) | Fork the class repository, create a new markdown file called "your_initials_week1.md" and write a short explanation of why you are in the bioinformatics program. Use a list, a picture, a link, and a table. Then send me a pull request. [GitHub Flow](https://guides.github.com/introduction/flow/)
Jan 28 | Basic R: man pages, basic functions, data frames, factor variables, and other data types |[Chapter 11: R4DS](https://r4ds.had.co.nz/data-import.html) | 1. Write your own function to convert between any two units. The function should take two arguments, a number, and an argument specifying the direction of the conversion. Include your function with documentation string in an R-markdown file 2. Load a builtin dataframe, you can see the list with data(). Use the summary function to write a short description of some interesting aspects of the dataframe. Write your results in an R-markdown file.
Feb 4 | Basic R: Importing .txt and .csv, using packages, plotting with base R | [Chapter 2: RMDG](https://bookdown.org/yihui/rmarkdown/basics.html)| Find a csv or txt file, download it, read it into a dataframe, use summary() to describe it, and create a labeled graph. Submit as an .R file. It should run and produce your graph
Feb 11 | R packages: knitr,tidyr/dplyr |[Chapter 5: R4DS](https://r4ds.had.co.nz/transform.html) & [Chapter 12: R4DS](https://r4ds.had.co.nz/tidy-data.html)| Find **Three** biological data sources that you can use for your first project. For each write about why you find the dataset interesting, anticipated difficulties, and a question you would like to answer. Perform a precursory exploration (types and amount of different variables and a simple graph) for each dataset and turn in an R Markdown document.
Feb 18 | R packages: dplyr/tidyr, ggplot2 |[Chapter 3: R4DS](https://r4ds.had.co.nz/data-visualisation.html) |Start Project 1:Perform a fuller exploratory analysis on your dataset for your project. You should aggregate the data in some way with dplyr (if your dataset doesn't have any categorical variables, then make some) and make **four distinct figures** using ggplot2. Make sure you include: A plot with continuous variables, a plot with discrete variables, a plot where you use color or size to represent a quantity, a faceted plot. Include text between your plots to tell a story about the data. What insights do these plots give us into your data?
Feb 25 | R packages: ggplot2 & datetimes| |
Mar 3 | R packages: Unix environments and loops |[Introduction and Package Structure](http://r-pkgs.had.co.nz/) and [Introduction to BASH](https://towardsdatascience.com/basics-of-bash-for-beginners-92e53a4c117a) |Project 1: Summary Report Due
Mar 10 | Spring Recess | | 
Mar 17 | Spring Recess | |
Mar 24 | Unix environments and shell scripts | |grep assignment
Mar 31 | Parts of an R package |Chapter 11: HOPR](https://rstudio-education.github.io/hopr/loops.html) | Github report and minimal R package
Apr 7 | Regression analysis with R: linear and logistic|[Linear Regression](http://r-statistics.co/Linear-Regression.html), [Logistic Regression](http://r-statistics.co/Logistic-Regression-With-R.html) |Project 2: Reproducible Report 2 Due Friday April 17th
Apr 14 | The frontend: R shiny|[RStudio](https://shiny.rstudio.com/) |Minimal R-shiny app
Apr 21 | The frontend: R shiny | |Call a function
Apr 28 | The frontend: R  shiny | |Project Progress check
May 5 | Share projects| | Project 3: Shiny app Due

