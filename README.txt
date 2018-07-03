
This program was written with Ruby 2.3.4

In order to execute, type "ruby employee-sort.rb" on the command line while in this folder. This file requires a list of people in a .txt file.

Testing this program:
  You will be prompted, "Which .txt file in this folder would you like to open?"
    Enter "employees.txt"

  You will be prompted, "Would you like to add another person?"
    Enter "No"

  You will be prompted, How many people would you like in each group?"
    Enter "5"

  You will receive a response similar to "Your groups have been sorted into groups1530570706.txt in this folder." The filename will be slightly different. This file will contain a list of 19 groups of 5 people.

In this program, you can also add more people to sort when running it.

Additional Stuff:
The program "employee-sort-location.rb" can be used to import a CSV file containing a header of "name,location" and a list of names,location. This can be used if employees are not all in the same location.
Testing this program:
  In order to execute, type "ruby employee-sort-location".

  You will be prompted, "Would you like to add another employee?"
    Enter "No"

  You will be prompted, "How many people would you like in each group?"
    Enter "8"

  You will receive a message something similar to, "Your groups have been sorted into groups1530502513.txt". This file will be in the folder that you're testing.

  Verify that this file contains the following:
  - Chicago – 5 groups of 8, 1 group of 1
  - San Francisco - 6 groups of 8, 1 group of 5
  - Other Locations - 1 group of 1
