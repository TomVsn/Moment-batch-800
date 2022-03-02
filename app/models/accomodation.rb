require "open-uri"
require "nokogiri"
require "watir"
require "headless"

class Accomodation < ApplicationRecord
  belongs_to :trip
  has_many :accomodation_votes
  validates :url, presence: true

  after_validation :scrap_appartment, if: :will_save_change_to_url?

  def set_defaults
    self.confirmed ||= false
    self.picked ||= false
  end

  def scrap_appartment
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto self.url
    sleep 5
    doc = Nokogiri::HTML(browser.html)
    title_element = doc.search("h1")
    self.title = title_element[0].text.strip
    img_element = doc.search(".photo-grid__photo")
    self.img = img_element[0]["src"]
    price_element = doc.search(".rental-price__amount")
    pr = price_element[0].text.strip
    pr = pr.split(',')
    pr[1] = pr[1].split(' ')
    pr[1] = pr[1][0]
    pr = pr.join('.')
    self.price = pr.to_f
    # self.price = price_element[0].text.strip
    address_element = doc.search(".Description--location")
    self.address = address_element[0].text.strip
    # appartment = { name: name, address: address, img: img, price: price }
    # return appartment
  end
end
