require 'redis'

class MessagesController < ApplicationController
  def initialize
    @redis = Redis.new(host: ENV['REDIS_HOST'] || 'localhost', port: ENV['REDIS_PORT'] || 6379)
  end

  def index
    @message = params[:message]

  end

  def create
    number = params[:number].to_i
    ExternalNumber.create(number: number)
    redirect_to root_path
  end

  def check_number
    number_to_check = params[:number_to_check].to_i
    cache_key = "number_#{number_to_check}"

    if (cached_result = @redis.get(cache_key))
      message = "From Cache: Number #{number_to_check} #{cached_result} in the database."
    else
      exists = ExternalNumber.exists?(number: number_to_check)
      message = "From DB: Number #{number_to_check} #{exists ? 'exists' : 'does not exist'} in the database."
      @redis.set(cache_key, exists ? 'exists' : 'does not exist')
      @redis.expire(cache_key, 60)  # Cache expires in 60 seconds
    end

    redirect_to root_path(message: message)
  end

end
