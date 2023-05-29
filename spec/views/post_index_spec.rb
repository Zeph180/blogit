require 'rails_helper'
RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Brazil.', postscounter: 0)
    @first_post = Post.create(title: 'Hello there', text: 'This is my first post',
                              commentscounter: 0, likescounter: 0, author_id: @user.id)
    @first_post.save
    Comment.create(text: 'Hi Lillian!', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'How are you?', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'You know Rails', author_id: @user.id, post_id: @first_post.id)
    visit user_posts_path(@user)
  end
end
