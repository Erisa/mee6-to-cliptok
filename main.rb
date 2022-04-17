require 'redis'
require 'json'

redis = Redis.new(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'])

warning_id = -1

ENV['PAGES'].to_i.times do |count|
    filedata = File.read("input/page #{count}.json")
    data = JSON.parse(filedata)

    data['infractions'].each do |infraction|
        new_warning = {
            "targetUserId" => infraction['user_id'],
            "modUserId" => infraction['author_id'],
            "warningId" => warning_id,
            "warnReason" => infraction['reason'],
            "warnTimestamp" => Time.at(infraction['created_at']).utc.strftime("%FT%T%:z"),
            "contextLink" => "https://discord.com/channels/150662382874525696/793285213823172628/965378153784705064"
        }.to_json

        puts "Inserting warning #{warning_id} for #{infraction['user_id']}"
        redis.hset(infraction['user_id'], warning_id, new_warning)
        warning_id -= 1
    end

end
