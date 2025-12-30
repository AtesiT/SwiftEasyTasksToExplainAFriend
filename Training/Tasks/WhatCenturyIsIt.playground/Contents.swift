//  Return the century of the input year. The input will always be a 4 digit string, so there is no need for validation.

func whatCentury(_ year: String) -> String {
    let yearArrayOfStrings: [String] = year.map { String($0) }
    let theCentury = "00"
    
    if (yearArrayOfStrings[2] == "0") && (yearArrayOfStrings[3] == "0") {
        let theCentury = yearArrayOfStrings[0] + yearArrayOfStrings[1]
    } else {
        let theCentury = yearArrayOfStrings[0] + String((Int(yearArrayOfStrings[1]) ?? 0) + 1)
    }
    return theCentury
}

print(whatCentury("2001"))
