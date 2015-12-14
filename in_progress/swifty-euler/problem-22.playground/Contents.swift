//Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
//
//For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
//
//What is the total of all the name scores in the file?

import Foundation

let nameString = try! NSString(contentsOfFile: "/Users/reesemclean/Desktop/rm-project-euler/in_progress/swifty-euler/problem-22.playground/Resources/p022_names.txt", encoding:NSUTF8StringEncoding)

let namesWithoutParenthesis = nameString.stringByReplacingOccurrencesOfString("\"", withString: "")
let names = namesWithoutParenthesis.componentsSeparatedByString(",")
let sortedNames = names.sort(<)

func letterScore(letter: Character) -> Int {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let index = alphabet.characters.indexOf(letter)!
    let position = alphabet.startIndex.distanceTo(index)
    return position + 1
}

func nameScore(name: String, indexInList: Int) -> Int {
    
    let letterTotalScore: Int = name.characters.reduce(0) { $0 + letterScore($1) }
    return letterTotalScore * (indexInList + 1)
    
}

var total = 0

for (index, name) in sortedNames.enumerate() {
    total = total + nameScore(name, indexInList: index)
}

print(total)