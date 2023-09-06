# iOS - Swift 

### [Source Directory](https://github.com/VictorKabata/DarajaMultiplatform)

### Setting Up

- To add ___DarajaMultiplatform___ package to your Xcode Project, open your Xcode project, navigate to the File tab within the macOS bar and click __Select Packages__ then __Add Package Dependency__. Enter the package name ie. DarajaMultiplatform or the URL package GitHub URL:

```curl
https://github.com/VictorKabata/DarajaSwiftPackage.git
```

<video src="assets/add_spm.mp4"/>|

- Create an instance of the Daraja object by passing the daraja environment variables. The daraja object provides functions to request for an access token and initiate M-Pesa express STK request.

```swift
var daraja=Daraja(
        consumerKey: "your_consumer_key",
        consumerSecret: "your_customer_secret",
        passKey:"your_pass_key",
        environment: DarajaEnvironment.sandboxEnvironment
        )
```

> Network logging is enabled by default when using Daraja Multiplatform. in sandbox/testing mode. The logs can be accessed from the logs in XCode IDE

> Network logs are strictly disabled in production mode ie. DarajaEnvironment.productionEnvironment

### Request Access Token
- To request an access token from Daraja API, invoke the `requestAccessToken` function:

```swift
var accessTokenResult = daraja.requestAccessToken()

accessTokenResult.onSuccess(action: { accessToken in
    // Successfully fetched daraja access token
        print(accessToken)
    }).onFailure(action: { error in
     // Failure fetching daraja access token
        print(error)
    })
```

### Initiate M-Pesa Express STK Request

- To initiate M-Pesa Express(Lipa na M-Pesa Online) STK request, invoke the `initiateDarajaStk` function:

```swift
var darajaResponse = daraja.initiateMpesaExpressPayment(
  businessShortCode: "174379",
  amount: 1,
  phoneNumber: "07xxxxxxxx",
  transactionType: DarajaTransactionType.customerpaybillonline, transactionDesc: "M-Pesa payment",
  callbackUrl: "https://mydomain.com/path",
  accountReference: "Company name")

  darajaResponse.onSuccess(action: { data in
    // Successfully requested M-Pesa STK request
        print(data)
    })
    .onFailure(action: { error in
    // Failed to request M-Pesa STK
        print(error)
    })

```

### Query M-Pesa Transaction

- To check the status of an M-pesa transaction, invoke the `queryMpesaTransaction` function:

```swift
var darajaTransactionResponse = daraja.queryMpesaTransaction(
  businessShortCode: "174379", checkoutRequestID: "ws_CO_20122022180112029708374149")

darajaTransactionResponse.onSuccess(action: { data in
  // Successfully fetched M-pesa transaction status
  print(data)
}).onFailure(action: { error in
  // Failure fetching M-pesa transaction status
  print(error.errorMessage)
})

```