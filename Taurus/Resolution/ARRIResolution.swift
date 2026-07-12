import Foundation

func ARRIResolution(cameradata: CameraSelectionStore) -> [String] {
    guard cameradata.BrandName == "ARRI" else {
        return ["无选项"]
    }

    let resolutions = ARRIRecordingCatalog().resolutionOptions(
        for: CameraSelection(selectionStore: cameradata)
    )
    return resolutions.isEmpty ? ["无选项"] : resolutions
}

enum ARRIResolutionDisplayCatalog {
    struct Entry: Equatable {
        let officialID: String
        let displayName: String
    }

    static func entries(cameraID: String, codecID: String) -> [Entry] {
        switch cameraID {
        case "ALEXA Classic" where isProRes(codecID):
            return alexaClassicProRes
        case "ALEXA XT" where codecID == "ARRIRAW":
            return alexaXTRaw
        case "ALEXA XT" where isProRes(codecID):
            return alexaXTProRes
        case "ALEXA SXT" where codecID == "ARRIRAW":
            return alexaSXTRaw
        case "ALEXA SXT" where isProRes(codecID):
            return alexaSXTProRes
        case "AMIRA" where codecID == "ARRIRAW":
            return amiraRaw
        case "AMIRA" where isProRes(codecID):
            return amiraProRes
        case "ALEXA 35" where codecID == "ARRIRAW":
            return alexa35Raw
        case "ALEXA 35" where isProRes(codecID):
            return alexa35ProRes
        case "ALEXA 35 Xtreme" where ["ARRIRAW", "ARRICORE", "ARRICORE[Overdrive]"].contains(codecID):
            return alexa35XtremeRawStyle
        case "ALEXA 35 Xtreme" where isProRes(codecID):
            return alexa35XtremeProRes
        case "ALEXA Mini" where codecID == "ARRIRAW":
            return alexaMiniRaw
        case "ALEXA Mini" where isProRes(codecID):
            return alexaMiniProRes
        case "ALEXA Mini LF" where codecID == "ARRIRAW":
            return alexaMiniLFRaw
        case "ALEXA Mini LF" where isProRes(codecID):
            return alexaMiniLFProRes
        case "ALEXA LF" where codecID == "ARRIRAW":
            return alexaLFRaw
        case "ALEXA LF" where isProRes(codecID):
            return alexaLFProRes
        case "ALEXA 65" where codecID == "ARRIRAW":
            return alexa65Raw
        case "ALEXA 265" where codecID == "ARRIRAW":
            return alexa265Raw
        default:
            return []
        }
    }

    static func displayName(cameraID: String, codecID: String, officialID: String) -> String? {
        entries(cameraID: cameraID, codecID: codecID)
            .first { $0.officialID == officialID }?
            .displayName
    }

    private static func isProRes(_ codecID: String) -> Bool {
        codecID.hasPrefix("ProRes")
    }

    private static func entry(_ officialID: String, _ displayName: String) -> Entry {
        Entry(officialID: officialID, displayName: displayName)
    }

    private static let alexaClassicProRes = [
        entry("2K (2048 x 1536)", "2K S35[2048*1536][From 2868*2152][4:3]"),
        entry("2K (2048 x 1152)", "2K S35[2048*1152][From 2868*1614]"),
        entry("HD (1920 x 1080)", "FHD S35[From 2880*1620]")
    ]

    private static let alexaXTRaw = [
        entry("3.4K (3424 x 2202)", "3.4K S35[3424*2202][OG]"),
        entry("2.8K (2880 x 2160)", "2.8K S35[2880*2160][4:3]"),
        entry("2.8K (2880 x 1620)", "2.8K S35[2880*1620]"),
        entry("2.6K (2578 x 2160)", "2.6K S35[2578*2160][6:5]")
    ]

    private static let alexaXTProRes = [
        entry("3.2K (3164 x 1778)", "3.2K S35[3164*1778]"),
        entry("2K (2048 x 1536)", "2K S35[2048*1536][From 2868*2152][4:3]"),
        entry("2K (2048 x 1152)", "2K S35[2048*1152][From 2868*1614]"),
        entry("HD (1920 x 1080)", "FHD S35[From 2880*1620]")
    ]

    private static let alexaSXTRaw = [
        entry("3.4K (3424 x 2202)", "3.4K S35[3424*2202][OG]"),
        entry("3.2K (3168 x 1782)", "3.2K S35[3168*1782]"),
        entry("2.8K (2880 x 2160)", "2.8K S35[2880*2160][4:3]"),
        entry("2.8K (2880 x 1620)", "2.8K S35[2880*1620]"),
        entry("2.6K (2578 x 2160)", "2.6K S35[2578*2160][6:5]")
    ]

