require 'cinch'
require 'front_door_announcer'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "hello_there"
    c.server = "irc.freenode.org"
    c.channels = ["#hacklab"]
    c.plugins.plugins = [FrontDoorAnnouncer]
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end

  on :message, "foo" do |m|
    m.reply "Bar, Be more original #{m.user.nick}"
  end

end

Thread.new { DoorbellListener.new(bot).start }
bot.start

