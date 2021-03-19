corr<-function(directory, threshold=0){

  #Get the complete cases data
  ccdata<-complete(directory)
  
  #Select the monitors(rows) that pass the threshold
  overt<-ccdata[ccdata$nobs>threshold,]
  
  #set up an empty vector for correlation data 
  corsn<-c()
  
  #list all files in the directory
  dirpath<-paste(getwd(),"/",directory,"/",sep="")
  file_list <- list.files(dirpath)
    
  #for monitors that pass the threshold
  for(i in overt$id){
    filepath=paste(dirpath,file_list[i],sep="")
    temp_data <- read.csv(filepath)
    temp<-cor(temp_data["sulfate"],temp_data["nitrate"],use="complete.obs")
    corsn<-c(corsn,temp)
  }
  
  corsn
}