//
//  ContentView.swift
//  Taurus
//
//  Created by 吴坤城 on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
//机型库
    let CameraModel : [String:[String]] = [
        "ARRI" : ["ALEXA 35","ALEXA 65","ALEXA Mini LF","ALEXA LF","ALEXA Mini","ALEXA SXT","ALEXA XT","ALEXA Classic","AMIRA"],
        //"RED" : ["V-Raptor XL[8K VV]","V-Raptor[8K VV]","V-Raptor XL[8K S35]","V-Raptor[8K S35]","KEMODO-X","KEMODO","Ranger[Monstro 8K VV]","Ranger[Helium 8K S35]","Ranger[Gemini 5K S35]","DSMC2[Monstro 8K VV]","DSMC2[Helium 8K S35]","DCMC2[Gemini 5K S35]","DSMC2[Dragon-X 6K S35]","Raven[Dragon 4.5K]","Weapon[Monstro 8K VV]","Weapon[Helium 8K S35]","Weapon[Dragon 6K S35]","Epic-W[Gemini 5K S35]","Epic-W[Dragon 6K S35]","Epic-W[Helium 8K S35]","Epic[Dragon 6K S35]","Epic[Mysterium-X 5K S35]","Scarlet-W[Dragon 5K S35]","Scarlet[Dragon 6K S35]","Scarlet[Mysterium-X 5K S35]","RED ONE M-X[Mysterium-X 4K S35]","RED ONE[Mysterium 4K S35]"],
        "SONY" : ["Cinealta Venice 2[8K]","Cinealta Venice 2[6K]","Cinealta Venice","Cinealta Burano","FX 9","FX 6","FX 3","FX 30","Alpha 1","A9M3","A7S3","A7R5","A7M4","A7C2","A7CR"],
        "Canon" : ["CinemaEOS C500 Mark2","CinemaEOS C300 Mark3","CinemaEOS C300 Mark2","CinemaEOS C200","CinemaEOS C100 Mark2","CinemaEOS C70","CinemaEOS R5C","EOS R3","EOS R5","EOS R6 Mark2","EOS R6","EOS R8","EOS R7","EOS 5D Mark4","EOS 1D-X Mark3"],
        //"Kinefinity" : ["MAVO Edge 8K","MAVO Edge 6K","MAVO Mark2","MAVO Mark2 LF"],
        //"Nikon" : ["Z 9","Z 8","Z f","Z 7II","Z 7","Z 6II","Z 6","Z 5","Z fc","Z 50","Z 30"],
        //"Blackmagicdesign" : ["Blackmagic URSA Mini Pro 12K [OLPF]","Blackmagic URSA Mini Pro 12K","Blackmagic URSA Mini Pro 4.6K G2","Blackmagic URSA Mini Pro 4.6K","Blackmagic Cinema Camera 6K","Blackmagic Pocket Cinema Camera 6K Pro","Blackmagic Pocket Cinema Camera 6K G2","Blackmagic Pocket Cinema Camera 6K","Blackmagic Pocket Cinema Camera 4K"],
        //"Fujifilm" : ["GFX100 II","X-H2S","X-H2","X-T5"],
        //"Panasonic" : ["S1H","S5M2X","S5M2","GH6","G9M2"],
        //"DJI" : ["Ronin 4D[8K]","Ronin 4D[6K]","Inspire 3"],
        //"ZCam" : [""]
    ]
    
    
    
    
