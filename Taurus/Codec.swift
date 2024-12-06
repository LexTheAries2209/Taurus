//
//  Codec.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation

public let CodecName : [String:[String]] = [
    //ARRI
    "AMIRA" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT","MPEG-2 HD 422"],
    "ALEXA Classic" : ["Prores 4444","Prores 422 HQ","Prores 422"],
    "ALEXA XT" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422"],
    "ALEXA SXT" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422"],
    "ALEXA 35" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
    "ALEXA Mini" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT"],
    "ALEXA Mini LF" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
    "ALEXA LF" : ["ARRIRAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422"],
    "ALEXA 65" : ["ARRIRAW"],
    "ALEXA 265" : ["ARRIRAW"],
    
    //RED
    "V-Raptor XL [X]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor [X]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor XL[8K VV]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor[8K VV]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor XL[8K S35]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor[8K S35]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "KEMODO-X" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "KEMODO" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    
    //SONY
    //"CineAlta Venice 2[8K]": ["Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
    "CineAlta Venice 2[8K]": ["X-OCN XT","X-OCN ST","X-OCN LT"],
    //"CineAlta Venice 2[6K]": ["Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
    "CineAlta Venice 2[6K]": ["X-OCN XT","X-OCN ST","X-OCN LT"],
    //"CineAlta Venice" : ["Prores 4444","Prores 422 HQ","Prores 422","Prores 422 Proxy","XAVC-I Class300","XAVC-I Class480","MPEG-2 LongGOP"],
    "CineAlta Venice" : ["X-OCN XT","X-OCN ST","X-OCN LT"],
    //"CineAlta Burano" : ["XAVC-H Intra HQ","XAVC-H Intra SQ","XAVC-H LongGOP","XAVC Intra","XAVC LongGOP"],
    "CineAlta Burano" : ["X-OCN LT"],
    "FX 9" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD","MPEG-2 LongGOP"],
    "FX 6" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "FX 3" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC HS 4K","XAVC S 4K","XAVC S HD",],
    "FX 30" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "Alpha 1" : ["XAVC HS 8K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A9M3" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A7S3" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A7R5" : ["XAVC HS 8K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A7M4" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A7C2" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A7CR" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A6700" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "ZV-E1" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    
    //CanonCinema
    "CinemaEOS C500 Mark2" : ["Cinema RAW Light","Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS C300 Mark3" : ["Cinema RAW Light","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS C400" : ["Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-HEVC S LongGOP","XF-AVC S Intra","XF-AVC S LongGOP","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS C80" : ["Cinema RAW Light ST","Cinema RAW Light LT","XF-HEVC S LongGOP","XF-AVC S Intra","XF-AVC S LongGOP","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS C70" : ["Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS R5C" : ["Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-AVC Intra","XF-AVC LongGOP"],
    
    //Canon
    "EOS R3" : ["RAW","RAW Light","ALL-I HEVC","ALL-I AVC","IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R5" : ["RAW","RAW Light","ALL-I HEVC","ALL-I AVC","IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R6 Mark2" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R6" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R8" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R7" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    
    //Panasonic
    "S1H" : ["HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "S5M2X" : ["Prores 422 HQ","Prores 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "S5M2" : ["HEVC LongGOP","AVC LongGOP"],
    "S9" : ["HEVC LongGOP","AVC LongGOP"],
    "GH7" : ["Prores RAW HQ","Prores RAW","Prores 422 HQ","Prores 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "GH6" : ["Prores 422 HQ","Prores 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "G9M2" : ["Prores 422 HQ","Prores 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    
    //DJI
    "Ronin 4D[8K]" : ["Prores RAW HQ","Prores 422 HQ","H.264(10bit 4:2:0)"],
    "Ronin 4D[6K]" : ["Prores RAW HQ","Prores 4444 XQ","Prores 422 HQ","Prores 422 LT","H.264(10bit 4:2:0)"],
    "Inspire 3" : ["CinemaDNG","Prores RAW HQ","Prores 422 HQ","H.264(10bit 4:2:0)"],
    
    //Apple
    "iPhone 16 Pro MAX" : ["Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "iPhone 16 Pro" : ["Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "iPhone 15 Pro MAX" : ["Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "iPhone 15 Pro" : ["Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "iPhone 14 Pro MAX" : ["Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "iPhone 14 Pro" : ["Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    
    //BMD
    "Blackmagic URSA Mini Pro 12K" : ["Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Blackmagic RAW 18:1"],
    "Blackmagic URSA Mini Pro 4.6K G2" : ["Blackmagic RAW 3:1","Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "Blackmagic URSA Mini Pro 4.6K" : ["Blackmagic RAW 3:1","Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    
    //General
    "Select Mode" : ["ARRIRAW[13bit]","ARRIRAW[12bit]","REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ","X-OCN XT","X-OCN ST","X-OCN LT","CinemaDNG","Prores RAW HQ","Prores RAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
    "Manual Resolution" : ["ARRIRAW[13bit]","ARRIRAW[12bit]","REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ","X-OCN XT","X-OCN ST","X-OCN LT","CinemaDNG","Prores RAW HQ","Prores RAW","Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 LT","Prores 422 Proxy"],
]
