class AboutPagesController < ApplicationController
  def index
    
    @about_pages_landing = PageDatum.where(navigation_location: 'about_pages_landing').order(dataid: :desc).first
    @about_pages_content = PageDatum.where(navigation_location: 'about_pages').order(sort: :asc)
    
  end
  def about_faq_pages
    @about_pages_image = PageDatum.where(navigation_location: 'about_pages_image_text').order(dataid: :desc).first
    @faq = FrequentlyAskedQuestion.order(sort: :asc)
  end
end
