dataFrameSubset <-
function(data, colnam, colval)
{
  #generate a subset of a data frame based on the value of a particular column in the frame
  dataFrameSubsetter<-data[with(data, data[,colnam]==colval),]
  return(dataFrameSubsetter)
}
