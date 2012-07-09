
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
  end

  #EXAMPLE: how to define a QRCode to be printed
  #def qrcode
  		#@qr = RQRCode::QRCode.new('hello world')
  #end


end
