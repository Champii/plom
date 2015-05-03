Nodulator = require 'nodulator'
Server = require './server'

Socket = require 'nodulator-socket'
Account = require 'nodulator-account'

Nodulator.Use Socket
Nodulator.Use Account

Server.Init()
