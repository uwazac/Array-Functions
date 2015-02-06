analyzeArrayData<-function(directory)
{
  setwd(directory)
  xSet<-ReadAffy()
  eset<-gcrma(xSet)
  return(eset)

}

arrayDesign<-function(eset, coeff=1, num=54675)
{
  design<-model.matrix(~ 0+factor(c(1,2,3,4,1,2,3,4,1,2,3,4,5,6,7,5,6,7,5,6,7)))
  colnames(design)<-c("T0_Cont", "T24_Cont", "T24_CD3", "T24_CD3CD28", "T4_Cont", "T4_CD3", "T4_CD3CD28")
  fit<-lmFit(eset, design)
  contrast.matrix<-makeContrasts(T24_CD3-T0_Cont, T24_CD3CD28-T24_CD3, levels=design)
fit2<-contrasts.fit(fit, contrast.matrix)
fit2<-eBayes(fit2)
myTopTable<-topTable(fit2, coef=coeff, number=num, adjust="BH", sort.by="logFC", p.value=1)
  return(myTopTable)
}

#cd3VScd28_4<-topTable(fit2, coef=1, number=54675, adjust="BH", sort.by="logFC", p.value=1)
                      
sortArray<-function(dataSetCSV)
  {
  if (class(dataSetCSV)=="ExpressionSet")
     {
    stop("invalid class argument specified")
  }
  
  write.csv(dataSetCSV, "tmp.csv")
  tmpOrder<-read.csv("tmp.csv")
  colnames(tmpOrder)<-"ProbeID"
  ordered<-sort(tmpOrder$ProbeID)
  mergeData<-merge(ordered, tmpOrder)
return(mergeData)
  
}


