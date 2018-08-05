# Wheel-of-Fate

1. I use github gist as an api
2. Architecture of this app is MVVM using observer 
3. I build the observer from stratch instead of using RxSwift, since this app doesn't need RxSwift just yet (overkill)
4. The Api module is separated from the main target for a scalable purpose
5. Api target run on top of Alamofire framework with scalable style
6. The time of wheel of fate algorithm took 0.00333103 seconds to complete
