class Message < ActiveRecord::Base
  scope :by_store,  -> { where(kind: 2) }
  scope :by_device, -> { where(kind: 1) }
  scope :unread,    -> { where(read_at: nil) }
  scope :of_store,  ->(id) { where(store_id: id) }
  scope :of_device, ->(id) { where(device_id: id) }

  belongs_to :store,  touch: true
  belongs_to :device, touch: true

  validates :message, presence: true

  after_create :send_push

  def self.device_unread_count
    by_device.unread.count
  end

  private

    def send_push
      PushMessageWorker.perform_async(self.id)
    end
end
