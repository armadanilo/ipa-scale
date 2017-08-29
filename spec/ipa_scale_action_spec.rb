describe Fastlane::Actions::IpaScaleAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ipa_scale plugin is working!")

      Fastlane::Actions::IpaScaleAction.run(nil)
    end
  end
end
