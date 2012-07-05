require 'spec_helper'

describe "StaticPages" do

subject {page}

  describe "Home page" do
  before { visit root_path } 

      it { should have_selector('h1', :text => 'etiquetAR')}
     #it { should have_selector('title', text: full_title('')) }
      it { should_not have_selector 'title', text: '| Home' }
  end


  describe "Help page" do
     before { visit help_path } 
      it { should have_selector('h1', :text => 'The application help')}
      it { should have_selector('title', :text => 'Help')}
  end


  describe "About page" do
    before { visit about_path } 
      it { should have_selector('h1', :text => 'The about of etiquetAR')}
      it { should have_selector('title', :text => 'About')}
    end


describe "Contact page" do
  before { visit contact_path } 
      it { should have_selector('h1', :text => 'Contact the team of etiquetAR')}
      it { should have_selector('title', :text => 'Contact')}
 end


describe "Tag It page" do
  before { visit tagit_path } 
      it { should have_selector('h1', :text => 'Personalize, group and print your TAGS')}
      it { should have_selector('title', :text => 'Tag It!')}
 end



end