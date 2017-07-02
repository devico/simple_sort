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

  describe 'Column sorts by simple_sort' do
    let(:params) { { sort_column: column, sort_type: type_sort } }
    let(:column) { :id }
    
    context 'by ACS' do
      let(:type_sort) { 'asc' }
      
      it 'is valid' do
        expect(Post.simple_sort(params).pluck(:id)).to eq [3, 2, 1]
      end
    end

    context 'by DESC' do
      let(:type_sort) { 'desc' }

      it 'is valid' do
        expect(Post.simple_sort(params).pluck(:id)).to eq [1, 2, 3]
      end 
  end
  end
end
