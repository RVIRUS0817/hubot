module.exports = (robot) ->
  robot.respond /time in (.*)/i, (msg) ->
    unless process.env.HUBOT_WWO_API_KEY
      msg.send 'Please, set HUBOT_WWO_API_KEY environment variable'
      return
    unless process.env.HUBOT_WWO_API_URL
      msg.send 'Please, set HUBOT_WWO_API_URL environment variable'
      return
    msg.http(process.env.HUBOT_WWO_API_URL)
      .query({
        q: msg.match[1]
        key: process.env.HUBOT_WWO_API_KEY
        format: 'json'
      })
      .get() (err, res, body) ->
        try
          result = JSON.parse(body)['data']
          city = result['request'][0]['query']
          currentTime = result['time_zone'][0]['localtime'].slice 11
          msg.send "Current time in #{city} ==> #{currentTime}"
        catch error
          msg.send "Sorry, no city found. Please, check your input and try it again"