    private static let alexaSXTProRes = [
        entry("Open Gate 4K Cine (4096 x 2636)", "4K Cine S35[4096*2636][From 3414*2198][1.55:1]"),
        entry("4K UHD (3840 x 2160)", "UHD S35[From 3200*1800]"),
        entry("Open Gate 3.4K (3424 x 2202)", "3.4K S35[3424*2202][OG]"),
        entry("3.2K (3200 x 1800)", "3.2K S35[3200*1800]"),
        entry("4:3 2.8K (2880 x 2160)", "2.8K S35[2880*2160][4:3]"),
        entry("2K (2048 x 1152)", "2K S35[2048*1152][From 2880*1620]"),
        entry("HD (1920 x 1080)", "FHD S35[From 2880*1620]"),
        entry("4K Cine Anamorphic (4096 x 1716)", "4K S35[4096*1716][From 2560*2146][2.39:1 ANA]"),
        entry("2K Anamorphic (2048 x 858)", "2K S35[2048*858][From 2560*2146][2.39:1 ANA]")
    ]

    private static let amiraRaw = [
        entry("2.8K (2880 x 1620)", "2.8K S35[2880*1620]")
    ]

    private static let amiraProRes = [
        entry("UHD (3840 x 2160)", "UHD S35[From 3200*1800]"),
        entry("3.2K (3200 x 1800)", "3.2K S35[3200*1800]"),
        entry("2K (2048 x 1152)", "2K S35[2048*1152][From 2868*1612]"),
        entry("HD (1920 x 1080) — 16:9 2.8K", "FHD S35[From 2880*1620]"),
        entry("HD (1920 x 1080) — 16:9 1.6K", "FHD S16[From 1600*900]")
    ]

    private static let alexa35Raw = [
        entry("4.6K (4608 x 3164)", "4.6K S35[4608*3164][OG]"),
        entry("4.6K (4608 x 2592)", "4.6K S35[4608*2592]"),
        entry("4K (4096 x 2304)", "4K S35[4096*2304]"),
        entry("UHD (3840 x 2160)", "UHD S35"),
        entry("4K (4096 x 2048)", "4K S35[4096*2048][2:1]"),
        entry("3.3K (3328 x 2790)", "3.3K S35[3328*2790][6:5]"),
        entry("3K (3072 x 3072)", "3K S35[3072*3072][1:1]")
    ]

    private static let alexa35ProRes = [
        entry("4.6K (4608 x 3164)", "4.6K S35[4608*3164][OG]"),
        entry("4K (4096 x 2304) — 4.6K 16:9", "4K S35[4096*2304][From 4608*2592]"),
        entry("4K (4096 x 2304) — 4K 16:9", "4K S35[4096*2304]"),
        entry("4K (4096 x 2048)", "4K S35[4096*2048][2:1]"),
        entry("3.8K 2.39:1 Ana. 2x", "3.8K S35[3840*1608][From 3328*2790][6:5 ANA]"),
        entry("UHD (3840 x 2160)", "UHD S35[From 4096*2304]"),
        entry("UHD 16:9 Ana 2x", "UHD S35[From 2743*3086][8:9 ANA]"),
        entry("3.8K 2:1 Ana 2x", "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]"),
        entry("3.3K (3328 x 2790)", "3.3K S35[3328*2790][6:5]"),
        entry("3K (3072 x 3072)", "3K S35[3072*3072][1:1]"),
        entry("2K (2048 x 1152) — 4K 16:9", "2K S35[2048*1152][From 4096*2304]"),
        entry("2K (2048 x 1152) — 2K 16:9 S16", "2K S16[2048*1152]"),
        entry("HD (1920 x 1080)", "FHD S35[From 4096*2304]")
    ]

    private static let alexa35XtremeRawStyle = [
        entry("4.6K (4608 x 3164)", "4.6K S35[4608*3164][OG]"),
        entry("4.6K (4608 x 2592)", "4.6K S35[4608*2592]"),
        entry("4K (4096 x 2304)", "4K S35[4096*2304]"),
        entry("UHD (3840 x 2160)", "UHD S35"),
        entry("3.8K (3840 x 1608)", "3.8K S35[3840*1608][2.39:1]"),
        entry("3.3K (3328 x 2790)", "3.3K S35[3328*2790][6:5]"),
        entry("2K (2048 x 1152)", "2K S16[2048*1152]"),
        entry("HD (1920 x 1080)", "FHD S16[1920*1080]")
    ]

    private static let alexa35XtremeProRes = [
        entry("4.6K (4608 x 3164)", "4.6K S35[4608*3164][OG]"),
        entry("4.6K (4608 x 2592)", "4.6K S35[4608*2592]"),
        entry("4K (4096 x 2304)", "4K S35[4096*2304]"),
        entry("UHD (3840 x 2160) — 4K 16:9", "UHD S35[From 4096*2304]"),
        entry("2K (2048 x 1152) — 4K 16:9", "2K S35[2048*1152][From 4096*2304]"),
        entry("HD (1920 x 1080) — 4K 16:9", "FHD S35[From 4096*2304]"),
        entry("UHD (3840 x 2160) — 3.8K 16:9", "UHD S35"),
        entry("3.8K (3840 x 1608)", "3.8K S35[3840*1608][2.39:1]"),
        entry("3.3K (3328 x 2790)", "3.3K S35[3328*2790][6:5]"),
        entry("3.8K 2.39:1 Ana. 2x", "3.8K S35[3840*1608][From 3328*2790][6:5 ANA]"),
        entry("2K (2048 x 1152) — 2K 16:9 S16", "2K S16[2048*1152]"),
        entry("HD (1920 x 1080) — HD 16:9 S16", "FHD S16[1920*1080]")
    ]

