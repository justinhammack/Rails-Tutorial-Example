# encoding: UTF-8
# above line sets support for multi-byte characters

require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "index" do
    before do
      sign_in FactoryGirl.create(:user)
      visit users_path
    end

    it {should have_selector('title', text: 'All users')}

    describe "pagination" do
      before(:all)  {30.times {FactoryGirl.create(:user)}}
      after(:all)   {User.delete_all}

      it {should have_link('→')}
      it {should have_link('2')}
      it {should_not have_link('delete')}

      describe "as an admin user" do
        let(:admin) {FactoryGirl.create(:admin)}
        before do
          sign_in admin
          visit users_path
        end

        it {should have_link('delete', href: user_path(User.first))}
        it "should be able to delete another use" do
          expect {click_link('delete')}.to change(User, :count).by(-1)
        end
        it {should_not have_link('delete', href: user_path(admin))}
      end

      it "should list each user" do
        User.all[0..2].each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end
  end

  describe "Signup page" do
    before { visit signup_path }

    it { should have_selector('h1',     text: 'Sign up') }
    it { should have_selector('title',  text: full_title('Sign up'))}
  end

  describe "Profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',     text: user.name) }
    it { should have_selector('title',  text: user.name) }
  end

  describe "signup" do
    
    before { visit signup_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",               with: "Example User"
        fill_in "Email",              with: "user@example.com"
        fill_in "Password",           with: "cookie"
        fill_in "Confirm Password",   with: "cookie"
      end

      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button "Sign up" }
        let(:user) { User.find_by_email('user@example.com') }

        it {should have_selector('title', text: user.name) }
        it {should have_selector('div.flash.alert.alert-success', 
                                  text: 'Woohoo, new wine minion created!')}
        it {should have_link('Sign out')}
      end
    end

    describe "error messages" do
      before { click_button "Sign up" }

      let(:error) { 'errors found' }

      it { should have_selector('title', text: 'Sign up') }
      it { should have_content(error) }
    end
  end

  describe "edit" do
    let(:user) {FactoryGirl.create(:user)}
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it {should have_selector('h1',    text: "Edit user")}
      it {should have_selector('title', text: "Edit user")}
      it {should have_link('change', href: 'http://gravatar.com/emails')}
    end

    describe "with invalid information" do
      let(:error) {'1 error found'}
      before {click_button "Update"}

      it {should have_content(error)}
    end

    describe "with valid information" do
      let(:user)      {FactoryGirl.create(:user)}
      let(:new_name)  {"New Name"}
      let(:new_email) {"new@example.com"}
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Update"
      end

      it {should have_selector('title', text: new_name)}
      it {should have_selector('div.flash.alert.alert-success')}
      it {should have_link('Sign out', :href => signout_path)}
      specify {user.reload.name.should == new_name}
      specify {user.reload.email.should == new_email}
    end
  end
end
