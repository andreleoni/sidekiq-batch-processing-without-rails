require "csv"
require "json"
require "sidekiq"

class MyWorker
  include Sidekiq::Worker

  def perform
    200.times do |i|
      AddToFile.perform_async(i)
    end
  end
end
