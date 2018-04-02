#!/bin/bash

DIR=/home/hubot/hubot/bin/hubot
export HUBOT_SLACK_TOKEN=xxxxxxxxxxxx
export DOCOMO_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxx
$DIR --name hubot --adapter slack