//编码库
    let CodecName : [String:[String]] = [
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
        "RED ONE[Mysterium 4K S35]" : ["无相关数据"],
        "RED ONE M-X[Mysterium-X 4K S35]" : ["无相关数据"],
        "Scarlet[Mysterium-X 5K S35]" : ["无相关数据"],
        "Scarlet[Dragon 6K S35]" : ["无相关数据"],
        "Scarlet-W[Dragon 5K S35]" : ["无相关数据"],
        "Epic[Mysterium-X 5K S35]" : ["无相关数据"],
        
        //SONY
        "Cinealta Venice 2[8K]": ["X-OCN XT","X-OCN ST","X-OCN LT","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
        "Cinealta Venice 2[6K]": ["X-OCN XT","X-OCN ST","X-OCN LT","Prores 4444 XQ","Prores 4444","Prores 422 HQ"],
        "Cinealta Venice" : ["X-OCN XT","X-OCN ST","X-OCN LT","RAW SQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422 Proxy","XAVC-I Class300","XAVC-I Class480","MPEG-2 LongGOP"],
        "Cinealta Burano" : ["X-OCN LT","XAVC-H Intra HQ","XAVC-H Intra SQ","XAVC-H LongGOP","XAVC Intra","XAVC LongGOP"],
        "FX 9" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","MPEG-2 LongGOP"],
        "FX 6" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD"],
        "FX 3" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
        "FX 30" : ["XAVC S-I DCI 4K","XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
        "Alpha 1" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 8K","XAVC HS 4K"],
        "A9M3" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
        "A7S3" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
        "A7R5" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 8K","XAVC HS 4K"],
        "A7M4" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
        "A7C2" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
        "A7CR" : ["XAVC S-I 4K","XAVC S-I HD","XAVC S 4K","XAVC S HD","XAVC HS 4K"],
       
        
        
        
    ]
 
//分辨率库
    let ResolutionName : [String:[String]] = [
        //default 16:9
        
        //SONY
        
        "FX 9_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
        "FX 9_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
        "FX 9_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "FX 9_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]"],
        "FX 9_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]"],
        "FX 9_MPEG-2 LongGOP" : ["HD FF[10bit 4:2:2][23.98p/25p/29.97p]","HD S35[10bit 4:2:2][23.98p/25p/29.97p]"],
    
        "FX 6_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
        "FX 6_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
        "FX 6_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "FX 6_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]"],
        "FX 6_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]"],
        
        "FX 3_XAVC S-I DCI 4K" : ["DCI 4K FF[10bit 4:2:2][23.98p/24p]","DCI 4K FF[10bit 4:2:2][25p]","DCI 4K FF[10bit 4:2:2][50p]","DCI 4K FF[10bit 4:2:2][59.94p]"],
        "FX 3_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
        "FX 3_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "FX 3_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]"],
        "FX 3_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]"],
        "FX 3_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
       
        "FX 30_XAVC S-I DCI 4K" : ["DCI 4K S35[10bit 4:2:2][23.98p/24p]","DCI 4K S35[10bit 4:2:2][25p]","DCI 4K S35[10bit 4:2:2][29.97p]","DCI 4K S35[10bit 4:2:2][50p]","DCI 4K S35[10bit 4:2:2][59.94p]"],
        "FX 30_XAVC S-I 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
        "FX 30_XAVC S-I HD" : ["HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "FX 30_XAVC HS 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:0][100p/119.88p]"],
        "FX 30_XAVC S 4K" : ["UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:2][100p/119.88p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]","UHD S35[8bit 4:2:0][100p/119.88p]"],
        "FX 30_XAVC S HD" : ["HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        
        "Alpha 1_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
        "Alpha 1_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "Alpha 1_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
        "Alpha 1_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        "Alpha 1_XAVC HS 8K" : ["8K FF[10bit 4:2:2][23.98p/25p/29.97p]","8K FF[10bit 4:2:0][23.98p/25p/29.97p]"],
        "Alpha 1_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
        
        "A9M3_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
        "A9M3_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "A9M3_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
        "A9M3_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        "A9M3_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
        
         "A7R5_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]"],
        "A7R5_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "A7R5_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]"],
        "A7R5_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        "A7R5_XAVC HS 8K" : ["8K FF[10bit 4:2:0][23.98p/25p]"],
        "A7R5_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:0][23.98p]",],
        
        "A7S3_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]"],
        "A7S3_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "A7S3_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD FF[10bit 4:2:0][100p/119.88p]"],
        "A7S3_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:2][100p/119.88p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD FF[8bit 4:2:0][100p/119.88p]"],
        "A7S3_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        
        "A7M4_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
        "A7M4_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "A7M4_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
        "A7M4_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        "A7M4_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
        
        "A7C2_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]","UHD S35[10bit 4:2:2][50p]","UHD S35[10bit 4:2:2][59.94p]"],
        "A7C2_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "A7C2_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]","UHD S35[8bit 4:2:0][50p/59.94p]"],
        "A7C2_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        "A7C2_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][50p/59.94p]","UHD S35[10bit 4:2:0][23.98p]","UHD S35[10bit 4:2:0][50p/59.94p]"],
        
        "A7CR_XAVC S-I 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p]","UHD FF[10bit 4:2:2][29.97p]","UHD FF[10bit 4:2:2][50p]","UHD FF[10bit 4:2:2][59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p]","UHD S35[10bit 4:2:2][29.97p]"],
        "A7CR_XAVC S-I HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p]","HD FF[10bit 4:2:2][29.97p]","HD FF[10bit 4:2:2][50p]","HD FF[10bit 4:2:2][59.94p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p]","HD S35[10bit 4:2:2][29.97p]","HD S35[10bit 4:2:2][50p]","HD S35[10bit 4:2:2][59.94p]"],
        "A7CR_XAVC S 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][25p/29.97p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[8bit 4:2:0][23.98p]","UHD FF[8bit 4:2:0][25p/29.97p]","UHD FF[8bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:2][25p/29.97p]","UHD S35[8bit 4:2:0][23.98p]","UHD S35[8bit 4:2:0][25p/29.97p]"],
        "A7CR_XAVC S HD" : ["HD FF[10bit 4:2:2][23.98p]","HD FF[10bit 4:2:2][25p/29.97p]","HD FF[10bit 4:2:2][50p/59.94p]","HD FF[8bit 4:2:0][23.98p]","HD FF[8bit 4:2:0][25p/29.97p]","HD FF[8bit 4:2:0][50p/59.94p]","HD FF[8bit 4:2:0][100p/119.88p]","HD S35[10bit 4:2:2][23.98p]","HD S35[10bit 4:2:2][25p/29.97p]","HD S35[10bit 4:2:2][50p/59.94p]","HD S35[8bit 4:2:0][23.98p]","HD S35[8bit 4:2:0][25p/29.97p]","HD S35[8bit 4:2:0][50p/59.94p]","HD S35[8bit 4:2:0][100p/119.88p]"],
        "A7CR_XAVC HS 4K" : ["UHD FF[10bit 4:2:2][23.98p]","UHD FF[10bit 4:2:2][50p/59.94p]","UHD FF[10bit 4:2:0][23.98p]","UHD FF[10bit 4:2:0][50p/59.94p]","UHD S35[10bit 4:2:2][23.98p]","UHD S35[10bit 4:2:0][23.98p]",],
        
        
        //ARRI
        "AMIRA_ARRIRAW" : ["2.8K S35[2880*1620]"],
        "AMIRA_Prores 4444 XQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","HD S35[From 2880*1620]","HD S16[From 1600*900]"],
        "AMIRA_Prores 4444" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","HD S35[From 2880*1620]","HD S16[From 1600*900]"],
        "AMIRA_Prores 422 HQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","HD S35[From 2880*1620]","HD S16[From 1600*900]"],
        "AMIRA_Prores 422" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","HD S35[From 2880*1620]","HD S16[From 1600*900]"],
        "AMIRA_Prores 422 LT" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2K S35[2048*1152][From 2868*1612]","HD S35[From 2880*1620]","HD S16[From 1600*900]"],
        "AMIRA_MPEG-2 HD 422" : ["HD S35[From 2880*1620]"],
        
        "ALEXA Classic_Prores 4444" : ["2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        "ALEXA Classic_Prores 422 HQ" : ["2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        "ALEXA Classic_Prores 422" : ["2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        
        "ALEXA XT_ARRIRAW" : ["3.4K S35[3424*2202][OG]","2.8K S35[2880*2160][4:3]","2.8K S35[2880*1620]","2.6K S35[2578*2160][6:5]"],
        "ALEXA XT_Prores 4444 XQ" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        "ALEXA XT_Prores 4444" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        "ALEXA XT_Prores 422 HQ" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        "ALEXA XT_Prores 422" : ["3.2K S35[3168*1782]","2K S35[2048*1536][From 2868*2152][4:3]","2K S35[2048*1152][From 2868*1614]","HD S35[From 2880*1620]"],
        
        "ALEXA SXT_ARRIRAW" : ["3.4K S35[3424*2202][OG]","3.2K S35[3168*1782]","2.8K S35[2880*2160][4:3]","2.8K S35[2880*1620]","2.6K S35[2578*2160][6:5]"],
        "ALEXA SXT_Prores 4444 XQ" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","HD S35[From 2880*1620]"],
        "ALEXA SXT_Prores 4444" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","HD S35[From 2880*1620]"],
        "ALEXA SXT_Prores 422 HQ" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","HD S35[From 2880*1620]"],
        "ALEXA SXT_Prores 422" : ["4K S35[4096*2636][From 3414*2198][2.39:1]","4K S35[4096*1716][From 2560*2146][6:5 ANA]","UHD S35[From 3200*1800]","3.4K S35[3424*2202][OG]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2880*1620]","2K S35[2048*858][From 2560*2146][6:5 ANA]","HD S35[From 2880*1620]"],
        
        "ALEXA 35_ARRIRAW" :["4.6K S35[4608*3164][OG]","4.6K S35[4608*2592]","4K S35[4096*2304]","UHD S35","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","3K S35[3072*3072][1:1]"],
        "ALEXA 35_Prores 4444 XQ" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","UHD S35[From 4096*2304]","2K S35[2048*1152][From 4096*2304]","HD S35[From 4096*2304]","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","3K S35[3072*3072][1:1]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","UHD S35[From 2743*3086][8:9 ANA]","2K S16[2048*1152]"],
        "ALEXA 35_Prores 4444" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","UHD S35[From 4096*2304]","2K S35[2048*1152][From 4096*2304]","HD S35[From 4096*2304]","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","3K S35[3072*3072][1:1]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","UHD S35[From 2743*3086][8:9 ANA]","2K S16[2048*1152]"],
        "ALEXA 35_Prores 422 HQ" :["4.6K S35[4608*3164][OG]","4K S35[4096*2304][From 4608*2592]","4K S35[4096*2304]","UHD S35[From 4096*2304]","2K S35[2048*1152][From 4096*2304]","HD S35[From 4096*2304]","4K S35[4096*2048][2:1]","3.3K S35[3328*2790][6:5]","4K S35[4096*1716][From 3328*2790][6:5 ANA]","3K S35[3072*3072][1:1]","3.8K S35[3840*1920][From 3072*3072][1:1 ANA]","UHD S35[From 2743*3086][8:9 ANA]","2K S16[2048*1152]"],
        
        "ALEXA Mini_ARRIRAW" : ["3.4K S35[3424*2202][OG]","2.8K S35[2880*1620]"],
        "ALEXA Mini_Prores 4444 XQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","HD S35[From 2880*1620]","HD S35[From 1920*2160][8:9 ANA]","HD S16[From 1600*900]"],
        "ALEXA Mini_Prores 4444" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","HD S35[From 2880*1620]","HD S35[From 1920*2160][8:9 ANA]","HD S16[From 1600*900]"],
        "ALEXA Mini_Prores 422 HQ" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","HD S35[From 2880*1620]","HD S35[From 1920*2160][8:9 ANA]","HD S16[From 1600*900]"],
        "ALEXA Mini_Prores 422" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","HD S35[From 2880*1620]","HD S35[From 1920*2160][8:9 ANA]","HD S16[From 1600*900]"],
        "ALEXA Mini_Prores 422 LT" : ["UHD S35[From 3200*1800]","3.2K S35[3200*1800]","2.8K S35[2880*2160][4:3]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*858][From 2560*2145][6:5 ANA]","HD S35[From 2880*1620]","HD S35[From 1920*2160][8:9 ANA]","HD S16[From 1600*900]"],
        
        "ALEXA Mini LF_ARRIRAW" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","3.4K S35[3424*2202][3:2]","2.8K LF[2880*2880][1:1]"],
        "ALEXA Mini LF_Prores 4444 XQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","UHD LF","3.2K S35[3200*1800]","2.8K LF[2880*2880][1:1]","2.8K S35[2880*2160][4:3]","2K LF[2048*1152][From UHD]","HD LF[From 4320*2430]","HD LF[From UHD]","HD S35[From 2880*1620]"],
        "ALEXA Mini LF_Prores 4444" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","UHD LF","3.2K S35[3200*1800]","2.8K LF[2880*2880][1:1]","2.8K S35[2880*2160][4:3]","2K LF[2048*1152][From UHD]","HD LF[From 4320*2430]","HD LF[From UHD]","HD S35[From 2880*1620]"],
        "ALEXA Mini LF_Prores 422 HQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF[From 4320*2430]","UHD LF","3.2K S35[3200*1800]","2.8K LF[2880*2880][1:1]","2.8K S35[2880*2160][4:3]","2K LF[2048*1152][From UHD]","HD LF[From 4320*2430]","HD LF[From UHD]","HD S35[From 2880*1620]"],
        
        "ALEXA LF_ARRIRAW" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF"],
        "ALEXA LF_Prores 4444 XQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","HD LF[From UHD]"],
        "ALEXA LF_Prores 4444" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","HD LF[From UHD]"],
        "ALEXA LF_Prores 422 HQ" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","HD LF[From UHD]"],
        "ALEXA LF_Prores 422" : ["4.5K LF[4448*3096][OG]","4.5K LF[4448*1856][2.39:1]","UHD LF","2K LF[2048*1152][From UHD]","HD LF[From UHD]"],
        
        "ALEXA 65_ARRIRAW" : ["6.5K 65mm[6560*3100][OG]","5.1K 65mm[5120*2880]","4.3K LF[4320*2880][3:2]","4.5K LF[4448*3096][3:2]","UHD LF"]
        
    ]
    
