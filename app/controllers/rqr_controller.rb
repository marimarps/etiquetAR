class RqrodeController < ApplicationController
  def rqrcode
    @qr = RQRCode::QRCode.new('hello world')
  end
end
