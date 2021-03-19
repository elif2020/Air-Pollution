complete<-function(directory,id=1:332){
  #create a list of the files from your target directory
  dirpath<-paste(getwd(),"/",directory,"/",sep="")
  file_list <- list.files(dirpath)
  
  nvalidc<-c()
  
  for(i in id){
    filepath=paste(dirpath,file_list[i],sep="")
    temp_data <- read.csv(filepath)
    isvalid<-complete.cases(temp_data)
    sumcc<-sum(isvalid)
    nvalidc<-c(nvalidc,sumcc)
  }
  ccdata<-data.frame("id" = id,
                     "nobs" = nvalidc)
  ccdata
}