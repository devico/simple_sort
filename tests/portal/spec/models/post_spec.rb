require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'Sort posts using' do  
    before(:each) do
      3.times { FactoryGirl.create(:post) }
    end

    it 'method min to max' do
      expect(Post.min2max(:id).pluck(:id)).to eq [1, 2, 3]
    end

    it 'method max to min' do
      expect(Post.max2min(:id).pluck(:id)).to eq [3, 2, 1]
    end
  end

  describe 'Use simple_sort for sorting' do
    let(:params) { { sort_column: column, sort_type: type_sort } }
        
    describe 'column ID' do
      before(:each) do
        3.times { FactoryGirl.create(:post) }
      end
      let(:column) { :id }

      context ' by ACS' do
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

    describe 'column Title' do
      before(:each) do
        FactoryGirl.create(:post, title: 'Вы когда-нибудь получали телеграмму от своего сердца?')
        FactoryGirl.create(:post, title: 'Как избавиться от пятен…')
        FactoryGirl.create(:post, title: 'А ваш дом страдает от дефицита картин')
      end
      let(:column) { :title }

      context ' by ACS' do
        let(:type_sort) { 'asc' }
        
        it 'is valid' do
          expect(Post.simple_sort(params).pluck(:title).first).to eq('Как избавиться от пятен…')
        end
      end

      context 'by DESC' do
        let(:type_sort) { 'desc' }

        it 'is valid' do
          expect(Post.simple_sort(params).pluck(:title).first).to eq('А ваш дом страдает от дефицита картин')
        end 
      end  
    end
  end
end
