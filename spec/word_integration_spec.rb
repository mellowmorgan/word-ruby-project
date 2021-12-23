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

describe('delete a word', {:type => :feature}) do
  it('delete word and no longer show up on homepage') do
    visit('/home')
    click_on("ruby")
    click_on("Edit/Delete Word")
    click_on("Delete")
    expect(page).to have_no_content('ruby')
  end
end 

describe('update word', {:type => :feature}) do
  it('update ruby to red') do
    visit('/home')
    fill_in('word', :with => 'ruby')
    click_on("Add Word")
    click_on("ruby")
    click_on("Edit/Delete Word")
    fill_in("new_term", :with => "red")
    click_on("Update")
    expect(page).to have_content('red')
  end
end 

describe('update definition', {:type => :feature}) do
  it('update definition of red') do
    visit('/home')
    click_on("red")
    fill_in("definition", :with => "an object-oriented programming language")
    click_on("Add Definition")
    click_on("an object-oriented programming language")
    fill_in("new_def", :with => "the color of blood")
    click_on("Update")
    expect(page).to have_content('blood')
  end
end 

describe('delete definition', {:type => :feature}) do
  it('delete definition color of blood') do
    visit('/home')
    click_on("red")
    click_on("the color of blood")
    click_on("Delete")
    expect(page).to have_no_content('blood')
  end
end 




