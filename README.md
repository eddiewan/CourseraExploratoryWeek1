# Read me

This repository contains 4 R files creating 4 different plots.

#Plot 1
Creates a red bar chart of the global active power (in kilowatts)

#Plot 2
Creates a line graph over two days of the global active power (in kilowatts).

#Plot 3
Creates a plot with three line graphs (sub metering 1, 2 and 3) over a timeframe of two days.

#Plot 4
Creates 4 plots (2x2) of the previous three plots and one additional plot with the voltage.


## Data
For each plot, a separate file is created.
In each file the data is read after which two dates are selected (1-2-2007 and 2-2-2007).
Based on these two dates, the following transformations have been made:
- plot 1: convert global active power to kilowatts by casting it to a numeric
- plot 2: create a datetime variable by combining the date and the time
- plot 3: create the same datetime variable as stated before
- plot 4: merge all variables as created before

All of the plots are stored as a 480x480 png file in separate files.
