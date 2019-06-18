FactoryBot.define do
  factory :document do
    after(:build) do |document|
      document.file.attach(io: File.open(Rails.root.join('spec', 'factories', 'attachments', 'dash_icon.png')), filename: 'dash_icon.png', content_type: 'image/png')
    end
  end
end
