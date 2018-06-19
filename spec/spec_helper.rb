# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'

Hanami.boot

require 'database_cleaner'
DatabaseCleaner.strategy = :transaction
conn = Testbed::Container['testbed.rom'].gateways[:default].connection
DatabaseCleaner[:sequel, connection: conn]
