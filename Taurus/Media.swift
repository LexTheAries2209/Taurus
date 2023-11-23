//
//  Media.swift
//  Taurus
//
//  Created by 吴坤城 on 11/23/23.
//

import Foundation

//储存卡库
    public let MediaName : [String:[String]] = [
        //ARRI
        "AMIRA" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        "ALEXA Classic" : ["SxS Pro+ 128GB"],
        "ALEXA XT" : ["SxS Pro+ 128GB","CFast2.0 128GB","XR Capture Drive 512GB"],
        "ALEXA SXT" : ["SxS Pro+ 128GB","SxS Pro+ 256GB","CFast2.0 256GB","XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        "ALEXA 35" : ["Compact Drive 1TB","Compact Drive 2TB"],
        "ALEXA Mini" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        "ALEXA Mini LF" : ["Compact Drive 1TB","Compact Drive 2TB"],
        "ALEXA LF" : ["SxS Pro+ 256GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        "ALEXA 65" : ["XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        
        //SONY
        "Cinealta Venice 2[8K]": ["AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"],
        "Cinealta Venice 2[6K]": ["AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"],
        "Cinealta Venice" : ["SxS Pro+ 128GB","SxS Pro+ 256GB","SxS Pro-X 120GB","SxS Pro-X 240GB","AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB","XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"],
        "Cinealta Burano" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "FX 9" : ["XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"],
        "FX 6" : ["CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "FX 3" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "FX 30" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "Alpha 1" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "A9M3" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "A7S3" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "A7R5" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "A7M4" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB","CFExpress TypeA 80GB","CFExpress TypeA 160GB","CFExpress TypeA 320GB","CFExpress TypeA 640GB","CFExpress TypeA 960GB","CFExpress TypeA 1920GB"],
        "A7C2" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "A7CR" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        
        //Canon
        "CinemaEOS C500 Mark2" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "CinemaEOS C300 Mark3" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "CinemaEOS C300 Mark2" : [""],
        "CinemaEOS C200" : [""],
        "CinemaEOS C100 Mark2" : [""],
        "CinemaEOS C70" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "CinemaEOS R5C" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "EOS R3" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "EOS R5" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "EOS R6 Mark2" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "EOS R6" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "EOS R8" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "EOS R7" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "EOS 1D-X Mark3" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        
        //RED
        "V-Raptor XL[8K VV]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "V-Raptor[8K VV]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "V-Raptor XL[8K S35]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "V-Raptor[8K S35]" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "KEMODO-X" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "KEMODO" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        
        //Panasonic
        "S1H" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "S5M2X" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "S5M2" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
        "GH6" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB"],
        "G9M2" : ["SDXC 128GB","SDXC 256GB","SDXC 512GB"],
    ]
