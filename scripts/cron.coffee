cron = require('cron').CronJob;
module.exports = (robot) ->

  new cron '00 19 * * 1-5', () =>
      robot.send {room: "#infra_sre"}, "@here 日報書いてねえの！？ https://twitter.com/chanmedesu/status/748653069999575044"
    , null, true, "Asia/Tokyo"

  new cron '30 16 * * 1-5', () =>
      robot.send {room: "#infra_sre"}, "@here 進捗どうですか！ https://pbs.twimg.com/media/CoKluQDUkAEmMEF.jpg"
    , null, true, "Asia/Tokyo"


