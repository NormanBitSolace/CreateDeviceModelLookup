import UIKit
import BlackLabsFile
import BlackLabsData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.generateDictionary()
    }

    //  Thank you Adam A Wolf! https://gist.github.com/adamawolf/3048717
    static func generateDictionary() {
        if let lines = Data.lines(localFile: "device_types.txt") {
            let filteredLines = lines.filter { !$0.isEmpty } // remove lines with empty quotes
            print("let DEVICE_MODELS: [String: String] = [")
            for line in filteredLines {
                let parts = line.components(separatedBy: " : ")
                let key = parts[0].trimmingCharacters(in: .whitespaces)
                let value = parts[1].trimmingCharacters(in: .whitespaces)
                if line == filteredLines.last {
                    print("\t\"\(key)\": \"\(value)\"")
                } else {
                    print("\t\"\(key)\": \"\(value)\",")
                }
            }
            print("]")
        }
    }
}
