foldCutOff<-function(arrayData, cutofflevel=2)
  {
# function to return a data frame of a subset of 
# microarray data above a specified fold change expression cutoff
  
  cutoff<-arrayData[arrayData$Fold_Change>cutofflevel,]
  return(cutoff)
  
  }

dataFrameSubset<-function(data, colnam, colval)
{
  #generate a subset of a data frame based on the value of a particular column in the frame
  dataFrameSubsetter<-data[with(data, data[,colnam]==colval),]
  return(dataFrameSubsetter)
}

loadArrayData<-function(directory)
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

totalMerge<-function(ArrayData, anotfile="~/Documents/Array Analyses/U133plus2annotation.csv", commonCol="ProbeID")
{
  #append gene names to files containing only affy probe IDs
  annotated<-read.csv(anotfile)
  total<-merge(ArrayData, annotated, by=commonCol)
  return(total)
}