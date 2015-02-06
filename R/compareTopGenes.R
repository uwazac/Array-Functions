#Compare two gene lists for shared probe IDs
compareTopGenes<-function(data1=NULL, data2=NULL, fitArrayLM=NULL)
{
#   data1=NULL
#   data2=NULL
#   fitArrayLM=NULL
  
# data3<-readline("Please input the name of the 1st data set you would like to compare: ")
# data4<-readline("Please input the name of the 2nd data set you would like to compare: ")

  
  if ((is.data.frame(data1)==TRUE || is.data.frame(data2)==TRUE)&&class(fitArrayLM)!="MArrayLM")
  {
    frame1<-data1
    frame2<-data2
  }
  else if(class(fitArrayLM)!="MArrayLM")
  {  
    fitCols<-colnames(fit$design)
  }
  else
  {
  frame1<-read.csv(file1, as.is=1)
  frame2<-read.csv(file2, as.is=1)
  }
 #totalChar is a character vector that acts as container for making the comparison
  totalChar<-vector("character", length=dim(frame1)[1])
#Compare probe ID for those in common by iterating through the list one by one an checking for equality.
  for(j in 1:dim(frame1)["ProbeID"]){
    
    testchar<-frame2[j,"ProbeID"]
  
  
  for (i in 1:dim(frame1$ProbeID)
       {
    if(frame1[i,"ProbeID"]==testchar)
    {
      totalChar[i]=testchar    
    }
  
  }
  
      }
#count<-vector("numeric" length=length(totalChar))
  #remove missing values from 
  for(y in 1:length(totalChar))
  {
    if(totalChar[y]=="")
    {
    totalChar[y]=NA_character_
#     count[y]=y
    }
  }
 
  bad<-is.na(totalChar)
  totalChar<-totalChar[!bad]
  return(totalChar)
# print(data1)
# print(data2)
}
