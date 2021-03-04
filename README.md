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

  pod 'SlangRetailAssistant', '~> 4.0.0'
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
  with: "<AssistantId>",
  apiKey: "<APIKey>",
  environment: .staging //Change this to .production once you've published the Assistant to production environment
)
~~~

- Perform the translation operation via the translate API
~~~.swift
let locale: Locale = Locale.init(identifier: "hi-IN")
SlangRetailAssistant.translateText(
  for: "टमाटर",
  sourceLocale: locale,
  targetLocale: Locale(identifier: "en-IN")) {
  (translatedText, translationError)  in
    if translationError != nil {
        print(translationError)
         return
    }
    if let translatedText = translatedText {
        print(translatedText)
    }
}
~~~

## TranslateAPI Declaration :

~~~.swift
func translateText(for text: String, 
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

The enum contains the following cases : <br/>

`localeNotSupported` <br/> 
This case signifies that either the source or destination locale were incorrect. <br/>
Note : <br/>
- Destination locale language code needs to be `en`.
- Source locale language code should not be `en`.

`networkError(_ error: SlangNetworkError)` <br/>
This case signifies that there was a network error, But additionally it provides another error object `SlangNetworkError` which specifies what exactly the network was.

## SlangNetworkError :
The network error object is special type of error object which indicates what is the type of network error and its description.

The error object contains the following : <br/>

`errorDescription` <br/> 
A localized message describing what error occurred.

`type` <br/>
A `SlangNetworkErrorType` enum that indicates the type of failure.
<br/>
### `SlangNetworkErrorType` :
The SlangNetworkErrorType is enum which describes the type of network error.

The enum contains the following cases : <br/>

`unauthorized` <br/> 
This case indicates that the current assistant is unauthorized.<br/>

`serializationFailed` <br/> 
This indicates that an internal searlization of the request data has failed<br/>

`deserializationFailed` <br/> 
This indicates that an internal deserialization of the response data has failed<br/>

`networkError` <br/> 
This indicates that there has been an internal network error<br/>
<br/>

### Typical Error Parsing Construct
~~~.swift
let locale: Locale = Locale.init(identifier: "hi-IN")
SlangRetailAssistant.translateText(
  for: "टमाटर",
  sourceLocale: locale,
  targetLocale: Locale(identifier: "en-IN")) {
  (translatedText, translationError)  in
    if error != nil {
      switch error?.type {
        case .localeNotSupported :
        //localeNotSupported error reported
        break
        case .networkError(let error) :
        //networkError error thrown
        switch error.type {
          case .serializationFailed:
          //serializationFailed networkError error reported
          break
          case .deserializationFailed:
          /deserializationFailed networkError error reported
          break
          case .unauthorized:
          //unauthorized networkError error reported
          break
          case .networkError:
          //internalError networkError error reported
          break
        }
        break
        case .none:
          break
      }
      print(error)
      return
    }
    if let translatedText = translatedText {
        print(translatedText)
    }
}
~~~

## License
Copyright (c) 2017-2021 Slang Labs Private Limited. All rights reserved.
