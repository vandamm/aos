# frozen_string_literal: true

require_relative '../base'

module Engine
  module Game
    class BaseAoS < Base
      # 1. SharesRound
      # 2. TurnOrderAuctionRound
      # 3. ActionSelectionRound
      # 4. BuildingRound
      # 5. ShippingRound
      # - Receive Income
      # - Pay Expenses
      # - Income Reduction
      # - Goods Growth
      # - Next Turn (Game End)

      def setup_preround
        @phase_counter = 1
      end

      def num_phases
        5
      end

      def next_phase
        @phase_counter += 1
        return unless @phase_counter > num_phases

        @phase_counter = 1
        @turn += 1
      end

      def next_round!
        @round =
          case @round
          when Round::Shares
            new_turn_order_round
          when Round::TurnOrderAuction
            new_action_selection_round
          when Round::ActionSelection
            new_build_round
          when Round::Build
            new_shipping_round
          when Round::Shipping
            income_phase
            goods_growth_phase
            new_shares_round
          end
      end

      # Display:
      # Goods Display
      # Shares display?
      # Locomotive Power?
      # Income Track?

      # Track ownership markers T_T
    end
  end
end
