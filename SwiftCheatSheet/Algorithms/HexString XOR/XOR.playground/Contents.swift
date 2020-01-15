import UIKit


let hexStrings = "a3:5A:f0:9e:1B:CD:6C:04:1E:DA:8D:A5:6D:B2:E9:46:40:07:63:5a:da:cf".split(separator: ":")
let param = 0xE3
let numbers = hexStrings.compactMap{Int($0, radix: 16)}
let result = numbers.map{String(format: "%02x", $0^param)}.joined(separator: ":")

print(result)

