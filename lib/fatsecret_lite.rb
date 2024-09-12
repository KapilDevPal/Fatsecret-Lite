# lib/fatsecret_lite.rb
require "oauth2"
require "rest-client"
require "json"

module FatsecretLite
  class Configuration
    attr_accessor :client_id, :client_secret

    def initialize
      @client_id = nil
      @client_secret = nil
    end
  end

  @configuration = Configuration.new

  class << self
    def configure
      yield(@configuration) if block_given?
    end

    def configuration
      @configuration
    end

    def get_access_token
      raise "Client ID and Client Secret must be configured" unless configuration.client_id && configuration.client_secret

      client = OAuth2::Client.new(
        configuration.client_id,
        configuration.client_secret,
        site: 'https://platform.fatsecret.com/rest/server.api',
        token_url: 'https://oauth.fatsecret.com/connect/token'
      )

      token = client.client_credentials.get_token
      token.token
    end

    def get_food_details(food_id)
      access_token = get_access_token

      response = RestClient.post(
        'https://platform.fatsecret.com/rest/server.api',
        {
          method: 'food.get.v4',
          food_id: food_id,
          include_food_images: true,
          include_food_attributes: true,
          format: 'json'
        },
        {
          content_type: :json,
          Authorization: "Bearer #{access_token}"
        }
      )

      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      puts "Error: #{e.response}"
    rescue StandardError => e
      puts "An error occurred: #{e.message}"
    end

    # find food id by barcode
    def find_food_by_barcode(barcode)
      access_token = get_access_token

      response = RestClient.post(
        'https://platform.fatsecret.com/rest/server.api',
        {
          method: 'food.find_id_for_barcode',
          barcode: barcode,
          format: 'json'
        },
        {
          content_type: :json,
          Authorization: "Bearer #{access_token}"
        }
      )

      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      puts "Error: #{e.response}"
    rescue StandardError => e
      puts "An error occurred: #{e.message}"
    end

    def find_food_by_search(search_value, max_results= 10)
        access_token = get_access_token

        response = RestClient.post(
          'https://platform.fatsecret.com/rest/server.api',
          {
            method: 'foods.search.v3',
            max_results: max_results,
            search_expression: search_value,
            format: 'json'
          },
          {
            content_type: :json,
            Authorization: "Bearer #{access_token}"
          }
        )

        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        puts "Error: #{e.response}"
      rescue StandardError => e
        puts "An error occurred: #{e.message}"
      end
  end
end
