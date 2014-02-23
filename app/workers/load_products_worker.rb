require 'httpclient'
require "open-uri"

class LoadProductsWorker
  include Sidekiq::Worker
  # include Sidetiq::Schedulable

  sidekiq_options queue: :products

  def perform id_garage

    garage = Garage.find(id_garage)
    logger.info "-- Loading products for #{garage.name}"
    url = URI.parse("http://gsapi.local/product/#{garage.name}")
    open(url) do |http|
      response = JSON.parse http.read
      response.each do |g|
        create_product(garage, g)
      end
    end

  end

  def create_product garage, product
    logger.info "-- Creating product #{product['nome']}"
    prod = garage.products.create(
      name: product['nome'],
      description: product['descricao'],
      value: product['valorEsperado'],
      currency: product['currency'],
      tags: product[''],
      status: product['idEstado'],
      link: product['link'],
      tags: ['loading']
      )
    fotos = product['fotos']
    if fotos
      logger.info "-- Loading #{fotos.size} photos"
      fotos.each do |fff|
        a = fff
        b = a['caminho'] if a['caminho']
        c = b['original'] if b['original']
        d = c.gsub("http://photos.easylikethat.com","")
        e = "/Users/pedroivobgimenes/Documents/gsapp-images/originals20140222#{d}"
        if File.file?(e)
          logger.info "-- Creating image #{d}"
          prod.medias.create(image: open(e)) 
        end
        prod.save
        # a = fff
        # b = a['caminho'] if a['caminho']
        # c = b['original'] if b['original']
        # if c 
        #   httpc = HTTPClient.new
        #   resp = httpc.get(c)
        #   url = resp.header['Location']
        #   prod.medias.create(image: open(url[0]))
        # end
      end
    end
  end

end
