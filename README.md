# RxConnection
Lightweight connection service based on RxSwift and Alamofire

###### Installation: 

With Cocoapods. Until desctribution you can use it with:
```
pod RxConnection, :git => 'https://github.com/DmitriyBagrov92/rxConnection.git'
```

###### Using:

1. Initialize ConnectionService:
```
// Process exception if server domain can be unresolvable
let connection = try! ConnectionService(serverSettings: ServerSettings(address: "google.com"))
```
2. Subscribe to connection State Observer:
```
connection.serverConnectionState.subscribe(onNext: { state: ServerConnectionState in
  print(state.status)
})
```
