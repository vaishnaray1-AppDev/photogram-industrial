task sample_data: :environment do
  p "Creating sample data"

  

    FollowRequest.delete_all
    Comment.delete_all
    Like.delete_all
    Photo.delete_all
    User.delete_all

    
    
    usernames = []
    rand(15).times do
        usernames.append(Faker::Name.first_name.downcase)
    end
    


    usernames.each do |username|
    
      User.create(
          email: "#{username}@example.com",
          username: username.downcase,
          password: "password",
          private: [true,false].sample
      )
    end



    users = User.all 

    users.each do |first_user|
      users.each do |second_user|
            if first_user.username != second_user.username
              if rand < 0.75 
                first_user.sent_follow_requests.create(
                  recipient: second_user,
                  status: FollowRequest.statuses.keys.sample
                ) 
              else
                second_user.sent_follow_requests.create(
                  recipient: first_user,
                  status: FollowRequest.statuses.keys.sample
                ) 
              end 

              

      
            end
      end

    end 

    users.each do |user|
      rand(15).times do
        photo = user.own_photos.create(
                                      caption: Faker::Quote.jack_handey, image: Faker::Avatar.image
                                      )
                              
        user.followers.each do |follower|
          if rand < 0.5 
            photo.fans << follower
          end
          
          if rand <0.25
            photo.comments.create(
              body: Faker::Quote.jack_handey,
              author: follower
            )
          end
        end
      end

    end



  

  
  p usernames
  p "#{User.count} users have been created."
  p "#{FollowRequest.count} follow requests have been created."
  p "#{Photo.count} photos have been created."
  p "#{Like.count} likes have been created."
  p "#{Comment.count} comments have been created."
end