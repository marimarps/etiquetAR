require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the h1 'Home'" do
      visit home_path
      page.should have_selector('h1', :text => 'Home')
    end
  
    it "should have the base title" do
       visit home_path
       page.should have_selector('title',
                      :text => "EtiquetAR")
    end

    it "should not have a custom page title" do
      visit home_path
      page.should_not have_selector('title', :text => '| Home')
    end

  end


  describe "Help page" do

      it "should have the content 'The application help'" do
        visit help_path
       page.should have_selector('h1', 
                      :text => 'The application help')
      end

      it "should have the right title 'Help'" do
      visit help_path
      page.should have_selector('title',
                      :text => "Help")
    end
  end


  describe "About page" do

      it "should have the content 'About etiquetAR'" do
        visit about_path
        page.should have_selector('h1', 
                      :text => 'The about of etiquetAR')
      end

      it "should have the right title 'About'" do
       visit about_path
       page.should have_selector('title',
                      :text => "About")
       end
    end


describe "Contact page" do

      it "should have the content 'Contact etiquetAR'" do
        visit contact_path
        page.should have_selector('h1', 
                      :text => 'Contact the team of etiquetAR')
      end

      it "should have the right title 'Contact'" do
       visit contact_path
       page.should have_selector('title',
                      :text => "Contact")
       end
    end


end