    private static let alexaMiniRaw = [
        entry("3.4K (3424 x 2202)", "3.4K S35[3424*2202][OG]"),
        entry("2.8K (2880 x 2160)", "2.8K S35[2880*2160][Clip 3424*2202][4:3]"),
        entry("2.8K (2880 x 1620)", "2.8K S35[2880*1620]"),
        entry("1.9K (1920 x 2160)", "1.9K S35[1920*2160][8:9]"),
        entry("2.5K (2560 x 2145)", "2.5K S35[2560*2145][6:5]")
    ]

    private static let alexaMiniProRes = [
        entry("UHD (3840 x 2160)", "UHD S35[From 3200*1800]"),
        entry("3.2K (3200 x 1800)", "3.2K S35[3200*1800]"),
        entry("2.8K (2880 x 2160)", "2.8K S35[2880*2160][4:3]"),
        entry("2K (2048 x 1152)", "2K S35[2048*1152][From 2868*1612]"),
        entry("2K (2048 x 858)", "2K S35[2048*858][From 2560*2145][6:5 ANA]"),
        entry("HD (1920 x 1080) — 16:9 2.8K", "FHD S35[From 2880*1620]"),
        entry("HD (1920 x 1080) — 0.88:1 1.9K", "FHD S35[From 1920*2160][8:9 ANA]"),
        entry("HD (1920 x 1080) — 16:9 1.6K", "FHD S16[From 1600*900]")
    ]

    private static let alexaMiniLFRaw = [
        entry("4.5K (4448 x 3096)", "4.5K LF[4448*3096][OG]"),
        entry("4.5K (4448 x 1856)", "4.5K LF[4448*1856][2.39:1]"),
        entry("UHD (3840 x 2160)", "UHD LF"),
        entry("3.4K (3424 x 2202)", "3.4K S35[3424*2202][1.55:1]"),
        entry("2.8K (2880 x 2880)", "2.8K LF[2880*2880][1:1]")
    ]

    private static let alexaMiniLFProRes = [
        entry("4.5K (4448 x 3096)", "4.5K LF[4448*3096][OG]"),
        entry("4.5K (4448 x 1856)", "4.5K LF[4448*1856][2.39:1]"),
        entry("UHD (3840 x 2160) — 4.3K 16:9", "UHD LF[From 4320*2430]"),
        entry("UHD (3840 x 2160) — 3.8K 16:9", "UHD LF"),
        entry("3.2K (3200 x 1800)", "3.2K S35[3200*1800]"),
        entry("2.8K (2880 x 2880)", "2.8K LF[2880*2880][1:1]"),
        entry("2.8K (2880 x 2160)", "2.8K S35[2880*2160][4:3]"),
        entry("2K (2048 x 1152)", "2K LF[2048*1152][From UHD]"),
        entry("HD (1920 x 1080) — 4.3K 16:9", "FHD LF[From 4320*2430]"),
        entry("HD (1920 x 1080) — 3.8K 16:9", "FHD LF[From UHD]"),
        entry("HD (1920 x 1080) — 2.8K 16:9", "FHD S35[From 2880*1620]")
    ]

    private static let alexaLFRaw = [
        entry("LF Open Gate 4.5K (4448 x 3096)", "4.5K LF[4448*3096][OG]"),
        entry("4.5K Scope (4448 x 1856)", "4.5K LF[4448*1856][2.39:1]"),
        entry("UHD (3840 x 2160)", "UHD LF")
    ]

    private static let alexaLFProRes = [
        entry("LF Open Gate 4.5K (4448 x 3096)", "4.5K LF[4448*3096][OG]"),
        entry("4.5K Scope (4448 x 1856)", "4.5K LF[4448*1856][2.39:1]"),
        entry("UHD (3840 x 2160)", "UHD LF"),
        entry("2K (2048 x 1152)", "2K LF[2048*1152][From UHD]"),
        entry("HD (1920 x 1080)", "FHD LF[From UHD]")
    ]

    private static let alexa65Raw = [
        entry("6.5K (6560 x 3100)", "6.5K 65mm[6560*3100][OG]"),
        entry("5.1K (5120 x 2880)", "5.1K 65mm[5120*2880]"),
        entry("4.3K (4320 x 2880)", "4.3K LF[4320*2880][3:2]"),
        entry("LF Open Gate 4.5K 3:2 (4448 x 3096)", "4.5K LF[4448*3096][1.43:1]"),
        entry("UHD (3840 x 2160)", "UHD LF")
    ]

    private static let alexa265Raw = [
        entry("6.5K (6560x3100)", "6.5K 65mm[6560*3100][OG]"),
        entry("5.1K (5120x3100)", "5.1K 65mm[5120*3100]"),
        entry("4.5K (4448x3096)", "4.5K LF[4448*3096][1.43:1]")
    ]
}
