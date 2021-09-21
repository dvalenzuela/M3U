import Foundation
class ExtInf {
    var map = [String: String]()
    static func updateMap(map : inout [String: String], key: String, value: String) -> String {
        map[key] = value
        return value
    }
    static func getFromMap(map : inout [String: String], key: String, defaultValue: String) -> String {
        if let value = map[key] {
            return value
        } else {
            return updateMap(map: &map, key: key, value: defaultValue)
        }
        
    }
    init(_ line: String, _ url: String) {
        raw = line
        tvg = Tvg(line)
        self.url = url
    }
    var name: String {
        return ExtInf.getFromMap(map: &map, key: "name", defaultValue: ExtInf.getName(raw))
    }
    var group: String {
        return ExtInf.getFromMap(map: &map, key: "group-title", defaultValue: ExtInf.getName(raw))
    }
    var url: String?
    var timeShift: String {
        return ExtInf.getFromMap(map: &map, key: "timeshift", defaultValue: ExtInf.getName(raw))
    }
    var raw: String
    class Tvg {
        var raw: String
        var map = [String: String]()
        init(_ line: String) {
            raw = line
        }
        var id: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-id", defaultValue: matchesForRegexInText(key: "tvg-id", text: raw))
        }
        var  name: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-name", defaultValue: matchesForRegexInText(key: "tvg-name", text: raw))
        }
        var language: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-language", defaultValue: matchesForRegexInText(key: "tvg-language", text: raw))
        }
        var country: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-country", defaultValue: matchesForRegexInText(key: "tvg-country", text: raw))
        }
        var logo: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-logo", defaultValue: matchesForRegexInText(key: "tvg-logo", text: raw))
        }
        var url: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-url", defaultValue: matchesForRegexInText(key: "tvg-url", text: raw))
        }
        var rec: String {
            return ExtInf.getFromMap(map: &map, key: "tvg-url", defaultValue: matchesForRegexInText(key: "tvg-rec", text: raw))
        }
    }
    var tvg: Tvg
    
    static func matchesForRegexInText(key: String, text: String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: key + "=\"(.*?)\"", options: NSRegularExpression.Options.caseInsensitive)
            let nsString = text as NSString
            let results = regex.matches(in: text,
                                        options: NSRegularExpression.MatchingOptions.reportCompletion , range: NSMakeRange(0, nsString.length))
                as [NSTextCheckingResult]
            let resultText: String =   results.map({
                nsString.substring(with: $0.range)
            }).joined()
            return String(resultText.replacingOccurrences(of: key + "=\"", with: "").dropLast())
            
        } catch {
            print(error)
            return ""
        }
    }
    static func getName(_ text: String) -> String {
        guard let text =
                text.split(separator: ",").last else {
            return ""
        }
        return String(text)
    }
}
