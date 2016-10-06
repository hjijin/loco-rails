module Loco
  class Broadcaster
    attr_reader :obj, :event, :recipients, :data, :notifications

    def initialize obj, event = nil, opts = {}
      @obj = obj
      @event = event
      @recipients = opts[:for] ? [*opts[:for]] : [nil]
      @data = opts[:data]
      @notifications = []
    end

    def signals; notifications end

    def prepare
      init_notifications if notifications.empty?
      notifications.each do |notification|
        notification.prepare
      end
    end

    def emit
      init_notifications if notifications.empty?
      notifications.each do |notification|
        notification.save!
        if notification.recipient_id # TODO: here!
          recipient = notification.recipient_class.constantize.new id: notification.recipient_id
          SenderJob.perform_later recipient, loco: {notification: notification.compact}
        end
      end
    end

    private

      def init_notifications
        recipients.each do |recipient|
          @notifications << Notification.new({
            obj: obj,
            event: event,
            recipient: recipient,
            data: data
          })
        end
      end
  end
end