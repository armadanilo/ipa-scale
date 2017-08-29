module Fastlane
  module Helper
    class IpaScaleHelper
      # class methods that you define here become available in your action
      # as `Helper::IpaScaleHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the ipa_scale plugin helper!")
      end
    end
  end
end
