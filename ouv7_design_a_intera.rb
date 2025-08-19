Ruby
require 'tk'

class InteractiveGamePrototypeNotifier
  def initialize
    @root = TkRoot.new { title "Game Notifier" }
    @label = TkLabel.new(@root) { text "Waiting for game updates..." }
    @label.pack
    @game_updates = []
    start_listening_for_updates
  end

  def start_listening_for_updates
    # Simulate game updates coming in every 2 seconds
    @update_timer = TkAfter.new(@root, 2000) do
      receive_update
    end
  end

  def receive_update
    # Simulate a game update
    update = "New level unlocked!"
    @game_updates << update
    update_label
  end

  def update_label
    @label.config text: "New updates! (#{@game_updates.size})"
  end

  def run
    @root.mainloop
  end
end

notifier = InteractiveGamePrototypeNotifier.new
notifier.run