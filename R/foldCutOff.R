foldCutOff <-
function(arrayData, cutofflevel=2)
  {
# function to return a data frame of a subset of 
# microarray data above a specified fold change expression cutoff
  
  cutoff<-arrayData[arrayData$Fold_Change>cutofflevel,]
  return(cutoff)
  
  }
