class PagesController < ApplicationController
  def pdf
    pdf = Rails.root.join('public/pdf/noe-stauffert.pdf')
    send_file(pdf, filename: 'noe-stauffert.pdf', type: 'application/pdf', disposition: :inline)
  end
end
