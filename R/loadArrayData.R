loadArrayData <-function(directory)
{
  setwd(directory)
  filelist<-list.files(directory)
  len=length(filelist)
  #Create a vector of data frames containing array data
  totalData<-list()
  for ( i in 1:len)
  {
    totalData[[i]]<-read.csv(filelist[i])
  }
  return(totalData)
}
