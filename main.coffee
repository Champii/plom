Nodulator = require 'nodulator'
Server = require './server'

Socket = require 'nodulator-socket'
Assets = require 'nodulator-assets'
Account = require 'nodulator-account'

Nodulator.Use Socket
Nodulator.Use Assets
Nodulator.Use Account

Server.Init()
Nodulator.Run()
