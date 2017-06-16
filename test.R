
# read text file with all points and tiles
data<-read.table("/Users/ir30fyca/Downloads/Tiles_Martin.txt",header=T)
attach(data)

# iterate over all points
for(i in 1:nrow(data)){
  
  print(paste("Starting point: ",i," out of ",nrow(data),sep=""))
  
  # get observed month, year and tile id
  month_obs<-Month[i]
  year_obs<-Year[i]
  tile<-Tile[i]
  
  #vector with extisting dates for that tile (path to tile id)
  yr_list <- list.files(paste("/Users/ir30fyca/Downloads/",tile,sep=""))
  
    # list of available dates for that tile
    for(j in 1:length(yr_list)){
      
      # transform day of year into date to get month and year
      day_of_year<-substr(yr_list[j],6,8)
      x <- paste(as.character(year_obs),day_of_year,sep="")
      y<-strptime(x, format="%Y %j")
      month<-as.numeric(format(y, "%m"))
      
      # if the file correspond to the right month/year combination, copied to somewhere else
      if(month==month_obs){
        file.copy(paste("/Users/ir30fyca/Downloads/",j,sep=""), "/Users/ir30fyca/Desktop/")
      }
      
    }
}

