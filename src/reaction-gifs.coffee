# Description
#   Show random reactiongif from imgur's reactiongif's archive: http://reactiongifsarchive.imgur.com/
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_IMGUR_CLIENTID - your client id from imgur
#
# Commands:
#   hubot reactgif nope - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif child fail - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif fuck - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif disgust - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif excited - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif clapping - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif stfu - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif angry - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif not bad - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif popcorn - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif haters - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif no read - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif mind blown - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif wut - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif cool story - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif umad - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif deal with it - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif no fucks - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif laughing - get random gif from reactiongifarchives.imgur.com
#   hubot reactgif self inflict - get random gif from reactiongifarchives.imgur.com
#
# Author:
#   mbesto

token = "Client-ID #{process.env.HUBOT_IMGUR_CLIENTID}"
unless process.env.HUBOT_IMGUR_CLIENTID
  throw "You must set HUBOT_IMGUR_CLIENTID in your environment vairables"

api_url = "https://api.imgur.com/3/album/"

module.exports = (robot) ->
  robot.hear /reactgif (.+)/i, (msg) ->
    switch msg.match[1]
      when "nope" then album = "JNzjB"
      when "child fail" then album = "Oc5Gp"
      when "fuck" then album = "aYJkp"
      when "disgust" then album = "AXues"
      when "excited" then album = "1GOKT"
      when "clapping" then album = "NzuZS"
      when "stfu" then album = "FGIfa"
      when "angry" then album = "qfkyX"
      when "not bad" then album = "LoNV2"
      when "popcorn" then album = "LPRbU"
      when "haters" then album = "yGacg"
      when "no read" then album = "tVg8K"
      when "mind blown" then album = "FEnwc"
      when "wut" then album = "ywmyw"
      when "cool story" then album = "yIdY2"
      when "umad" then album = "zKaIL"
      when "deal with it" then album = "K21Ft"
      when "no fucks" then album = "cB34U"
      when "laughing" then album = "s16Zv"
      when "self inflict" then album = "VvMv5"
      else "fail"
    full_url = api_url + album
    msg.http(full_url).headers('Authorization': token).get() (err, res, body) ->
      if res.statusCode is 200
        data = JSON.parse body
        msg.send data.data.images[Math.floor(Math.random() * data.data.images.length)].link
      else
        console.error "imgur-info script error: #{full_url} returned #{res.statusCode}: #{body}"
