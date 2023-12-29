# frozen_string_literal: true

require_relative '../meta'

module Engine
  module Game
    module GRustBelt
      module Meta
        include Game::Meta

        GAME_TITLE = 'Age of Steam: Rust Belt'
        GAME_DESIGNER = 'John Bohrer'

        PLAYER_RANGE = [3, 6].freeze
      end
    end
  end
end
