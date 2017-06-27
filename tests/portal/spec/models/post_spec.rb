require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    3.times { FactoryGirl.create(:post) }
  end

  it 'has to sort from min to max' do
    expect(Post.min2max(:id).pluck(:id)).to eq [1, 2, 3]
  end

  it 'has to sort from max to min' do
    expect(Post.max2min(:id).pluck(:id)).to eq [3, 2, 1]
  end
end
