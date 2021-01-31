#' Search terms USA
#'
#' @param terms List of terms to search
#' @param filename name prefix for excel output
#' @return An excel sheet named filename_US.xlsx with sheets interest_over_time, interest_by_region, interest_by_dma, interest_by_city, related_topics, related_queries
#' @examples
#' searchUS(c("Trump", "Biden"), "politics" )
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

searchUS <- function(terms, filename) {
  library(gtrendsR)
  library(readxl)
  library(dplyr)

  trends<- lapply(terms, function(word){
    gtrends(keyword = word, geo = c("US"), time = "all")
  })

  ##get interest over time only
  iot<- lapply(trends, function(df){
    df$interest_over_time
  })
  overtime<- do.call(rbind, iot)

  ##get interest over region only
  region<- lapply(trends, function(df){
    df$interest_by_region
  })
  iregion<- do.call(rbind, region)

  ##DMA
  dma<- lapply(trends, function(df){
    df$interest_by_dma
  })
  idma<- do.call(rbind, dma)

  ##CITY
  city<- lapply(trends, function(df){
    df$interest_by_city
  })
  icity<- do.call(rbind, city)

  ##Related Topics
  related<- lapply(trends, function(df){
    df$related_topics
  })
  irelated<- do.call(rbind, related)

  ##Related Queries
  relatedq<- lapply(trends, function(df){
    df$related_queries
  })
  irelatedq<- do.call(rbind, relatedq)
  #install.packages("xlsx")
  library(xlsx)
  write.xlsx(overtime, file=paste0(filename, "_US.xlsx"), sheetName="interest_over_time", row.names=FALSE)
  write.xlsx(iregion, file=paste0(filename, "_US.xlsx"), sheetName="interest_by_region", append=TRUE, row.names=FALSE)
  write.xlsx(idma, file=paste0(filename, "_US.xlsx"), sheetName="interest_by_dma", append=TRUE, row.names=FALSE)
  write.xlsx(icity, file=paste0(filename, "_US.xlsx"), sheetName="interest_by_city", append=TRUE, row.names=FALSE)
  write.xlsx(irelated, file=paste0(filename, "_US.xlsx"), sheetName="related_topics", append=TRUE, row.names=FALSE)
  write.xlsx(irelatedq, file=paste0(filename, "_US.xlsx"), sheetName="related_queries", append=TRUE, row.names=FALSE)

}




