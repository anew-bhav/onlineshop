require 'faker'

Product.delete_all

############### Create Seed for Product #################

IMAGE_URL   = "https://dummyimage.com/300x300/c6c8ee/a30b37&text=Test+Product"

20.times do
  Product.create!(
    title: Faker::Commerce.unique.product_name,
    description: %(<p>#{Faker::Lorem.unique.paragraph(3, true, 6)}</p>),
    image_url: IMAGE_URL,
    price: Faker::Commerce.unique.price)
end
#########################################################

