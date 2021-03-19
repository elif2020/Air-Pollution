pollutantmean<-function(directory, pollutant, id=1:332){
  
  #create a list of the files from your target directory
  dirpath<-paste(getwd(),"/",directory,"/",sep="")
  file_list <- list.files(dirpath)
  
  #dataset<-lapply(file_list,function(x) read.csv(x)[[pollutant]])                        
  #initiate a blank data frame, each iteration of the loop will append 
  #the data from the given file to this variable
  dataset <- data.frame()
  
  for (i in id){
    filepath=paste(getwd(),"/",directory,"/",file_list[i],sep="")
    temp_data <- read.csv(filepath) 
  #each file will be read in 
  
   dataset <- rbind(dataset, temp_data) 
  #for each iteration, bind the new data to the building dataset
  }
  
  #pollu<-unlist(dataset)
  mean(dataset[[pollutant]],na.rm=TRUE)
}