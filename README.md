# ipa_scale plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-ipa_scale)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-ipa_scale`, add it to your project by running:

```bash
fastlane add_plugin ipa_scale
```

## About ipa_scale

Checks the size of your built .ipa and warns you if you you are near the given threshold.

This is meant to be called after `gym` has finished building and signing your application to let you know if your latest changes have made your .ipa larger than your desired limit. This was made with the idea of keeping your application from getting above the 100.0 MB cellular network download limit!

🚦 If you exceed your limit, the build will fail. If you are within 5MB of your limit, we will simply warn you but not force fail the build. Otherwise, we will tell you the .ipa size and nothing else!


## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

Simply include this within your desired lane, like so
```
desc "Builds your .ipa!"
lane :custom_build do
  clean_build_artifacts
  clear_derived_data
  gym(
    output_directory: "./build/",
    export_method: "app-store",
    output_name: "my-ios-app",
    scheme: "MyApp",
  )
  ipa_size_check(
    path_to_ipa: "./build/my-ios-app.ipa"
    ipa_limit: "100.0"
  )
end
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
