report.html: Code/render_report.R report.Rmd Raw_Data/f75_interim.csv Output/mosaic_plot.rds Output/box_plot1.png Output/box_plot2.png Output/table_one.rds
	Rscript Code/render_report.R
	
Output/mosaic_plot.rds: Code/Yingte.R Raw_Data/f75_interim.csv
	Rscript Code/Yingte.R

#! TO DO:
#! add a rule to create the output of boxplot
Output/box_plot1.png: Code/Guadalupe.R Raw_Data/f75_interim.csv
	Rscript Code/Guadalupe.R
	
Output/box_plot2.png: Code/Guadalupe.R Raw_Data/f75_interim.csv
	Rscript Code/Guadalupe.R

#! TO DO:
#! add a rule to create the output of descriptive table
Output/table_one.rds: Code/Jiali.R Raw_Data/f75_interim.csv
	Rscript Code/Jiali.R

#! TO DO:
#! add a PHONY target for removing .rds files
#! from the output1/2/3 directories
.PHONY: clean
clean:
	rm Output/*.rds && rm Output/*.png 