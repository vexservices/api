class Api::V1::MessagesController < Api::ApiController
  before_action :get_device!, :set_store

  after_action  :read_messages, only: [:unread]

  def index
    if @store
      @messages = @device.messages
                         .of_store(@store)
                         .order('created_at DESC')
                         .limit(26)

      @messages.unread.update_all(read_at: DateTime.now)
      @messages = @messages.to_a.sort_by(&:created_at)

      @device.try(:touch)
    else
      @stores = Store.with_messages(@device).limit(20)
    end
  end

  def show
    @message = @store.messages.find(params[:id])
  end

  def create
    @message = @device.messages.build(messages_params)
    @message.store = @store

    if @message.save
      render :show, id: @message.id, store_id: @store.id
    else
      render json: { success: false, errors: @message.errors, status: :unprocessable_entity }
    end
  end

  def unread
    @messages = @device.messages
                       .of_store(@store)
                       .unread
                       .by_store
  end

  private

    def set_store
      @store = Store.find(params[:store_id]) if params[:store_id]
    end

    def read_messages
      if @messages.any?
        @messages.update_all(read_at: DateTime.now)
        @device.try(:touch)
      end
    end

    def messages_params
      params.require(:message).permit(:message, :store_id)
    end
end
