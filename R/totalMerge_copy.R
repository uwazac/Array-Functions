totalMerge<-function(ArrayData, anotfile="~/Documents/Array Analyses/U133plus2annotation.csv", commonCol="ProbeID")
{
annotated<-read.csv(anotfile)
total<-merge(ArrayData, annotated, by=commonCol)
return(total)
}