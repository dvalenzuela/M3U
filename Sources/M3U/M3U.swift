import Foundation

class M3U: NSObject {
    private (set) var infs: [ExtInf]
    init(extInfs: [ExtInf]) {
        infs = extInfs
    }
    
    static func parse(_ content: String?) -> M3U  {
        var isFirstLine = true;
        var isInfLine = false;
        var previousLine = ""
        var result = [ExtInf]()
        guard let content = content else { return M3U(extInfs: result) }
        content.enumerateLines(invoking: { line, stop in
            if (isFirstLine && !line.starts(with: "#EXTM3U")) {
                return
            }
            isFirstLine = false;
            if (isInfLine) {
                result.append(ExtInf(previousLine, line))
                isInfLine = false
            }
            if line.hasPrefix("#EXTINF:") {
                isInfLine = true;
                previousLine = line
            }
        })
        return M3U(extInfs: result)
    }
}
