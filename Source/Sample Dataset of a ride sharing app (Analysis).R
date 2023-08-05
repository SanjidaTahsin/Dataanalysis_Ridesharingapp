# Reading the CSV file to conduct analysis in R naming it as Dataset_1.

Dataset_1<- read.csv("D:\\Projects\\Dataset\\Sample Dataset of a ride sharing app (Data).csv", header=TRUE)
View(Dataset_1)

#Converting the integers into characters for visualization.

Dataset_1$rating <- as.character(Dataset_1$rating)
Dataset_1$payment_type <- as.character(Dataset_1$payment_type)
Dataset_1$canceled_by <- as.character(Dataset_1$canceled_by)
Dataset_1$rider_id <- as.character(Dataset_1$rider_id)
Dataset_1$driver_id <- as.character(Dataset_1$driver_id)


#Counting the non empty cells from Dataset_1

colSums(Dataset_1 != 0)
#      hashed_id                rider_id               driver_id                    fare 
#5085                    5085                    3682                    2394 
#estimated_fare           ride_duration estimated_ride_duration           ride_distance 
#5085                      NA                    5085                      NA 
#estimated_ride_distance                  status                  rating           drivers_tried 
#5070                    5085                      NA                    5085 
#undiscounted_fare        review_requested                discount             canceled_by 
#NA                      24                      NA                      NA 
#payment_type 
#5085 
# checking the data type
str(Dataset_1)
#'data.frame':	5085 obs. of  17 variables:
 # $ hashed_id              : chr  "94B4KG" "94BJGE" "94D7KK" "94DPP1" ...
#$ rider_id               : chr  "557850" "887095" "4641532" "1026482" ...
#$ driver_id              : chr  "2322237" "7593297" "3624472" "1831387" ...
#$ fare                   : int  259 59 269 37 48 32 235 44 47 36 ...
#$ estimated_fare         : int  287 111 275 74 95 63 261 88 95 72 ...
#$ ride_duration          : int  2727 1622 6174 789 938 643 2931 1503 755 633 ...
#$ estimated_ride_duration: int  3188 934 2756 751 1122 707 2797 1187 819 703 ...
#$ ride_distance          : int  23868 4980 22972 3307 6466 3607 21591 5690 4790 2870 ...
#$ estimated_ride_distance: int  23868 4980 22945 3307 6466 3607 21591 5690 4790 2870 ...
#$ status                 : chr  "COMPLETED" "COMPLETED" "COMPLETED" "COMPLETED" ...
#$ rating                 : chr  "5" "5" NA "5" ...
# drivers_tried          : chr  "2322237," "127502,7824,7593297," "1498128,3624472," "204588,5157946,2652964,2636075,1831387," ...
#$ undiscounted_fare      : int  287 118 299 74 95 63 261 88 95 72 ...
#$ review_requested       : int  0 0 0 0 0 0 0 0 0 0 ...
#$ discount               : int  29 59 30 37 48 32 26 44 47 36 ...
#$ canceled_by            : chr  NA NA NA NA ...
#$ payment_type           : chr  "1" "1" "1" "1" ...


#using freq command to summarize the data.

freq(Dataset_1)

# the graphs obtained are shared.

# plot some more variables for clear understanding of the data

plot(density(Dataset_1$estimated_ride_duration), pch = 19, lwd = 3, main = "ride_duration")
plot(density(Dataset_1$estimated_fare), pch = 19, lwd = 3, main = "Estimated_fare")
plot(density(Dataset_1$estimated_ride_distance), pch = 19, lwd = 3, main = "ride_distance")

# clearly these variables are normally distributed. the graphs obtained are shared.
