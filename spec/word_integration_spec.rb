require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a word', {:type => :feature}) do
  it('home page should display word term after adding word') do
    visit('/home')
    fill_in('word', :with => 'ruby')
    click_on("Add Word")
    expect(page).to have_content('ruby')
  end
end
describe('add a definition for word ruby', {:type => :feature}) do
  it('word page should show definition after adding') do
    visit('/home')
    click_on("ruby")
    fill_in('definition', :with => 'a color that is hot and fiery')
    click_on("Add Definition")
    expect(page).to have_content('hot and fiery')
  end
end
# describe('add a definition for word ruby', {:type => :feature}) do
#   it('word page should show definition after adding') do
#     visit('/home')
#     click_on("ruby")
#     fill_in('definition', :with => 'a color that is hot and fiery')
#     click_on("Add Definition")
#     expect(page).to have_content('hot and fiery')
#   end
# end

