Dataset_1<- read.csv("D:\\Projects\\Dataset\\Sample Dataset of a ride sharing app (Data).csv", header=TRUE)
View(Dataset_1)
colSums(Dataset_1 != 0)
#hashed_id                rider_id               driver_id                    fare 
#5085                    5085                    3682                    2394 
#estimated_fare           ride_duration estimated_ride_duration           ride_distance 
#5085                      NA                    5085                      NA 
#estimated_ride_distance                  status                  rating           drivers_tried 
#5070                    5085                      NA                    5085 
#undiscounted_fare        review_requested                discount             canceled_by 
#NA                      24                      NA                      NA 
#payment_type                       X                     X.1 
#5085                      NA                      NA 