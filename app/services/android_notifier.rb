class AndroidNotifier
  def self.send_push(key, tokens, title = 'Virtual Exchange', msg = 'New Product')
    options = { 'data' => { 'title' => title, 'message' => msg} }

    gcm = GCM.new(key)
    gcm.send_notification(tokens, options)
  end
end
