#' Search terms globally
#'
#' @param terms List of terms to search
#' @param filename name prefix for excel output
#' @return An excel sheet named filename_US.xlsx with sheets interest_over_time, interest_by_country, interest_by_dma, interest_by_city, related_topics, related_queries
#' @examples
#' searchGlobe(c("Trump", "Biden"), "politics" )


searchGlobe<- function(terms, filename) {
  library(gtrendsR)
  library(readxl)
  library(dplyr)
  library(xlsx)



  globaltrends<- lapply(terms, function(word){
    gtrends(keyword = word, geo = "", time = "all")
  })
  che<- globaltrends[[1]]
  ##get interest over time only
  iot<- lapply(globaltrends, function(df){
    df$interest_over_time
  })
  overtime<- do.call(rbind, iot)

  ##get interest over region only
  country<- lapply(globaltrends, function(df){
    df$interest_by_country
  })
  icountry<- do.call(rbind, country)

  ##DMA
  dma<- lapply(globaltrends, function(df){
    df$interest_by_dma
  })
  idma<- do.call(rbind, dma)

  ##CITY
  city<- lapply(globaltrends, function(df){
    df$interest_by_city
  })
  icity<- do.call(rbind, city)

  ##Related Topics
  related<- lapply(globaltrends, function(df){
    df$related_topics
  })
  irelated<- do.call(rbind, related)

  ##Related Queries
  relatedq<- lapply(globaltrends, function(df){
    df$related_queries
  })
  irelatedq<- do.call(rbind, relatedq)
  irelatedq<-irelatedq %>% select(-category)

  write.xlsx(overtime, file=paste0(filename, "_global.xlsx"), sheetName="interest_over_time", row.names=FALSE)
  write.xlsx(icountry, file=paste0(filename, "_global.xlsx"), sheetName="interest_by_country", append=TRUE, row.names=FALSE)

  write.xlsx(idma, file=paste0(filename, "_global.xlsx"), sheetName="interest_by_dma", append=TRUE, row.names=FALSE)
  write.xlsx(icity, file=paste0(filename, "_global.xlsx"), sheetName="interest_by_city", append=TRUE, row.names=FALSE)
  write.xlsx(irelated, file=paste0(filename, "_global.xlsx"), sheetName="related_topics", append=TRUE, row.names=FALSE)
  write.xlsx(irelatedq, file=paste0(filename, "_global.xlsx"), sheetName="related_queries", append=TRUE, row.names=FALSE)


}




