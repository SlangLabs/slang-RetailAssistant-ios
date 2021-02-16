# Slang Retail Assistant for iOS

This repository contains releases for the Slang Retail Assistant for iOS SDK. These releases can be installed using Swift Package Manager or CocoaPods as you prefer.

### Swift Package Manager

You can add Slang Retail Assistant for iOS by adding the `https://github.com/SlangLabs/slang-retailAssistant-ios` repository as a Swift Package. 
    
### CocoaPods

It's easy to install the Voice framework if you manage your dependencies using [CocoaPods](http://cocoapods.org). Simply add the following to your `Podfile`:

~~~.rb
source 'https://github.com/SlangLabs/cocoapod-specs.git'

target 'TARGET_NAME' do
  use_frameworks!

  pod 'SlangRetailAssistant', '~> 1.0.0'
end
~~~

Then run `pod install --verbose` to install the dependencies to your project.
## Usage Instructions
- Import SlangRetailAssistant
~~~.rb
import slang_retail_assistant
~~~

- Initialize the SlangRetailAssistant
~~~.rb
SlangRetailAssistant.initialize(
  "<AssistantId>",
  apiKey: "<APIKey>"
)
~~~

- Perform the translation operation via the translate API
~~~.rb
let locale: Locale = Locale.init(identifier: "hi-IN")
SlangRetailAssistant.translateText(
  "टमाटर",
  sourceLocale: locale,
  targetLocale: Locale(identifier: "en-IN")) {
  (translatedText, error)  in
    if error != nil {
        print(error)
         return
    }
    if let translatedText = translatedText {
        print(translatedText)
    }
}
~~~

<br/>

## License
Copyright (c) 2017-2019 Slang Labs Private Limited. All rights reserved.
