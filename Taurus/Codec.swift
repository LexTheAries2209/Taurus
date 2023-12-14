//
//  Codec.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation

//编码库
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
        
        //RED
        "V-Raptor XL[8K VV]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
        "V-Raptor[8K VV]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
        "V-Raptor XL[8K S35]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
        "V-Raptor[8K S35]" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
        "KEMODO-X" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
        "KEMODO" : ["REDCODE HQ","REDCODE MQ","REDCODE LQ","REDCODE ELQ"],
        
        //SONY
        "Cinealta Venice 2[8K]": ["X-OCN XT","X-OCN ST","X-OCN LT","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
        "Cinealta Venice 2[6K]": ["X-OCN XT","X-OCN ST","X-OCN LT","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
        "Cinealta Venice" : ["X-OCN XT","X-OCN ST","X-OCN LT","RAW SQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 Proxy","XAVC-I Class300","XAVC-I Class480","MPEG-2 LongGOP"],
        "Cinealta Burano" : ["X-OCN LT","XAVC-H Intra HQ","XAVC-H Intra SQ","XAVC-H LongGOP","XAVC Intra","XAVC LongGOP"],
        "FX 9" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD","MPEG-2 LongGOP"],
        "FX 6" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "FX 3" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD",],
        "FX 30" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "Alpha 1" : ["XAVC HS 8K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "A9M3" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "A7S3" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "A7R5" : ["XAVC HS 8K","XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "A7M4" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "A7C2" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
        "A7CR" : ["XAVC S-I 4K","XAVC HS 4K","XAVC S 4K","XAVC S-I HD","XAVC S HD"],
       
        //Canon
        "CinemaEOS C500 Mark2" : [""],
        "CinemaEOS C300 Mark3" : [""],
        "CinemaEOS C300 Mark2" : [""],
        "CinemaEOS C200" : [""],
        "CinemaEOS C100 Mark2" : [""],
        "CinemaEOS C70" : [""],
        "CinemaEOS R5C" : [""],
        "EOS R3" : ["RAW","RAW Light","ALL-I HEVC","ALL-I AVC","IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
        "EOS R5" : ["RAW","RAW Light","ALL-I HEVC","ALL-I AVC","IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
        "EOS R6 Mark2" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
        "EOS R6" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
        "EOS R8" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
        "EOS R7" : ["IPB HEVC","IPB AVC","IPB Light HEVC","IPB Light AVC"],
        "EOS 1D-X Mark3" : [""],
        
        //Panasonic
        "S1H" : [],
        "S5M2X" : ["Prores 422 HQ","Prores 422","HEVC ALL-I","HEVC LongGOP","AVC ALL-I","AVC LongGOP"],
        "S5M2" : ["HEVC","AVC"],
        "GH6" : ["Prores 422 HQ","Prores 422","HEVC IPB","AVC ALL-I","AVC IPB"],
        "G9M2" : [],
        
    ]
