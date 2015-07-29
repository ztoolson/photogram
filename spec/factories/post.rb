FactoryGirl.define do
  factory :post do
    caption 'nofilter'
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/images/awesome-cat.jpg", 'image/jpg')
  end
end