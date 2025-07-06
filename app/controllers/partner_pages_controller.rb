class PartnerPagesController < ApplicationController
  def index
     @partner_pages_header = PageDatum.where(navigation_location: 'partner_pages').order(dataid: :desc).first
     @partner_pages_landing = PageDatum.where(navigation_location: 'partner_pages_landing').order(dataid: :desc).first
  end
end
