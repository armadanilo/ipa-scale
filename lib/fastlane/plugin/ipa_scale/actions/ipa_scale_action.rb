module Fastlane
  module Actions
    module SharedValues
      IPA_SIZE_CHECK_CUSTOM_VALUE = :IPA_SIZE_CHECK_CUSTOM_VALUE
    end

    class IpaScaleAction < Action
      def self.run(params)
        UI.message "⚖️ Path to IPA: #{params[:path_to_ipa]}"
        ipa_limit = params[:ipa_limit].to_f || 100.0
        ipa_size = (File.size((params[:path_to_ipa]).to_s).to_f / 2**20).round(2)
        if ipa_size >= ipa_limit
          UI.user_error!(" ❗️  IPA size exceeded #{ipa_limit}MB limit - #{ipa_size}MB!")
          false
        elsif ipa_size >= (ipa_limit - 5.0)
          UI.error(" ⚠️   IPA size dangerously close to #{ipa_limit}MB limit - #{ipa_size}MB!")
          true
        else
          UI.message(" ⚖️   IPA size is safe from your #{ipa_limit}MB limit - #{ipa_size}MB!")
          true
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "⚖️ Checks the size of your built .ipa and warns you if you you are near the given threshold."
      end

      def self.details
        "This is meant to be called after your gym step as a CI tool to let you know if your latest changes have made your .ipa larger than your desired limit.🚦 If you exceed your limit, the build will fail. If you are within 5MB of your limit, we will simply warn you but not force fail the build. Otherwise, we will tell you the .ipa size and nothing else!"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path_to_ipa,
                                      env_name: "FL_IPA_SIZE_CHECK_IPA_PATH",
                                      description: "IPA path for IpaSizeCheckAction",
                                      verify_block: proc do |value|
                                        UI.user_error!("Couldn't find file at path '#{path_to_ipa}'") unless File.exist?(value)
                                      end),
          FastlaneCore::ConfigItem.new(key: :ipa_limit,
                                       env_name: "FL_IPA_SIZE_CHECK_IPA_LIMIT",
                                       description: "IPA limit for IpaSizeCheckAction",
                                       verify_block: proc do |value|
                                         begin
                                            UI.user_error!("#{ipa_limit} is not a string") unless String(value)
                                          rescue
                                            nil
                                          end
                                       end)
        ]
      end

      def self.output
        [
          ['FL_IPA_SIZE_CHECK_IPA_PATH', 'Path to .ipa'],
          ['FL_IPA_SIZE_CHECK_IPA_LIMIT', 'Set limit threshold']
        ]
      end

      def self.return_value
        "Returns `true` if the IPA is <= given limit, otherwise returns false."
      end

      def self.authors
        ["Danilo Caetano - Github: UIGuigo, Twitter: @armadill"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
