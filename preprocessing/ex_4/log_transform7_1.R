setwd("/home/whb17/Documents/project3/project_files/preprocessing/ex_7/")

#Initial datasets

df.all.body <- read.csv("../../data/ex_7/gene_prot_data_body.csv", header=TRUE, row.names = 1)
df.gene.body <- read.csv("../../data/ex_7/gene_data_body.csv", header=TRUE, row.names = 1)
df.prot.body <- read.csv("../../data/ex_7/prot_data_body.csv", header=TRUE, row.names = 1)

# Normalised datasets

df.all.body.wn <- read.csv("../../data/ex_7/gene_prot_data_body_wn.csv", header=TRUE, row.names = 1)
df.gene.body.wn <- read.csv("../../data/ex_7/gene_data_body_wn.csv", header=TRUE, row.names = 1)
df.prot.body.wn <- read.csv("../../data/ex_7/prot_data_body_wn.csv", header=TRUE, row.names = 1)


datasets <- list(
  list(df.gene.body, "gene", "gene")
  ,
  list(df.prot.body, "protein", "prot")
  ,
  list(df.all.body, "complete", "gene_prot")
  ,
  list(df.gene.body.wn, "normalised gene", "gene_wn")
  ,
  list(df.prot.body.wn, "normalised protein", "prot_wn")
  ,
  list(df.all.body.wn, "normalised complete", "gene_prot_wn")
)

for (i in 1:length(datasets)){
  data <- datasets[[i]][[1]]
  verbose <- datasets[[i]][[2]]
  abbrv <- datasets[[i]][[3]]
  
  if (min(data) < 0){
  
    mostneg <- min(data)
  
    data.corr <- data + abs(mostneg)
  
    data.corr.logged <- log(data.corr)
    
    print(paste(verbose, " data were corrected and log transformed", sep=""))
    
    write.csv(data.corr.logged, file=paste("../../data/ex_7/", abbrv, "_data_body_corr_lt.csv", sep=""), row.names=TRUE)
    
  } else{
  
    data.logged <- log(data)
    
    print(paste(verbose, " data were log transformed but not corrected", sep=""))
    
    write.csv(data.logged, file=paste("../../data/ex_7/", abbrv, "_data_body_lt.csv", sep=""), row.names=TRUE)
  }
}
