Assignment 1: Integer Arithmetic
[A practice exercise not for credit]


Brief statement

Make a program that will compute the approximate area of a circle using only integers.


General statement

Make a program that will accept as input an integer representing the radius of a circle.  Compute the area of the circle with that radius.  The ancient Egyptians computed the value of π to be 22/7, which is a value composed of two integers.  With the technology of that time period this fraction was the best value they could compute for  π.  Use the egyptians value for  π to complete this assignment.

To be absolutely clear your program will use only integer data.  It will compute the area of a circular disk using the egyptian value of π.


Modular structure of the program








The C program eqyptian (main) calls the X86 program (area), but main does not pass any data to area.  “main” calls “area”; “main” does not send any data to “area”.  However, near the end of the execution “area” sends the whole number answer back to “main”.

Sample run

Welcome to your friendly area calculator.
The main program will now call the area function.
This area function is fondly brought to you by William Garcia.
Please enter the radius of a circle in whole number of meters:  6
The number 6 was received.
The area of a circle with this radius is 11 and 10/22 square meters.
The integer part of the area will be returned to the main program.  Please enjoy your circles.
The main received this integer: 11
Have a nice day.  Main will now return 0 to the operating system.



Another sample run

Welcome to your friendly area calculator.
The main program will now call the area function.
This area function is fondly brought to you by William Garcia.
Please enter the radius of a circle in whole number of meters:  10
The number 6 was received.
The area of a circle with this radius is 31 and 18/22 square meters.
The integer part of the area will be returned to the main program.  Please enjoy your circles.
The main received this integer: 31
Have a nice day.  Main will now return 0 to the operating system.



The text inside the rectangles is produced by the X86 function.  The text outside the rectangles is produced by the main function.  Often we refer to the main function as the “driver function”.  The driver function is not involved with the solution of the application problem other than to simpleycalled the function that solves the problem.

When you create this program replace the fake name shown above with your real name.

The file named run.sh is written in bash script language.  Its only purpose is to rapidly compile the two source files and run the program.

The word “program” refers to the collection of all 3 files.  Each of the individual files within the program may be called a “module” or a “function”.

Think of a name for each program you create in any course.  The name should be descriptive of what the program does, and the name should have reasonable length.  About 40 characters is an upper limit for the length of a program name.  Create a folder on your computer with the name of the program.  In that folder collect all files related to the program you are developing.
What to do when you are done

Test the program with small integer inputs such as 3, 4, 7, and 10.

Try to break the program: try entering 900 million, or even larger inputs.  The program has broke when it produces a junk answer.  For example, if the computed area is negative then it is broke (for that one input).  What is the largest integer radius your program can handle correctly?






