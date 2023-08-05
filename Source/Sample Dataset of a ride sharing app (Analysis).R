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


plot(Dataset_1$estimated_ride_distance, Dataset_1$estimated_fare)
plot(Dataset_1$estimated_ride_duration, Dataset_1$estimated_fare)

# There is a linear relation indicates that the fare is dependent on ride distance and ride duration. 
# We can also determine correlation coefficients to understand which variables effect the fare most.But first lets add
# some new columns like
#	First of all, we recoded the status variable (1=COMPLETED, 2= CANCELED) and named the variable status_rec.
#	Then we analyzed the driver_id variable and found that 1403 cells are empty so we added a new variable 
#    driver_assigned (1 = driver_id available, 0= driver_id cell is empty).
#	Analyzing the variable canceled_by, we added another variable canceled_by_type (0= trip was completed, 
#    1= rider_id, 2=driver_id, 3=system cancel). And read the dataset again.

Correlation_matrix<- data.frame(cor(Dataset_1[,c("fare", "estimated_fare", "estimated_ride_duration",
                  "estimated_ride_distance","canceled_by_type", "driver_assigned", "status_rec")]))
view(Correlation_matrix)


#                        fare estimated_fare estimated_ride_duration estimated_ride_distance canceled_by_type
#fare                     1.0000000     0.29125377            0.3337597602              0.34430360    -0.6680798732
#estimated_fare           0.2912538     1.00000000            0.8795054423              0.91350197     0.0879046014
#estimated_ride_duration  0.3337598     0.87950544            1.0000000000              0.95162120    -0.0003479046
#estimated_ride_distance  0.3443036     0.91350197            0.9516211963              1.00000000    -0.0127741359
#canceled_by_type        -0.6680799     0.08790460           -0.0003479046             -0.01277414     1.0000000000
#driver_assigned          0.1760921    -0.13975509           -0.1174742051             -0.11385952    -0.2697112166
#status_rec              -0.8245116     0.03943109           -0.0476437019             -0.04458027     0.8102734795
#driver_assigned  status_rec
#fare                          0.1760921 -0.82451159
#estimated_fare               -0.1397551  0.03943109
#estimated_ride_duration      -0.1174742 -0.04764370
#estimated_ride_distance      -0.1138595 -0.04458027
#canceled_by_type             -0.2697112  0.81027348
#driver_assigned               1.0000000 -0.21357136
#status_rec                   -0.2135714  1.00000000

# correlation_matrix is also added
#From the correlation matrix, it is clear that the status of a trip has a strong positive correlation with 
#canceled_by_type and a strong negative correlation with fare. The correlation between status_rec and 
#driver_assigned is also negative but moderate. So these three are the important factors in the case of 
#reliability. Also, canceled_by_type has a strong negative relationship with driver_assigned.

# Finally we can conduct a t test to compare the fare and estimated fare.

summary(Dataset_1$estimated_fare)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#30.0    90.0   121.0   126.3   154.0   665.0 

 t.test(Dataset_1$fare, mu = 126.3, alternative = "less")

#One Sample t-test

#data:  Dataset_1$fare
#t = -96.454, df = 5084, p-value < 2.2e-16
#alternative hypothesis: true mean is less than 126.3
#95 percent confidence interval:
#  -Inf 47.47169
#sample estimates:
#  mean of x 
#46.10383 

# Overall, the analysis suggests that users are not facing significant overcharges.