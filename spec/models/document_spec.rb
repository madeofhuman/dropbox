require "rails_helper"

RSpec.describe Document, :type => :model do
  context "without any attached file" do
    it "doesn't create a link for the file" do
      document = Document.create!
      expect { Rails.application.routes.url_helpers.rails_blob_path(document.file, only_path: true) }.
        to raise_error(Module::DelegationError, 'signed_id delegated to attachment, but attachment is nil')
    end
  end

  context "with an attached file" do
    it "creates a link for the file" do
      document = Document.create!
      document.file.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'attachments', 'dash_icon.png')),
        filename: 'dash_icon.png',
        content_type: 'application/pdf'
      )
      expect(Rails.application.routes.url_helpers.rails_blob_path(document.file, only_path: true)).
        to include(document.file.filename.to_s)
    end
  end
end
