# Slang Retail Assistant for iOS

This repository contains releases for the Slang Retail Assistant for iOS SDK. These releases can be installed using Swift Package Manager or CocoaPods as you prefer.

### Swift Package Manager

You can add Slang Retail Assistant for iOS by adding the `https://github.com/SlangLabs/slang-retail-assistant-ios` repository as a Swift Package. 
    
### CocoaPods

It's easy to install the Retail Assistant framework if you manage your dependencies using [CocoaPods](http://cocoapods.org). Simply add the following to your `Podfile`:

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
~~~.swift
import slang_retail_assistant
~~~

- Initialize the SlangRetailAssistant
~~~.swift
SlangRetailAssistant.initialize(
  "<AssistantId>",
  apiKey: "<APIKey>",
  environment: .staging //Change this to .production once you've published the Assistant to production environment
)
~~~

- Perform the translation operation via the translate API
~~~.swift
let locale: Locale = Locale.init(identifier: "hi-IN")
SlangRetailAssistant.translateText(
  "टमाटर",
  sourceLocale: locale,
  targetLocale: Locale(identifier: "en-IN")) {
  (translatedText, translationError)  in
    if error != nil {
        print(error)
         return
    }
    if let translatedText = translatedText {
        print(translatedText)
    }
}
~~~

## TranslateAPI Declaration :

~~~.swift
func translateText(_ sourceText: String, 
sourceLocale: Locale, targetLocale: Locale,
completionHandler: @escaping (String?, TranslationError?) -> Void)
~~~

## TranslateAPI Parameters :

`sourceText`  <br/>The source string that needs to be translated.

`sourceLocale`  <br/>Locale specification of the source string.

`targetLocale` <br/>The target Locale specification for the translation request.

`completionHandler` <br/>
The completion handler to call when the translate request is complete. 

The handler takes the following parameters :

`translatedText` <br/>
The translated text of type `string`. It will be `nil` if the translation request has failed.

`translationError` <br/>
A `TranslationError` object that indicates why the request failed, or nil if the request was successful. 
<br/>
<br/>
## TranslationError :
The translation error object is special type of error object which indicates what is the type of error and its description.

The error object contains the following : <br/>

`errorDescription` <br/> 
A localized message describing what error occurred.

`type` <br/>
A `TranslationErrorType` enum that indicates the type of failure.
<br/>

### `TranslationErrorType` :
The TranslationErrorType is enum which describes the type of error.

The enum contains the following : <br/>

`localeNotSupported` <br/> 
A localized message describing what error occurred.

`networkError` <br/>
A `TranslationErrorType` enum that indicates the type of failure.

<br/>

## License
Copyright (c) 2017-2019 Slang Labs Private Limited. All rights reserved.
