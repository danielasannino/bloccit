require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
 let(:topic) { Topic.new(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
 let(:title) { RandomData.random_sentence }
 let(:body) { RandomData.random_paragraph }
 let(:price) { RandomData.random_price }
 let(:sponsored_post) { topic.sponsored_posts.new(title: title, body: body, price: price) }

 describe "attributes" do
   it "should respond to title" do
     expect(sponsored_post).to respond_to(:title)
   end
   it "should respond to body" do
     expect(sponsored_post).to respond_to(:body)
   end
   it "should respond to price" do
     expect(sponsored_post).to respond_to(:price)
   end
 end
end
