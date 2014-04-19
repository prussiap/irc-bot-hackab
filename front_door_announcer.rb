class FrontDoorAnnouncer
  include Cinch::Plugin

  HACKLAB_CHANNEL = '#hacklab'

  listen_to :new_visitor, method: :annouce_visitor
  def annouce_visitor(_, user)
    Channel(HACKLAB_CHANNEL).send "#{user} just walked into the Hacklab! Hi there!"
  end
end

class DoorbellListener

  DOORBELL_FILE = './append_name_to_announce.txt'

  def initialize(bot)
    @bot = bot
    create_listening_file
  end

  def start
    while true
      open(DOORBELL_FILE, 'r+') do |f|
        new_visitor = f.gets.chomp
        @bot.handlers.dispatch :new_visitor, nil, new_visitor
      end
    end
  end

  def create_listening_file
    unless File.exists? DOORBELL_FILE
      system "mkfifo #{DOORBELL_FILE}"
    end
  end
  private :create_listening_file

end

