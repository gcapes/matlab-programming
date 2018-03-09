# matlab-programming
Programming in MATLAB (worked examples)

---

[Register for the course](https://app.manchester.ac.uk/rmatlabpro)

[Leave feedback](https://docs.google.com/forms/d/e/1FAIpQLSdfpd8QuG9SPAehY5PBJ7AQdbH_eQcDL0UNbS2Oqs6960BTww/viewform?usp=pp_url&entry.1427428485&entry.1759822899&entry.1444288709=Programming+in+MATLAB&entry.1409009513&entry.160472735&entry.2083518247&entry.92324155)

Open the [slideshow](https://gcapes.github.io/matlab-programming/)

---

# Learning objectives

## Recap:
- Understand different number types
- Be aware of automatic (silent) type casting
- Understand the purpose of scripts (automating the command prompt) and functions
- Understand how to use flow control

## How-to:
- Be able to write your own scripts and functions, by breaking problems down into steps using
	- flowcharts
	- pseudo-code
	- comments to explain your intentions
- Know how to load data from a directory of text files using a loop
- Understand how to process data in the workspace:
	- extract sub-sets of data
	- basic statistics
	- remove bad data points (spikes, drop-outs, implausible values)
- Be able to save plots to disk
- Be able to import a screenshot of a graph from a paper, then plot your data on top
- Know how to modify trace appearance using figure handle and GUI
	- know about `File > Generate code...` to get script for existing figure
- Be able to average data onto new time base for comparision
- Understand how to use the debugger to:
	- set break points and inspect the value of variables
	- evaluate small sections of code at a time

## Tips and common problems:
- Load data window remains open after loading data (looks like nothing has happened if maximised)
- Close MATLAB - no prompt to save workspace variables; only modified scripts


## Good practice:
- Comments
- Assertions
- Version control
- Coding style for readability
	- indentation
	- capital letters for matrices e.g. M, A
	- varable naming conventions e.g. isLogical, camelCaseNames, loop variables
- Be aware of techniques to improve efficiency:
	- pre-allocate arrays
	- vectorisation
	- use built-in functions
	- column-wise ordering
	- further reading: [awesome-matlab], particularly [clean and fast] and [vectorisation]

[awesome-matlab]: https://github.com/mikecroucher/awesome-MATLAB
[clean and fast]: http://uk.mathworks.com/matlabcentral/fileexchange/22943-guidelines-for-writing-clean-and-fast-code-in-matlab
[vectorisation]: http://www-h.eng.cam.ac.uk/help/tpl/programs/Matlab/tricks.html
