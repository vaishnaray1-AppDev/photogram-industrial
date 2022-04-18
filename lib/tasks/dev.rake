task sample_data: :environment do
  p "Creating sample data"

  '''12.times do 
    fname = Faker::Name.first_name.downcase
    u = User.create(
        email: "#{fname}@example.com",
        username: fname,
        password: "password",
        private: [true,false].sample
    )'''

    fr = FollowRequest.create(
      recipient_id: User.ids[1],
      sender_id: User.ids[2]

    )

    users = User.all 

    '''users.each do |first_user|
      users.each do |second_user|
        if rand < 0.75
          first_user.sent_follow_requests.create(
            recipient: second_user,
            status: FollowRequest.statuses.keys.sample
          ) 
        end 

        if rand < 0.75
          second_user.sent_follow_requests.create(
            recipient: first_user,
            status: FollowRequest.statuses.keys.sample
          ) 
        end 
      end

    end '''

    users.each do |user|
      rand(15).times do
      photo = user.own_photos.create(
                                    caption: "Hi", image: "https://www.some.url/ofimage.jpg"
                                     )
      user.followers.each do |follower|
        if rand < 0.5 
          photo.fans << follower
        end
        
        if rand <0.25
          photo.comments.create(
            body: "this is a comment",
            author: follower
          )
        end
      end
    end

    end

  

  
  p "#{User.count} users have been created."
  p "#{FollowRequest.count} follow requests have been created."
  p "#{Photo.count} photos have been created."
  p "#{Like.count} likes have been created."
  p "#{Comment.count} comments have been created."
end