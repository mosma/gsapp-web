require 'httpclient'
require "open-uri"

class LoadGaragesWorker
  include Sidekiq::Worker
  # include Sidetiq::Schedulable

  sidekiq_options queue: :garages

  def perform
    logger.info "- Loading API for all garages"
    url = URI.parse('http://gsapi.local/stats/all_garages')
    open(url) do |http|
      response = JSON.parse http.read
      response.each do |g|
        logger.info "- Loading garage #{g['id_pessoa']}"
        create_garage(g)
      end
    end
    ""
    # %w.InoDuo sbking Alexander Middlesex Expresso..each do |garage|
    #   logger.info "- Loading garage #{garage}"
    #   url = URI.parse("http://api.garagesaleapp.me/garage/#{garage}")
    #   open(url) do |http|
    #     response = JSON.parse http.read
    #       create_garage(response)
    #   end
    #   ""
    # end
  end

  def create_garage info
    
    user = User.find_or_initialize_by email: info['email']

    loc = info['localization']
    lat = 0
    log = 0
    if loc
      lat = loc.split(',').first
      log = loc.split(',').last
    end
    
    user.email = info['email']
    user.name = info['nome']
    #user.locale: info['lang'],
    user.password = '123123123' #info['senha']
    user.save

    #TODO deal with facebook connect

    if user.garage.nil?
      user.create_garage(
        name: info['garagem'],
        description: info['about'],
        link: info['link'],
        tags: [],
        status: 2,
        latitude: lat,
        longitude: log,
        street: info['address'],
        city: info['city'],
        state: info['district'],
        country: info['country']
      )
      logger.info "- Created garage: #{info['garagem']}, starting product worker"
      LoadProductsWorker.perform_async(user.garage.id)
    else
      logger.info "- Not loading this garage, already exists"
    end


    ""
  end


end
