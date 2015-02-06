makeDesign<-function()
{
  #Initialize variables
  numberofreplicates=0
  numberofconditions=0
  numberoftimepoints=0
  
  numberofconditions<-readline("Please enter the number of conditions: ")
  numberofreplicates<-readline("Please enter the number of replicates: ")
  numberoftimepoints<-readline("Please enter the number of time points: ")
  
  numberofconditions<-as.numeric(numberofconditions)
  numberofreplicates<-as.numeric(numberofreplicates)
  numberoftimepoints<-as.numeric(numberoftimepoints)
  
  myDesignFactor<-factor(1:(numberofconditions+numberoftimepoints))
  myDesignMatrix<-matrix(myDesignFactor, ncol=(numberofconditions+numberoftimepoints), nrow=(numberofreplicates*numberoftimepoints))
  myDesignFrame<-as.data.frame(myDesignMatrix)
  return(myDesignFrame)  
}
