import UIKit

// URL
let urlString = "https://itunes.apple.com/search?media=music&netity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme
url?.host
url?.path
url?.query
url?.baseURL
