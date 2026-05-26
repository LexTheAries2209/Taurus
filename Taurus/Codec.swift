//
//  Codec.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation

public let CodecName : [String:[String]] = [
    //ARRI
    "ALEXA Classic" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA Classic EV" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA Classic Plus" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA Classic Plus 4:3" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA Classic M" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA Classic Studio" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA HD" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA HD Plus" : ["ProRes 4444","ProRes 422 HQ","ProRes 422"],
    "ALEXA XT" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA XT Plus" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA XT Plus Monochrome" : ["ARRIRAW"],
    //"ALEXA XT M" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    ///"ALEXA XT Studio" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    "AMIRA" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    //"AMIRA Live" : ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    "ALEXA SXT" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA SXT EV" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA SXT Plus" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA SXT Studio" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA SXT W" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    "ALEXA 35 Xtreme" : ["ARRIRAW","ARRICORE","ARRICORE[Overdrive]","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    "ALEXA 35" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    //"ALEXA 35 Live" : ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    //"ALEXA 35 Base" : ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    "ALEXA Mini" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    "ALEXA Mini LF" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    //"ALEXA Mini LF Monochrome" : ["ARRIRAW"],
    "ALEXA LF" : ["ARRIRAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422"],
    //"ALEXA 65 Monochrome" : ["ARRIRAW"],
    "ALEXA 65" : ["ARRIRAW"],
    "ALEXA 265" : ["ARRIRAW"],
    
    
    //"Kinefinity"
    "MAVO Edge 8K" : ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    "MAVO Edge 6K" : ["CinemaDNG","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    "MAVO Mark 2 LF" : ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    "MAVO Mark 2 S35" : ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT"],
    
       
    //RED
    "V-Raptor XL [X]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor [X]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor XL[8K VV]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor[8K VV]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor XE" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor XL[8K S35]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "V-Raptor[8K S35]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "KOMODO-X" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    "KOMODO" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
    
    //SONY
    //"CineAlta Venice 2[8K]": ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    "CineAlta Venice 2[8K]": ["X-OCN XT","X-OCN ST","X-OCN LT"],
    //"CineAlta Venice 2[6K]": ["ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ"],
    "CineAlta Venice 2[6K]": ["X-OCN XT","X-OCN ST","X-OCN LT"],
    //"CineAlta Venice" : ["ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 Proxy","XAVC-I Class300","XAVC-I Class480","MPEG-2 LongGOP"],
    "CineAlta Venice" : ["X-OCN XT","X-OCN ST","X-OCN LT"],
    //"CineAlta Burano" : ["XAVC-H Intra HQ","XAVC-H Intra SQ","XAVC-H LongGOP","XAVC Intra","XAVC LongGOP"],
    "CineAlta Burano" : ["X-OCN LT"],
    "FX 9" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD","MPEG-2 LongGOP"],
    "FX 6" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "FX 3" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC HS 4K","XAVC S 4K","XAVC S HD",],
    "FX 30" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A1M2" : ["XAVC HS 8K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
    "A1" : ["XAVC HS 8K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
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
    "CinemaEOS C50" : ["Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-HEVC S Intra","XF-HEVC S LongGOP","XF-AVC S Intra","XF-AVC S LongGOP","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS C70" : ["Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-AVC Intra","XF-AVC LongGOP"],
    "CinemaEOS R5C" : ["Cinema RAW Light HQ","Cinema RAW Light ST","Cinema RAW Light LT","XF-AVC Intra","XF-AVC LongGOP"],
    
    //Canon
    "EOS R1" : ["RAW","RAW Light","XF-HEVC S LongGOP FF","XF-HEVC S LongGOP S35","XF-AVC S Intra FF","XF-AVC S Intra S35","XF-AVC S LongGOP FF","XF-AVC S LongGOP S35"],
    "EOS R3" : ["RAW","RAW Light","ALL-I HEVC","ALL-I AVC","IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R5 Mark2" : ["RAW","RAW Light","XF-HEVC S Intra FF","XF-HEVC S LongGOP FF","XF-HEVC S LongGOP S35","XF-AVC S Intra FF","XF-AVC S Intra S35","XF-AVC S LongGOP FF","XF-AVC S LongGOP S35"],
    "EOS R5" : ["RAW","RAW Light","ALL-I HEVC","ALL-I AVC","IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R6 V" : ["RAW","RAW Light","XF-HEVC S Intra FF","XF-HEVC S LongGOP FF","XF-HEVC S LongGOP S35","XF-AVC S Intra FF","XF-AVC S LongGOP FF","XF-AVC S LongGOP S35"],
    "EOS R6 Mark3" : ["RAW","RAW Light","XF-HEVC S Intra FF","XF-HEVC S LongGOP FF","XF-HEVC S LongGOP S35","XF-AVC S Intra FF","XF-AVC S LongGOP FF","XF-AVC S LongGOP S35"],
    "EOS R6 Mark2" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R6" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R8" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    "EOS R7" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
    
    //Panasonic
    "S1H" : ["HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "S5M2X" : ["ProRes 422 HQ","ProRes 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "S5M2" : ["HEVC LongGOP","AVC LongGOP"],
    "S9" : ["HEVC LongGOP","AVC LongGOP"],
    "GH7" : ["ProRes RAW HQ","ProRes RAW","ProRes 422 HQ","ProRes 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "GH6" : ["ProRes 422 HQ","ProRes 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    "G9M2" : ["ProRes 422 HQ","ProRes 422","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
    
    //DJI
    "Ronin 4D[8K]" : ["ProRes RAW HQ","ProRes RAW","ProRes 422 HQ","H.264(10bit 4:2:0)"],
    "Ronin 4D[6K]" : ["ProRes RAW HQ","ProRes RAW","ProRes 4444 XQ","ProRes 422 HQ","ProRes 422 LT","H.264(10bit 4:2:0)"],
    "Inspire 3" : ["CinemaDNG","ProRes RAW HQ","ProRes RAW","ProRes 422 HQ","H.264(10bit 4:2:0)"],
    
    //Apple
    "iPhone 17 Pro MAX" : ["ProRes RAW HQ","ProRes RAW","ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 17 Pro" : ["ProRes RAW HQ","ProRes RAW","ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 16 Pro MAX" : ["ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 16 Pro" : ["ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 15 Pro MAX" : ["ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 15 Pro" : ["ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 14 Pro MAX" : ["ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    "iPhone 14 Pro" : ["ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy","H.265 (54 Mbps)","H.264 (54 Mbps)"],
    
    //BMD
    "Blackmagic URSA Cine Immersive" : ["Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Blackmagic RAW 18:1"],
    "Blackmagic URSA Cine 17K 65" : ["Blackmagic RAW 3:1","Blackmagic RAW 4:1","Blackmagic RAW 5:1","Blackmagic RAW 6:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Blackmagic RAW 18:1"],
    "Blackmagic URSA Cine 12K LF" : ["Blackmagic RAW 3:1","Blackmagic RAW 4:1","Blackmagic RAW 5:1","Blackmagic RAW 6:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Blackmagic RAW 18:1"],
    "Blackmagic URSA Mini Pro 12K" : ["Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","Blackmagic RAW 18:1"],
    "Blackmagic URSA Mini Pro 4.6K G2" : ["Blackmagic RAW 3:1","Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy"],
    "Blackmagic URSA Mini Pro 4.6K" : ["Blackmagic RAW 3:1","Blackmagic RAW 5:1","Blackmagic RAW 8:1","Blackmagic RAW 12:1","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy"],
    
    //General
    "Select Mode" : ["ARRIRAW[13bit]","ARRIRAW[12bit]","REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ","X-OCN XT","X-OCN ST","X-OCN LT","CinemaDNG","ProRes RAW HQ","ProRes RAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy"],
    "Manual Resolution" : ["ARRIRAW[13bit]","ARRIRAW[12bit]","REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ","X-OCN XT","X-OCN ST","X-OCN LT","CinemaDNG","ProRes RAW HQ","ProRes RAW","ProRes 4444 XQ","ProRes 4444","ProRes 422 HQ","ProRes 422","ProRes 422 LT","ProRes 422 Proxy"],
]
