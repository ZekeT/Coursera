>getwd() 
#current working directory

>setwd("dir")
#sets dir as working directory

>dir.create("directoryname")
#creates a directory in the current working directory

>file.create("mytest.R")
#creates a file "mytest.R"

>dir.create("testdir2/testdir3", recursive = TRUE)
#Create a directory and a subdirectory in the new directory

>unlink("testdir2", recursive = TRUE)
#Delete the "testdir2" directory

>file.exists("mytest.R")
#check if file is in current working directory

>file.info("mytest.R")
#return information about the file "mytest.R"

>file.rename("mytest.R","mytest2.R")
#Change the name of the file "mytest.R" to "mytest2.R"

>file.copy("mytest2.R","mytest3.R")
#Make a copy of "mytest2.R" called "mytest3.R"

>file.path("mytest3.R")
#Provide the full path to the file "mytest3.R"

>ls()
#List all the objects in your local workspace

>list.files()
#List all the files in your working directory

>num_vect <- c(0.5,55,-10,6)
#create a numeric vector num_vect that contains the values 0.5, 55, -10, and 6

>paste(my_char, collapse = " ")
#returns "My name is"

>paste("Hello", "world!", sep = " ")
#separate the joined elements with a single space