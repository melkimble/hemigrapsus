check_lib<- function(LibraryList) {
  # Expects list, e.g., LibraryList<-c("stringr","dplyr","rstudioapi")
  for (TheLibrary in LibraryList)
  {
    # check if libraries are installed, if not install them
    if(TheLibrary %in% rownames(installed.packages()) == FALSE) install.packages(TheLibrary)
  }
  # load libraries
  library(TheLibrary,character.only=TRUE)
}

install_or_load_pack <- function(pack){
  # https://nhsrcommunity.com/blog/a-simple-function-to-install-and-load-packages-in-r/
  # Swapped to this code, works better
  # install_or_load_pack(pack)
  # pack: expects list of libraries, e.g., pack<-c("tidyverse","tm","wordcloud","ggwordcloud","topicmodels")
  create_pkg <- pack[!(pack %in% installed.packages()[, "Package"])]
  if (length(create_pkg))
    install.packages(create_pkg, dependencies = TRUE)
  sapply(pack, require, character.only = TRUE)
}

load_pack <- function(pack){
  # load_pack(pack)
  # pack: expects list of libraries, e.g., pack<-c("tidyverse","tm","wordcloud","ggwordcloud","topicmodels")
  sapply(pack, require, character.only = TRUE)
}