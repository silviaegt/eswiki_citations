getwd()
# set working directory
#C:\Users\segutierrez\Dropbox\eswiki
setwd("/Users/segutierrez/Dropbox/eswiki")


eswiki <- read.table(file = 'eswiki.tsv', sep = '\t', header = TRUE, fill=TRUE, encoding = "UTF-8")
head(eswiki)
summary(eswiki)

libros <- eswiki[ which(eswiki$type=='isbn'), ]
View(libros)
summary(libros)
freqbooks <- sort(table(libros$id),decreasing=T)
View(freqbooks)

freqbooks[1:20,]
mtcars[1:5,] 


ids <- table(eswiki$id)
View(eswiki)

devtools::install_github("jayjacobs/tldextract")
library("tldextract")
library(plyr)

colmexlinks <- read.table(file = 'colmex_links.csv', header = TRUE, sep=",", fill=TRUE, encoding = "UTF-8")
View(colmexlinks)

host <- parse_url(colmexlinks$copia_links[1])$hostname
domain.info <- tldextract(host)
View(domain.info)

colmexurls <- list()

for (i in 1:length(colmexlinks$links)){
  host <- parse_url(colmexlinks$copia_links[i])$hostname
  colmexurls[[i]] <- host
}


freqlinks <- table(unlist(colmexurls))


write.csv(freqlinks, file = "freqlinkscolmex.csv", row.names=FALSE)



colmexlinks$url_base <- unlist(colmexurls)
clinks$links <- NULL
clinks <- rename(colmexlinks, c("copia_links"="link_completo", "Text.2.2"="articulo_wikipedia"))
clinks <- clinks[,c(3,2,1)]
View(clinks)
clinksdf <- data.frame(clinks)
View(clinksdf)
write.csv(clinksdf, file = "colmexlinks.csv", row.names=FALSE)

freqarticles <- sort(table(clinksdf$articulo_wikipedia),decreasing=T)
View(freqarticles)
domain.info <- tldextract(parse_url(colmexlinks$copia_links[1]))

