require "csv"
require "json"
require "sidekiq"

class AddToFile
  FILE_NAME = "./mytest.csv"

  include Sidekiq::Worker

  def perform(i)
    CSV.open(FILE_NAME, "a", write_headers: false) do |writer|
      writer << i
    end
  end
end
