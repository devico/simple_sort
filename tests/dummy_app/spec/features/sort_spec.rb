require 'rails_helper'

feature 'Sort column', %q{
  In table of posts user can 
} do 

  before do
    3.times { FactoryGirl.create(:post) }
    visit posts_path
  end
  
  scenario 'sort desc by id column' do
    click_on 'Id'
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(1) > td:nth-child(1)", :text => "3", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(2) > td:nth-child(1)", :text => "2", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(3) > td:nth-child(1)", :text => "1", :visible => false )
  end

  scenario 'sort asc by id column' do
    click_on 'Id'
    click_on 'Id'
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(1) > td:nth-child(1)", :text => "1", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(2) > td:nth-child(1)", :text => "2", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(3) > td:nth-child(1)", :text => "3", :visible => false )
  end 

  scenario 'sort desc by title column' do
    click_on 'Title'
    save_and_open_page
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(1) > td:nth-child(2)", :text => "Post 9", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(2) > td:nth-child(2)", :text => "Post 8", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(3) > td:nth-child(2)", :text => "Post 7", :visible => false )
  end

  scenario 'sort asc by title column' do
    click_on 'Title'
    click_on 'Title'
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(1) > td:nth-child(2)", :text => "Post 10", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(2) > td:nth-child(2)", :text => "Post 11", :visible => false )
    expect(page).to have_css("#middle > div > table > tbody > tr:nth-child(3) > td:nth-child(2)", :text => "Post 12", :visible => false )
  end
end
