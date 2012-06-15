require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the h1 'The application home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'The application home')
    end
  
    it "should have the base title" do
       visit '/static_pages/home'
       page.should have_selector('title',
                      :text => "EtiquetAR")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
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


describe "Contact page" do

      it "should have the content 'Contact etiquetAR'" do
        visit '/static_pages/contact'
        page.should have_selector('h1', 
                      :text => 'Contact the team of etiquetAR')
      end

      it "should have the right title 'Contact'" do
       visit '/static_pages/contact'
       page.should have_selector('title',
                      :text => "Contact")
       end
    end


end