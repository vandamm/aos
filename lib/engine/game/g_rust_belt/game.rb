# frozen_string_literal: true

require_relative 'meta'
require_relative 'map'
require_relative '../aos/base'

module Engine
  module Game
    module GRustBelt
      class Game < Game::BaseAoS
        include_meta(GRustBelt::Meta)

        include Map

        CURRENCY_FORMAT_STR = '$%s'
        BANK_CASH = 9999
        STARTING_CASH = 10
        CAPITALIZATION = :full

        MARKET = [].freeze
        CERT_LIMIT = 99
        PHASES = [
          {
            name: '1',
            train_limit: 1,
            tiles: [:yellow],
            operating_rounds: 2,
          }
        ].freeze
        TRAINS = [].freeze

      end
    end
  end
end
