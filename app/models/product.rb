class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, allow_blank: true, length: { minimum: 10 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|jpeg|png)\Z}i, # WHATIF :  URL doesnot link to picture but links to picture resource
    message: 'must be a URL with gif, jpg, jpeg or png extension'
  }

  def self.latest
    Product.order(:updated_at).last
  end

end
