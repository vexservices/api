module CachesHelper
  def cache_key_for_records(name, records)
    count          = records.try(:count)
    max_updated_at = records.maximum(:updated_at).try(:utc).try(:to_s, :number)

    "#{name}/#{current_corporate.try(:id)}-#{count}-#{max_updated_at}"
  end

  def cache_key_for_message_store(store, device, resource = 'message_store')
    updated_at = device.try(:updated_at).try(:utc).try(:to_s, :number)

    "#{resource}/#{current_corporate.try(:id)}-#{store.try(:id)}-#{device.try(:id)}-#{updated_at}"
  end

  def cache_key_for_message_stores(stores)
    count          = stores.try(:count)
    max_updated_at = stores.maximum(:updated_at).try(:utc).try(:to_s, :number)

    "message_stores/#{current_corporate.try(:id)}-#{count}-#{max_updated_at}"
  end

  def cache_key_for_super_departments(departments)
    count          = departments.try(:count)
    max_updated_at = departments.maximum(:updated_at).try(:utc).try(:to_s, :number)

    "super_departments/#{current_corporate.try(:id)}-#{count}-#{max_updated_at}"
  end
end
