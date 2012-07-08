
#Controller for the QRCode llibrary

class StaticPagesController < ApplicationController
	require 'rqrcode'
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def tagit
    respond_to do |format|
      format.html
      @qr = format.svg { render :qrcode => "http://helloworld.com", :size => 4 }
      #format.png { render :qrcode => "http://helloworld.com", :size => 4 }
    end
  end

  def qrcode
  		@qr = RQRCode::QRCode.new('hello world')
  end


end
