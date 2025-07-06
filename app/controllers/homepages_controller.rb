class HomepagesController < ApplicationController
  def index
    @home_page_content = PageDatum.where(navigation_location: 'home_pages').order(sort: :asc)
    @home_pages_expect = PageDatum.where(navigation_location: 'home_pages_expect').order(sort: :asc)
    @home_pages_landing1 = PageDatum.where(navigation_location: 'home_pages_landing1').order(dataid: :desc).first
    @home_pages_landing2 = PageDatum.where(navigation_location: 'home_pages_landing2').order(dataid: :desc).first


    
    
  end
end
