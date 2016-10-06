require "loco/engine"
require "loco/helpers"
require "loco/config"
require "loco/broadcaster"
require "loco/sender"
require "loco/emitter"
require "loco/ws_connection_manager"

module Loco
  if Rails.version.to_f < 5
    class ApplicationCable
      class Channel
      end
    end
  end
end
