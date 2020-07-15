import UIKit

let defaults = UserDefaults.standard

defaults.set(10, forKey: "Volume")
defaults.set(true, forKey: "musicon")

let array = [1,2,3]
defaults.set(array, forKey: "myArray")

let volume = defaults.integer(forKey: "Volume")

let myArray = defaults.array(forKey: "myArray") as! [Int]
