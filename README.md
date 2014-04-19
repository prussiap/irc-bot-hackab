#HACKLAB IRC BOT

##FrontDoorAnnouncer

To announce a new person entering the Hacklab, you may append a string
of the person you'd like to announce to the file named
'append_name_to_announce.txt' (Clever yes?)

Example:

    ruby -I. ./ruby_irc_bot.rb
    echo 'Stan' >> append_name_to_announce.txt

Should result in the bot announcing into the #Hacklab chat:

    [01:09:59]  <hello_there> Stan just walked into the Hacklab! Hi there!
