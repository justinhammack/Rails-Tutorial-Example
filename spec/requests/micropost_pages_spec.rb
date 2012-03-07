require 'spec_helper'

describe "Micropost Pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do
      
      it "should not create a micropost" do
        expect { click_button "Update" }.should_not change(Micropost, :count)
      end

      describe "error messages" do
        let(:error) { 'Oops! 1 error found' }
        before { click_button "Update" }
        it { should have_content(error) }
      end
    end

    describe "with valid information" do
      
      before { fill_in 'micropost_content', with: "Lore ipsum" }
      it "should create a micropost" do
        expect { click_button "Update" }.should change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.should change(Micropost, :count).by(-1)
      end
    end
  end
end
