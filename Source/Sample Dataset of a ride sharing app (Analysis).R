Dataset_1<- read.csv("D:\\Projects\\Dataset\\Sample Dataset of a ride sharing app (Data).csv", header=TRUE)
View(Dataset_1)

Dataset_1$rating <- as.character(Dataset_1$rating)
Dataset_1$payment_type <- as.character(Dataset_1$payment_type)
Dataset_1$canceled_by <- as.character(Dataset_1$canceled_by)
Dataset_1$rider_id <- as.character(Dataset_1$rider_id)
Dataset_1$driver_id <- as.character(Dataset_1$driver_id)

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

freq(Dataset_1)
