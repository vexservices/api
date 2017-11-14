class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  mount_uploader :file, PictureUploader
  process_in_background :file

  validates :file, presence: true
end