//储存卡库
    let MediaName : [String:[String]] = [
        "AMIRA" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        "ALEXA Classic" : ["SxS Pro+ 128GB"],
        "ALEXA XT" : ["SxS Pro+ 128GB","CFast2.0 128GB","XR Capture Drive 512GB"],
        "ALEXA SXT" : ["SxS Pro+ 128GB","SxS Pro+ 256GB","CFast2.0 256GB","XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        "ALEXA 35" : ["Compact Drive 1TB","Compact Drive 2TB"],
        "ALEXA Mini" : ["CFast2.0 128GB","CFast2.0 256GB","CFast2.0 512GB"],
        "ALEXA Mini LF" : ["Compact Drive 1TB","Compact Drive 2TB"],
        "ALEXA LF" : ["SxS Pro+ 256GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        "ALEXA 65" : ["XR Capture Drive 512GB","SXR Capture Drive 1TB","SXR Capture Drive 2TB"],
        
        "Cinealta Venice 2[8K]": ["AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"],
        "Cinealta Venice 2[6K]": ["AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB"],
        "Cinealta Venice" : ["SxS Pro+ 128GB","SxS Pro+ 256GB","SxS Pro-X 120GB","SxS Pro-X 240GB","AXS S24 256GB","AXS S24 512GB","AXS S24 1TB","AXS S48 512GB","AXS S48 1TB","AXS S66 1TB","XQD 120GB","XQD 128GB","XQD 240GB","XQD 256GB"],
        "Cinealta Burano" : ["CFExpress TypeB 128GB","CFExpress TypeB 256GB","CFExpress TypeB 330GB","CFExpress TypeB 512GB","CFExpress TypeB 660GB","CFExpress TypeB 1TB","CFExpress TypeB 1.3TB","CFExpress TypeB 2TB","CFExpress TypeB 4TB"],
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
    ]
    
    
//变量定义区
    @State var BrandName = "请选择品牌"
    
    @State var CameraName = "请选择机型"
    
    @State var Codec = "请选择编码"
    
    @State var Resolution = "请选择分辨率"
    
    @State var Media = "请选择储存卡"
    
    @State var Rate = "请选择帧率"
    
    var body: some View {
        
        VStack {
            
            //主功能选择
            TabView {
                
                //数据计算器模块//
                VStack{
                    
                    Spacer()
                    
                    //重置按键
                    Button("重置") {
                        BrandName = "请选择品牌"
                        CameraName = "请选择机型"
                        Codec = "请选择编码"
                        Resolution = "请选择分辨率"
                        Media = "请选择储存卡"
                        Rate = "请选择帧率"
                    }
                    
                    
                    Spacer()
                    
                    //选择器与计算功能
                    HStack{
                        
                        //选择器模块
                        VStack (spacing:10){
                            
                            
                            //品牌选择
                            Picker(selection: $BrandName, label: Text("请选择品牌").frame(width: 100,alignment: .center)) {
                                ForEach(CameraModel.keys.sorted(),id:\.self) { brand in
                                    Text(brand).tag(brand)
                                }
                            }
                            
                            //机型选择
                            if let models = CameraModel[BrandName] {
                                Picker(selection: $CameraName, label: Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    ForEach(models, id:\.self) { model in
                                        Text(model).tag(model)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $CameraName, label:Text("请选择机型").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //编码选择
                           
                                if let codec = CodecName[CameraName] {
                                    Picker(selection: $Codec, label: Text("请选择编码").frame(width: 100,alignment: .center)) {
                                        ForEach(codec, id:\.self) { codecs in
                                            Text(codecs).tag(codecs)
                                        }
                                    }
                                }
                                else {
                                    Picker(selection: $Codec, label:Text("请选择编码").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                            
                            
                            
                            //分辨率选择
                            @State var CodecAndCamera = CameraName + "_" + Codec
                            
                            if let resolutions = ResolutionName[CodecAndCamera] {
                                Picker(selection: $Resolution, label: Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    ForEach(resolutions,id:\.self) { resolution in
                                        Text(resolution).tag(resolution)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $Resolution, label:Text("请选择分辨率").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //储存卡选择
                            if let medias = MediaName[CameraName] {
                                Picker(selection: $Media, label: Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                    ForEach(medias,id:\.self) { media in
                                        Text(media).tag(media)
                                    }
                                }
                            }
                            else {
                                Picker(selection: $Media, label:Text("请选择储存卡").frame(width: 100,alignment: .center)) {
                                    Text("无选项")
                                }
                            }
                            
                            //帧率选择
                            if BrandName == "ARRI" {
                                if Media == "请选择储存卡" {
                                    Picker(selection: $Rate, label:Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        Text("无选项")
                                    }
                                }
                                else {
                                    Picker(selection: $Rate, label: Text("请选择帧率").frame(width: 100,alignment: .center)) {
                                        ForEach(availableRates(),id:\.self) { rate in
                                            Text(rate).tag(rate)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 20.0)
                        Spacer()
                        
                        //编码乘积
                        var CodecSpeed: Double {
                            switch Codec {
                            case "ARRIRAW" :
                                return 600
                            case "Prores 4444 XQ" :
                                return 400
                            case "Prores 4444" :
                                return 264
                            case "Prores 422 HQ" :
                                return 176
                            case "Prores 422" :
                                return 117.6
                            case "Prores 422 LT" :
                                return 81.2
                            case "MPEG-2 HD 422" :
                                return 66
                            default :
                                return 0.00001
                            }
                        }
                        
                        //分辨率乘积
                        var ResolutionMultiplier: Double {
                          switch Resolution {
                          case "HD S35[From 2880*1620]","HD S16[From 1600*900]","HD S35[From 4096*2304]","HD S35[From 1920*2160][8:9 ANA]","HD LF[From 4320*2430]","HD LF[From UHD]" :
                              return 1
                          case "2K S35[2048*1152][From 2868*1614]","2K S35[2048*1152][From 2868*1612]","2K S35[2048*1152][From 4096*2304]","2K LF[2048*1152][From UHD]","2K S16[2048*1152]","2K S35[2048*1152][From 2880*1620]":
                              return 1.14
                          case "2K S35[2048*858][From 2560*2146][6:5 ANA]","2K S35[2048*858][From 2560*2145][6:5 ANA]" :
                              return 0.85
                          case "2K S35[2048*1536][From 2868*2152][4:3]" :
                              return 1.5
                          case "2.8K S35[2880*1620]" :
                              return 2.25
                          case "2.6K S35[2578*2160][6:5]" :
                              return 2.69
                          case "3.2K S35[3168*1782]" :
                              return 2.72
                          case "3.2K S35[3200*1800]" :
                              return 2.77
                          case "2.8K S35[2880*2160][4:3]":
                              return 3
                          case "4K S35[4096*1716][From 2560*2146][6:5 ANA]","4K S35[4096*1716][From 3328*2790][6:5 ANA]" :
                              return 3.39
                          case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
                              return 3.56
                          case "3.4K S35[3424*2202][OG]","3.4K S35[3424*2202][3:2]" :
                              return 3.64
                          case "2.8K LF[2880*2880][1:1]","UHD LF","UHD S35","UHD S35[From 3200*1800]","UHD S35[From 4096*2304]","UHD S35[From 2743*3086][8:9 ANA]","UHD LF[From 4320*2430]","4.5K LF[4448*1856][2.39:1]":
                              return 4
                          case "4K S35[4096*2048][2:1]":
                              return 4.05
                          case "3.3K S35[3328*2790][6:5]" :
                              return 4.48
                          case "4K S35[4096*2304]","3K S35[3072*3072][1:1]","4K S35[4096*2304][From 4608*2592]":
                              return 4.55
                          case "4K S35[4096*2636][From 3414*2198][2.39:1]" :
                              return 5.2
                          case "4.6K S35[4608*2592]" :
                              return 5.76
                          case "4.3K LF[4320*2880][3:2]" :
                              return 6
                          case "4.5K LF[4448*3096][3:2]","4.5K LF[4448*3096][OG]":
                              return 6.64
                          case "4.6K S35[4608*3164][OG]" :
                              return 7
                          case "5.1K 65mm[5120*2880]" :
                              return 7.11
                          case "6.5K 65mm[6560*3100][OG]" :
                              return 9.8
                          default:
                              return 0.00001
                          }
                        }
                    
                        //旧机型Prores编码码率乘积
                        var ProresCompensation: Double {
                            switch CameraName {
                            case "AMIRA","ALEXA Classic","ALEXA XT","ALEXA SXT","ALEXA Mini","ALEXA LF" :
                                return 1.125
                            case "ALEXA 35","ALEXA Mini LF":
                                return 1
                            default :
                                return 1
                            }
                        }
                        
                        //ALEXA 35 ARRIRAW编码乘积
                        var ARRIRAWCompensation: Double {
                            switch CameraName {
                            case "ALEXA 35" :
                                return 1.075
                            default :
                                return 1
                            }
                        }
                        
                        //索尼机型码率计算区
                        @State var SonyCodecName: String = Codec + "_" + Resolution
                        var SonyCodecSpeed: Double {
                            switch SonyCodecName {
                            case "XAVC S HD_HD FF[10bit 4:2:2][23.98p]","XAVC S HD_HD FF[8bit 4:2:0][23.98p]","XAVC S HD_HD FF[10bit 4:2:2][25p/29.97p]","XAVC S HD_HD FF[8bit 4:2:0][25p/29.97p]","XAVC S HD_HD FF[10bit 4:2:2][50p/59.94p]","XAVC S HD_HD FF[8bit 4:2:0][50p/59.94p]","XAVC S HD_HD S35[10bit 4:2:2][23.98p]","XAVC S HD_HD S35[8bit 4:2:0][23.98p]","XAVC S HD_HD S35[10bit 4:2:2][25p/29.97p]","XAVC S HD_HD S35[8bit 4:2:0][25p/29.97p]","XAVC S HD_HD S35[10bit 4:2:2][50p/59.94p]","XAVC S HD_HD S35[8bit 4:2:0][50p/59.94p]","MPEG-2 LongGOP_HD FF[10bit 4:2:2][23.98p/25p/29.97p]","MPEG-2 LongGOP_HD S35[10bit 4:2:2][23.98p/25p/29.97p]" :
                                return 50
                            case "XAVC S HD_HD FF[8bit 4:2:0][100p/119.88p]","XAVC S HD_HD S35[8bit 4:2:0][100p/119.88p]" :
                                return 60
                            case "XAVC S-I HD_HD FF[10bit 4:2:2][23.98p]","XAVC S-I HD_HD S35[10bit 4:2:2][23.98p]" :
                                return 89
                            case "XAVC S-I HD_HD FF[10bit 4:2:2][25p]","XAVC S-I HD_HD S35[10bit 4:2:2][25p]" :
                                return 93
                            case "XAVC HS 4K_UHD FF[10bit 4:2:2][23.98p]","XAVC HS 4K_UHD FF[10bit 4:2:0][23.98p]","XAVC S 4K_UHD FF[10bit 4:2:2][23.98p]","XAVC S 4K_UHD FF[8bit 4:2:0][23.98p]","XAVC S 4K_UHD FF[8bit 4:2:0][25p/29.97p]","XAVC HS 4K_UHD S35[10bit 4:2:2][23.98p]","XAVC HS 4K_UHD S35[10bit 4:2:0][23.98p]","XAVC S 4K_UHD S35[10bit 4:2:2][23.98p]","XAVC S 4K_UHD S35[8bit 4:2:0][23.98p]","XAVC S 4K_UHD S35[8bit 4:2:0][25p/29.97p]" :
                                return 100
                            case "XAVC S-I HD_HD FF[10bit 4:2:2][29.97p]","XAVC S-I HD_HD S35[10bit 4:2:2][29.97p]" :
                                return 111
                            case "XAVC S 4K_UHD FF[10bit 4:2:2][25p/29.97p]","XAVC S 4K_UHD S35[10bit 4:2:2][25p/29.97p]" :
                                return 140
                            case "XAVC HS 4K_UHD FF[10bit 4:2:0][50p/59.94p]","XAVC S 4K_UHD FF[8bit 4:2:0][50p/59.94p]","XAVC HS 4K_UHD S35[10bit 4:2:0][50p/59.94p]","XAVC S 4K_UHD S35[8bit 4:2:0][50p/59.94p]" :
                                return 150
                            case "XAVC S-I HD_HD FF[10bit 4:2:2][50p]","XAVC S-I HD_HD S35[10bit 4:2:2][50p]" :
                                return 185
                            case "XAVC HS 4K_UHD FF[10bit 4:2:2][50p/59.94p]","XAVC HS 4K_UHD FF[10bit 4:2:0][100p/119.88p]","XAVC S 4K_UHD FF[10bit 4:2:2][50p/59.94p]","XAVC S 4K_UHD FF[8bit 4:2:0][100p/119.88p]","XAVC HS 4K_UHD S35[10bit 4:2:2][50p/59.94p]","XAVC HS 4K_UHD S35[10bit 4:2:0][100p/119.88p]","XAVC S 4K_UHD S35[10bit 4:2:2][50p/59.94p]","XAVC S 4K_UHD S35[8bit 4:2:0][100p/119.88p]" :
                                return 200
                            case "XAVC S-I HD_HD FF[10bit 4:2:2][59.94p]","XAVC S-I HD_HD S35[10bit 4:2:2][59.94p]" :
                                return 222
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][23.98p/24p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][23.98p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][23.98p/24p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][23.98p]" :
                                return 240
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][25p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][25p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][25p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][25p]" :
                                return 250
                            case "XAVC HS 4K_UHD FF[10bit 4:2:2][100p/119.88p]","XAVC S 4K_UHD FF[10bit 4:2:2][100p/119.88p]","XAVC HS 4K_UHD S35[10bit 4:2:2][100p/119.88p]","XAVC S 4K_UHD S35[10bit 4:2:2][100p/119.88p]" :
                                return 280
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][29.97p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][29.97p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][29.97p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][29.97p]" :
                                return 300
                            case "XAVC HS 8K_8K FF[10bit 4:2:0][23.98p/25p/29.97p]","XAVC HS 8K_8K FF[10bit 4:2:0][23.98p/25p]" :
                                return 400
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][50p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][50p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][50p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][50p]" :
                                return 500
                            case "XAVC HS 8K_8K FF[10bit 4:2:2][23.98p/25p/29.97p]":
                                return 520
                            case "XAVC S-I DCI 4K_DCI 4K FF[10bit 4:2:2][59.94p]","XAVC S-I 4K_UHD FF[10bit 4:2:2][59.94p]","XAVC S-I DCI 4K_DCI 4K S35[10bit 4:2:2][59.94p]","XAVC S-I 4K_UHD S35[10bit 4:2:2][59.94p]" :
                                return 600
  
                            default :
                                return 0.00000001
                            }
                        }
                        
                        //存储卡容量乘积
                        var MediaCapacity: Double {
                            switch Media {
                            case "CFExpress TypeA 80GB" :
                                return 80
                            case "SxS Pro-X 120GB" :
                                return 120
                            case "CFast2.0 128GB","SxS Pro+ 128GB","CFExpress TypeB 128GB","SDXC 128GB" :
                                return 128
                            case "CFExpress TypeA 160GB" :
                                return 160
                            case "SxS Pro-X 240GB" :
                                return 240
                            case "CFast2.0 256GB","SxS Pro+ 256GB","AXS S24 256GB","CFExpress TypeB 256GB","SDXC 256GB" :
                                return 256
                            case "CFExpress TypeA 320GB" :
                                return 320
                            case "CFExpress TypeB 330GB" :
                                return 330
                            case "CFast2.0 512GB","XR Capture Drive 512GB","AXS S24 512GB","AXS S48 512GB","CFExpress TypeB 512GB","SDXC 512GB" :
                                return 512
                            case "CFExpress TypeA 640GB" :
                                return 640
                            case "CFExpress TypeB 660GB" :
                                return 660
                            case "CFExpress TypeA 960GB" :
                                return 960
                            case "SXR Capture Drive 1TB","Compact Drive 1TB","AXS S24 1TB","AXS S48 1TB","AXS S66 1TB","CFExpress TypeB 1TB","SDXC 1TB" :
                                return 1000
                            case "CFExpress TypeB 1.3TB" :
                                return 1333
                            case "CFExpress TypeA 1920GB" :
                                return 1920
                            case "SXR Capture Drive 2TB","Compact Drive 2TB","CFExpress TypeB 2TB","SDXC 2TB" :
                                return 2000
                            case "CFExpress TypeB 4TB" :
                                return 4000
                            default :
                                return 0
                            }
                        }
                        
                        //加入补偿的编码速度
                        var CodecSpeedCount: Double {
                            switch Codec {
                            case "Prores 4444 XQ","Prores 4444","Prores 422 HQ","Prores 422","Prores 422LT" :
                                return CodecSpeed*ProresCompensation
                            case "ARRIRAW" :
                                return CodecSpeed*ARRIRAWCompensation
                            default :
                                return CodecSpeed
                            }
                        }
                        
                        //帧率乘积
                        var RateSpeed: Double {
                            switch Rate {
                            case "0.750" :
                                return 0.75
                            case "1.000" :
                                return 1
                            case "23.976","24.000" :
                                return 24
                            case "25.000" :
                                return 25
                            case "29.970","30.000" :
                                return 30
                            case "40.000" :
                                return 40
                            case "48.000":
                                return 48
                            case "50.000" :
                                return 50
                            case "59.940","60.000" :
                                return 60
                            case "72.000" :
                                return 72
                            case "75.000" :
                                return 75
                            case "90.000" :
                                return 90
                            case "96.000" :
                                return 96
                            case "100.000" :
                                return 100
                            case "120.000" :
                                return 120
                            case "150.000" :
                                return 150
                            case "200.000" :
                                return 200
                            case "ERROR" :
                                return 24
                            default :
                                return 0
                            }
                        }
                        
                        //计算帧率乘积
                        let RateMultiplier = RateSpeed/24
                        
                        //计算数据输出区
                        VStack(alignment: .center){
                            if BrandName != "SONY" {
                                Text("可录制时长[Min]：\(MediaCapacity*7629.39453125/60/CodecSpeedCount/ResolutionMultiplier/RateMultiplier)")
                                Text("数据码率[mbps]: \(CodecSpeedCount*ResolutionMultiplier*RateMultiplier)")
                                Text("每小时数据占盘量[GB]：\(CodecSpeedCount*ResolutionMultiplier*RateMultiplier*450/1024)")
                                if Codec == "ARRIRAW" {
                                Text("每小时数据占盘量[GB][HDE]：\(CodecSpeed*ResolutionMultiplier*RateMultiplier*RateMultiplier*270/1024)")
                            }
                        }
                            else {
                                Text("可录制时长[Min]：\(MediaCapacity*7629.39453125/60/SonyCodecSpeed)")
                                Text("数据码率[mbps]: \(SonyCodecSpeed)")
                                Text("每小时数据占盘量[GB]：\(SonyCodecSpeed*450/1024)")
                            }
                                
                        }
                        .padding([.leading,.trailing],30)
        
                    }
                    Spacer()
                    
                    //备注与说明区
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.gray)
                            .frame(maxHeight: 110)
                        VStack (spacing: 1) {
                                        Text("版本说明与备注")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity,alignment:.center)
                                        Text(" ")
                                            .font(.system(size: 1))
                                        Text("1. 此版本仅包含《数据计算器》功能。根据画面内容，实际数据量可能与计算不同。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("2. 分辨率默认高宽比为16:9；HD指分辨率为1920x1080，UHD指分辨率为3840x2160，其中第一个后缀括号描述素材分辨率，第二个后缀括号描述采样分辨率。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("3. ARRI摄影机相关数据来自arri.com。RED摄影机相关数据来自red.com。Prores编码相关数据来自apple.com。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("4. HDE为ARRI公司推出的压缩技术，用于ARRIRAW的无损压缩。REDCODE为RED公司推出的压缩RAW技术。对于ALEXA 35摄影机，Prores编码位深均为12Bit。")
                                            .font(.system(size: 10))
                                            .padding(.leading,10)
                                            .frame(maxWidth: .infinity,alignment:.leading)
                                        Text("5. 特别鸣谢 徐理航 对于此程序的代码设计支持。特别鸣谢 郑昊 对于此程序的图标设计支持。Taurus软件作者 吴坤城 ，合作或联系可加微信 15814854313 。")
                                           .font(.system(size: 10))
                                           .padding(.leading,10)
                                           .frame(maxWidth: .infinity,alignment:.leading)
                                        Spacer()
                                    }
                                    .frame(maxHeight: 110)
                                    .padding([.top,.trailing],8)
                                    
                            
                        
                    }
                    .padding(.top, 31.0)
                    .padding([.leading,.trailing,.bottom],10)
                }
                
                
                //主功能选择区
                    .tabItem {
                        Text("数据计算器")
                    }
                
//                //其他功能模块
//                Text("还没做出功能的阵列配置台")
//                    .tabItem {
//                        Text("阵列配置台")
//                    }
//
//                Text("还没做出功能的录制格式速查")
//                    .tabItem {
//                        Text("录制格式速查")
//                    }
//
//                Text("还没做出功能的像场覆盖图")
//                    .tabItem {
//                        Text("像场覆盖图")
//                    }
            }
            .frame(minWidth:785,minHeight: 425)
            .frame(maxWidth:785,maxHeight: 425)
            
        }
        .padding()
    }
   
    //机型-编码-分辨率-储存卡 十位码帧率选择区域
    func availableRates() -> [String] {
        
        var rates = [""]
        let xbit = Xbit()
        switch xbit {
            
            //无法录制的储存卡
        case "2022012020","2032012120","2032012121","2032013020","2032013021","2032113020","2032113021","2032012620","2032012621","2032011720","2032011721","2032012320","2032012321","2032013720","2032013721","2032113720","2032113721","2052014121","2052114121","2052214121","2052314121" :
            rates = ["储存卡速度不足以录制该格式"]
            
            //max25
        case "2032112620","2032112621","2032112320","2032112321","2032013711","2032213720","2032213721" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000"]
            
            //max30
        case "2002012110","2002012111","2002012112","2002013010","2002013011","2002013012","2022011420","2022012010","2022112010","2022212010","2022312010","2022112020","2022212020","2022312020","2022012030","2022112030","2022212030","2022312030","2032013730","2032112120","2032112121","2032013011","2032213020","2032213021","2032111720","2032111721","2032212320","2032212321","2041012310","2041012311","2041012312","2042012110","2042012111","2042012112","2042013010","2042013011","2042013012","2081014333" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000"]
            
            //max40
        case "2032013030","2022010620","2032012611","2032212620","2032212621","2032211720","2032211721","2032012311","2032113711","2052014131","2052014132","2061014133","2061014134","2062014133","2062014134","2062114133","2062114134","2062214133","2062214134","2081014233" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000"]
            
            //max48
        case "2001011610","2001011611","2001011612","2012111420","2012211420","2012311420","2022011410","2022111410","2022211410","2022311410","2022111420","2022211420","2022311420","2022011430","2022111430","2022211430","2022311430","2032013731","2032013732","2032113730","2032113731","2032113732","2032213730","2032213731","2032213732","2032313730","2032313731","2032313732","2022010020","2032213711","2032313711","2032313720","2032313721","2041011610","2041011611","2041011612","2062013333","2062013334","2062113333","2062113334","2062213333","2062213334" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000"]
            
            //max50
        case "2032012330","2032012630","2032013031","2032013032","2032113030","2032113031","2032113032","2032213030","2032213031","2032213032","2032313030","2032313031","2032313032","2032011120","2032011121","2032012111","2032212120","2032212121","2032113011","2032213011","2032313011","2032313020","2032313021","2032011711","2042011710","2042011711","2042011712","2042111710","2042111711","2042111712","2042211710","2042211711","2042211712","2042311710","2042311711","2042311712","2042411710","2042411711","2042411712","2081013533","2081012233","2081011933","2082014333" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000"]
            
            //max59
        case "2008010010","2008010011","2008010012" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940"]
            
            //max60
        case "2002112110","2002112111","2002112112","2002113010","2002113011","2002113012","2002212110","2002212111","2002212112","2002213010","2002213011","2002213012","2002312110","2002312111","2002312112","2002313010","2002313011","2002313012","2002412110","2002412111","2002412112","2002413010","2002413011","2002413012","2012110020","2012110620","2012210020","2012210620","2012310020","2012310620","2022110020","2022110610","2022210610","2022310610","2022110620","2022210620","2022310620","2022010610","2022010630","2022110630","2022210630","2022310630","2032012331","2032012332","2032011730","2032011731","2032011732","2032111730","2032111731","2032111732","2032211730","2032211731","2032211732","2032311730","2032311731","2032311732","2032012631","2032012632","2032112630","2032112631","2032112632","2032212630","2032212631","2032212632","2032312630","2032312631","2032312632","2032012130","2032112330","2032112331","2032112332","2032212330","2032212331","2032212332","2032312330","2032312331","2032312332","2032010020","2032010021","2032011220","2032011221","2032112611","2032212611","2032312611","2032312620","2032312621","2032111711","2032211711","2032311711","2032311720","2032311721","2032112311","2032212311","2032312311","2032312320","2032312321","2042112110","2042112111","2042112112","2042212110","2042212111","2042212112","2042312110","2042312111","2042312112","2042412110","2042412111","2042412112","2042113010","2042113011","2042113012","2042213010","2042213011","2042213012","2042313010","2042313011","2042313012","2042413010","2042413011","2042413012","2052010521","2052010531","2052010532","2052110521","2052110531","2052110532","2052210521","2052210531","2052210532","2052310521","2052310531","2052310532","2052010921","2052010931","2052010932","2052110921","2052110931","2052110932","2052210921","2052210931","2052210932","2052310921","2052310931","2052310932","2052012821","2052012831","2052012832","2052112821","2052112831","2052112832","2052212821","2052212831","2052212832","2052312821","2052312831","2052312832","2052013921","2052113921","2052213921","2052313921","2052114131","2052114132","2052214131","2052214132","2052314131","2052314132","2061013933","2061013934","2061012833","2061012834","2061011833","2061011834","2061012433","2061012434","2062013933","2062013934","2062113933","2062113934","2062213933","2062213934","2062012833","2062012834","2062112833","2062112834","2062212833","2062212834","2062011833","2062011834","2062111833","2062111834","2062211833","2062211834","2081012933","2081013433","2082014334","2082114333","2082114334","2082214333","2082214334" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000"]
            
            //max72
        case "2032012131","2032012132","2032112130","2032112131","2032112132","2032212130","2032212131","2032212132","2032312130","2032312131","2032312132","2032112111","2032212111","2032312111","2032312120","2032312121" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000"]
            
            //max75
        case "2021012330","2022010030","2022010010","2031012330","2032111120","2032111121","2062010433","2062010434","2062110433","2062110434","2062210433","2062210434","2062010533","2062010534","2062110533","2062110534","2062210533","2062210534","2062012133","2062012134","2062112133","2062112134","2062212133","2062212134","2062011733","2062011734","2062111733","2062111734","2062211733","2062211734","2081014334","2081014234","2082012233","2082012234","2082112233","2082112234","2082212233","2082212234","2082013633","2082013634","2082113633","2082113634","2082213633","2082213634" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000","75.000"]
            
            //max90
        case "2021011730","2031012331","2031012332","2031011730","2051012831","2051012832","2051014131","2051014132","2062010933","2062010934","2062110933","2062110934","2062210933","2062210934","2082013533","2082012733","2082012734","2082112733","2082112734","2082212733","2082212734","2082011933","2082011934","2082111933","2082111934","2082211933","2082211934" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000","75.000","90.000"]
            
            //max96
        case "2021011530","2031011731","2031011732","2031011530","2031011531","2031011532","2032011230","2032011231","2032011232","2032111230","2032111231","2032111232","2032211230","2032211231","2032211232","2032311230","2032311231","2032311232","2032110020","2032110021","2032011211","2032111211","2032111220","2032111221","2032211211","2032211220","20322111221","2032311211","2032311220","2032311221" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000","75.000","90.000","96.000"]
            
            //max100
        case "2031012030","2052013931","2052013932","2052113931","2052113932","2052213931","2052213932","2052313931","2052313932","2062010033","2062010034","2062110033","2062110034","2062210033","2062210034","2081012234","2081011934","2082013534","2082113533","2082113534","2082213533","2082213534","2082013433","2082012533","2082012534","2082112533","2082112534","2082212533","2082212534","2082013233","2082013234","2082113233","2082113234","2082213233","2082213234","2082013133" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000","75.000","90.000","96.000","100.00"]
            
            //max120
        case "2002010010","2002010011","2002010012","2002010110","2002010111","2002010112","2002010710","2002010711","2002010712","2022110010","2022210010","2022310010","2022210020","2022310020","2021011630","2022110030","2022210030","2022310030","2031011630","2031011631","2031011632","2031012031","2031012032","2032010030","2032010031","2032010032","2032110030","2032110031","2032110032","2032210030","2032210031","2032210032","2032310030","2032310031","2032310032","2032011130","2032011131","2032011132","2032111130","2032111131","2032111132","2032211130","2032211131","2032211132","2032311130","2032311131","2032311132","2032010011","2032110011","2032210011","2032210020","2032210021","2032310011","2032310020","2032310021","2032011111","2032111111","2032211111","2032211120","2032211121","2032311111","2032311120","2032311121","2042010010","2042010011","2042010012","2042010110","2042010111","2042010112","2042010310","2042010311","2042010312","2042110310","2042110311","2042110312","2042210310","2042210311","2042210312","2042310310","2042310311","2042310312","2042410310","2042410311","2042410312","2042010710","2042010711","2042010712","2042011310","2042011311","2042011312","2042111310","2042111311","2042111312","2042211310","2042211311","2042211312","2042311310","2042311311","2042311312","2042411310","2042411311","2042411312","2081013534","2081012934","2081013434","2082013434","2082113433","2082113434","2082213433","2082213434","2082011033","2082011034","2082111033","2082111034","2082211033","2082211034","2082013134","2082113133","2082113134","2082213133","2082213134","2082010833","2082010834","2082110833","2082110834","2082210833","2082210834","2082010233","2082010234","2082110233","2082110234","2082210233","2082210234" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000","75.000","90.000","96.000","100.000","120.000"]
            
        case "2051013931","2051013932" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","72.000","75.000","90.000","96.000","100.000","120.000","150.000"]
            
            //max200
        case "2002110010","2002110011","2002110012","2002110110","2002110111","2002110112","2002110710","2002110711","2002110712","2002210010","2002210011","2002210012","2002210110","2002210111","2002210112","2002210710","2002210711","2002210712","2002310010","2002310011","2002310012","2002310110","2002310111","2002310112","2002310710","2002310711","2002310712","2002410010","2002410011","2002410012","2002410110","2002410111","2002410112","2002410710","2002410711","2002410712","2042110010","2042110011","2042110012","2042210010","2042210011","2042210012","2042310010","2042310011","2042310012","2042410010","2042410011","2042410012","2042210110","2042210111","2042210112","2042310110","2042310111","2042310112","2042410110","2042410111","2042410112","2042110710","2042110711","2042110712","2042210710","2042210711","2042210712","2042310710","2042310711","2042310712","2042410710","2042410711","2042410712" :
            rates = ["0.750","1.000","20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000","75.000","90.000","96.000","100.000","120.000","150.000","200.000"]
         
            //ALEXA 65 20-25
        case "2071014530" :
            rates = ["20.000","23.976","24.000","25.000"]
            
            //ALEXA 65 20-30
        case "2071014430" :
            rates = ["20.000","23.976","24.000","25.000","29.970","30.000"]
            
            //ALEXA 65 20-40
        case "2071014030" :
            rates = ["20.000","23.976","24.000","25.000","29.970","30.000","40.000"]
            
            //ALEXA 65 20-48
        case "2071013830" :
            rates = ["20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000"]
            
            //ALEXA 65 20-60
        case "2071014531","2071014532","2071014431","2071014432","2071013831","2071013832","2071012831","2071012832","2071012830","2071014031","2071014032" :
            rates = ["20.000","23.976","24.000","25.000","29.970","30.000","40.000","48.000","50.000","59.940","60.000"]
            
            
          //错误检测
        default :
            rates = ["24.000"]
        }
        
          //特殊选项区
        if CameraName.contains("ALEXA XT") || CameraName.contains("ALEXA SXT") || CameraName.contains("ALEXA LF") {
            if Codec == "ARRIRAW" {
                if !Media.contains("XR Capture Drive 512GB") && !Media.contains("SXR Capture Drive 1TB") && !Media.contains("SXR Capture Drive 2TB") {
                    rates = ["该储存卡无法在此机型录制ARRIRAW"]
                }
            }
        }
        
        return rates
    }
    
    //将机型编号、编码编号、分辨率编号、储存卡编号合成为十位码
    func Xbit() -> String {

      let cameraNumber = CameraNumber()
      let codecNumber = CodecNumber()
      let resolutionNumber = ResolutionNumber()
      let mediaNumber = MediaNumber()

      let cameraString = String(cameraNumber)
      let codecString = String(codecNumber)
      let resolutionString = String(resolutionNumber)
      let mediaString = String(mediaNumber)

      return cameraString + codecString + resolutionString + mediaString
    }

    //机型三位编号
    func CameraNumber() -> Int {
        switch CameraName {
            case "AMIRA" :
                return 200
            case "ALEXA Classic" :
                return 201
            case "ALEXA XT" :
                return 202
            case "ALEXA SXT" :
                return 203
            case "ALEXA Mini" :
                return 204
            case "ALEXA LF" :
                return 205
            case "ALEXA Mini LF" :
                return 206
            case "ALEXA 65" :
                return 207
            case "ALEXA 35" :
                return 208
            default :
                return 999
                    }
    }

    //编码两位编号
    func CodecNumber() -> Int {
        switch Codec {
            case "ARRIRAW" :
                return 10
            case "Prores 4444 XQ" :
                return 20
            case "Prores 4444" :
                return 21
            case "Prores 422 HQ" :
                return 22
            case "Prores 422" :
                return 23
            case "Prores 422 LT" :
                return 24
            case "REDCODE 1:3" :
                return 30
            case "MPEG-2 HD 422" :
                return 80
            default :
                return 99
        }
    }
    
    //分辨率三位编号
    func ResolutionNumber() -> Int {
        switch Resolution {
        case "HD S35[From 2880*1620]" :
            return 100
        case "HD S16[From 1600*900]" :
            return 101
        case "HD S35[From 4096*2304]" :
            return 102
        case "HD S35[From 1920*2160][8:9 ANA]" :
            return 103
        case "HD LF[From 4320*2430]" :
            return 104
        case "HD LF[From UHD]" :
            return 105
        case "2K S35[2048*1152][From 2868*1614]" :
            return 106
        case "2K S35[2048*1152][From 2868*1612]" :
            return 107
        case "2K S35[2048*1152][From 4096*2304]" :
            return 108
        case "2K LF[2048*1152][From UHD]" :
            return 109
        case "2K S16[2048*1152]" :
            return 110
        case "2K S35[2048*1152][From 2880*1620]" :
            return 111
        case "2K S35[2048*858][From 2560*2146][6:5 ANA]" :
            return 112
        case "2K S35[2048*858][From 2560*2145][6:5 ANA]" :
            return 113
        case "2K S35[2048*1536][From 2868*2152][4:3]" :
            return 114
        case "2.6K S35[2578*2160][6:5]" :
            return 115
        case "2.8K S35[2880*1620]" :
            return 116
        case "2.8K S35[2880*2160][4:3]" :
            return 117
        case "2.8K LF[2880*2880][1:1]" :
            return 118
        case "3K S35[3072*3072][1:1]" :
            return 119
        case "3.2K S35[3168*1782]" :
            return 120
        case "3.2K S35[3200*1800]" :
            return 121
        case "3.3K S35[3328*2790][6:5]" :
            return 122
        case "3.4K S35[3424*2202][OG]" :
            return 123
        case "3.4K S35[3424*2202][3:2]" :
            return 124
        case "3.8K S35[3840*1920][From 3072*3072][1:1 ANA]" :
            return 125
        case "4K S35[4096*1716][From 2560*2146][6:5 ANA]" :
            return 126
        case "4K S35[4096*1716][From 3328*2790][6:5 ANA]" :
            return 127
        case "UHD LF" :
            return 128
        case "UHD S35" :
            return 129
        case "UHD S35[From 3200*1800]" :
            return 130
        case "UHD S35[From 4096*2304]" :
            return 131
        case "UHD S35[From 2743*3086][8:9 ANA]" :
            return 132
        case "UHD LF[From 4320*2430]" :
            return 133
        case "4K S35[4096*2048][2:1]" :
            return 134
        case "4K S35[4096*2304]" :
            return 135
        case "4K S35[4096*2304][From 4608*2592]" :
            return 136
        case "4K S35[4096*2636][From 3414*2198][2.39:1]" :
            return 137
        case "4.3K LF[4320*2880][3:2]" :
            return 138
        case "4.5K LF[4448*1856][2.39:1]" :
            return 139
        case "4.5K LF[4448*3096][3:2]" :
            return 140
        case "4.5K LF[4448*3096][OG]" :
            return 141
        case "4.6K S35[4608*2592]" :
            return 142
        case "4.6K S35[4608*3164][OG]" :
            return 143
        case "5.1K 65mm[5120*2880]" :
            return 144
        case "6.5K 65mm[6560*3100][OG]" :
            return 145
        default :
            return 999
        }
    }
    
    //储存卡三位编号
    func MediaNumber() -> Int {
        switch Media {
        case "CFast2.0 128GB" :
            return 10
        case "CFast2.0 256GB" :
            return 11
        case "CFast2.0 512GB" :
            return 12
        case "SxS Pro+ 128GB" :
            return 20
        case "SxS Pro+ 256GB" :
            return 21
        case "XR Capture Drive 512GB" :
            return 30
        case "SXR Capture Drive 1TB" :
            return 31
        case "SXR Capture Drive 2TB" :
            return 32
        case "Compact Drive 1TB" :
            return 33
        case "Compact Drive 2TB" :
            return 34
        default :
            return 99
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    
}
