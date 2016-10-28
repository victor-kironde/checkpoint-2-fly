require 'spec_helper'

describe "User Pages" do
  describe "show users" do
    describe "all" do
      before do
        25.times { |i| create(:user)}
        visit '/users'
      end

        #it { should have_content('List of users')}
        scenario "expect text 'List of users'" do
          expect(page).to have_content "List of users"
        end
        #it { should have_content ('25 users') }

        it "should show all users" do
          User.all.each do |user|
            should have_selector('li', text: user.name)
            should have_selector('li', text: user.email)
          end


        end
    end
  end
end
