createMatrixfromGSE<-function()
{
GSEdataSet<-readline("Please enter the GSE data set identifier: ")

if(findPack("limma")==FALSE)
{
  library("limma")
}
else if (findPack("affy")==FALSE)
{
  library("affy")
}
else if (findPack("GEOquery")==FALSE)
{
  library("GEOquery")
}

geoSet<-suppressWarnings(getGEO(GSEdataSet, GSEMatrix=FALSE))
gsmplatforms<-lapply(GSMList(geoSet), function(x) {Meta(x)$platform})
probesets<-Table(GPLList(geoSet)[[1]])$ID
data.matrix<-do.call("cbind", lapply(GSMList(geoSet), function(x)
{tab<-Table(x)
mymatch<-match(probesets,tab$ID_REF)
return(tab$VALUE[mymatch])
}))
data.matrix<-apply(data.matrix,2,function(x){as.numeric(as.character(x))})
data.matrix<-log2(data.matrix)
require(Biobase)
rownames(data.matrix)<-probesets
colnames(data.matrix)<-names(GSMList(geoSet))
pdata<-data.frame(samples=names(GSMList(geoSet)))
rownames(pdata)<-names(GSMList(geoSet))
pheno<-as(pdata, "AnnotatedDataFrame")
eset2<-new("ExpressionSet", exprs=data.matrix, phenoData=pheno)
return(eset2)
}

findPack<-function(packString)
{
  packString<-paste("package:",sep="", packString)
  for(i in 1:length(search()))
  {
    if(packString==search()[i])
    {
      return(TRUE)
      break
    }
      }
    return(FALSE)  
    
  }
