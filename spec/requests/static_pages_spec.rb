require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'The application home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'The application home')
    end
  
    it "should have the right title 'Home'" do
       visit '/static_pages/home'
       page.should have_selector('title',
                      :text => "Home")
    end
  end


  describe "Help page" do

      it "should have the content 'The application help'" do
        visit '/static_pages/help'
       page.should have_selector('h1', 
                      :text => 'The application help')
      end

      it "should have the right title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                      :text => "Help")
    end
  end


  describe "About page" do

      it "should have the content 'About etiquetAR'" do
        visit '/static_pages/about'
        page.should have_selector('h1', 
                      :text => 'The about of etiquetAR')
      end

      it "should have the right title 'About'" do
       visit '/static_pages/about'
       page.should have_selector('title',
                      :text => "About")
       end
    end

end