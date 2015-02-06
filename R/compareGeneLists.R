#Compare two gene lists for shared probe IDs
compareGeneLists<-function(file1, file2)
{

  frame1<-read.csv(file1, as.is=1)
  frame2<-read.csv(file2, as.is=1)
  
  totalChar<-vector("character", length=dim(frame1)[1])
#Compare probe ID for those in common by iterating through the list one by one an checking for equality.
  for(j in 1:dim(frame1)[1]){
    
    testchar<-frame2[j,1]
  
  
  for (i in 1:dim(frame1)[1])
       {
    if(frame1[i,1]==testchar)
    {
      totalChar[i]=testchar    
    }
  
  }
  
      }
  #remove missing values from 
  for(y in 1:length(totalChar))
  {
    if(totalChar[y]=="")
    {
    totalChar[y]=NA_character_
    }
  }
 
  bad<-is.na(totalChar)
  totalChar<-totalChar[!bad]
  return(totalChar)
}
