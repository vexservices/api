class PushMessageWorker
  include Sidekiq::Worker
  #sidekiq_options queue: "push notification"

  def perform(message_id)
    message   = Message.find(message_id)
    store     = message.store
    corporate = store.root
    app       = corporate.app

    devices = Device.with_token.joins(:user).where(users: { store_id: [store.id, corporate.id] })

    send_android_notification(app, devices)
    send_ios_notification(app, devices)
  end

  private

  def send_android_notification(app, devices)
    return unless app.has_google_api_key?

    android_devices = devices.android.pluck(:push_token)

    AndroidNotifier.send_push(app.google_api_key, android_devices, app.name, 'You have new message.')
  end

  def send_ios_notification(app, devices)
    return unless app.has_apple_certificate?

    ios_devices = devices.ios.pluck(:push_token)

    if Rails.env.production? || Rails.env.staging?
      path_or_url = app.apple_certificate.url
    end

    path_or_url ||= app.apple_certificate.path

    ios_devices.each do |token|
      IosNotifier.send_push(path_or_url, token, 'You have new message.')
    end
  end
end
