//
//  LSRR.swift
//  K-DST
//
//  Created by Alexander Titterton on 07/02/2019.
//  Copyright © 2019 Alexander Titterton. All rights reserved.
//

import Foundation
import AVFoundation

func BCTR() -> AVQueuePlayer {
    let playlist = AVQueuePlayer()
    playlist.allowsExternalPlayback = false
    class Song {
        var title: String = ""
        var body: String = ""
        
        init(title: String, body: String) {
            self.title = title
            self.body = body
        }
    }
    
    let adverts = ["MONO_AD001_LIFE_INVADER",
                   "MONO_AD002_RIGHTEOUS_SLAUGHTER_NUKE",
                   "MONO_AD003_RIGHTEOUS_SLAUGHTER_RUSSIAN",
                   "MONO_AD004_RIGHTEOUS_SLAUGHTER_LEVELS",
                   "MONO_AD005_SA_TOURISM_BOARD",
                   "MONO_AD006_DESERT_TOURISM",
                   "MONO_AD007_SA_WATER_POWER",
                   "MONO_AD008_UP_N_ATOM",
                   "MONO_AD009_PROP_43",
                   "MONO_AD010_TOESHOES",
                   "MONO_AD011_IMPLANT_OUTSOURCE",
                   "MONO_AD012_DONATE_YOUR_CAR",
                   "MONO_AD013_RACE_TO_PLUTO",
                   "MONO_AD014_PROP208_DAD",
                   "MONO_AD015_PROP208_JUNGLE",
                   "MONO_AD016_PISSWASSER",
                   "MONO_AD017_QUEENSBURY_BOXING",
                   "MONO_AD018_LOTTERY_STARVING_CHILDREN",
                   "MONO_AD019_LOTTERY_REALLY_ADDICTED",
                   "MONO_AD020_WHIZ_WIRLESS",
                   "MONO_AD021_RECTIFY_HOLISTIC",
                   "MONO_AD022_BAIL_BONDS",
                   "MONO_AD023_OVINE_HUMAN_RESOURCES",
                   "MONO_AD024_PROPOSITION_14",
                   "MONO_AD025_PIC_OFFICER",
                   "MONO_AD026_PIC_FRANCHISE",
                   "MONO_AD027_SA_LABOTOMY",
                   "MONO_AD028_DARWINIAN_YOGA",
                   "MONO_AD029_GASTRO_BAND",
                   "MONO_AD030_ECONOMIC_RECOVERY_GROUP",
                   "MONO_AD031_REHAB_ISLAND",
                   "MONO_AD032_LARRYS_RV_SALES",
                   "MONO_AD033_NIGHT_LIGHTS",
                   "MONO_AD034_HEAD_SHOTS",
                   "MONO_AD035_ELECTROTOKE",
                   "MONO_AD036_TOILET_CLEANER",
                   "MONO_AD037_STOP_PAYING_MORTGAGE",
                   "MONO_AD038_FLOYDS_SCRAP_METAL",
                   "MONO_AD039_BUDDYS_TRUCKING",
                   "MONO_AD040_FLEECA_INTEREST_FEES",
                   "MONO_AD041_FLEECA_BEDROOM",
                   "MONO_AD042_SHARK",
                   "MONO_AD043_SMOKED_DREAMS",
                   "MONO_AD044_HIPSTERS_FOR_HIRE",
                   "MONO_AD045_PRESERVEX",
                   "MONO_AD046_DONS_COUNTRY_STORE",
                   "MONO_AD047_PROPOSITION_45",
                   "MONO_AD048_WINDSOR_IMMIGRANT",
                   "MONO_AD049_WINDSOR_SWINGER_GROTTO",
                   "MONO_AD050_CUCKOLD_THERAPHY",
                   "MONO_AD051_DIGIFARM_DAUGHTER",
                   "MONO_AD052_DIGIFARM_OTHER_GAMES",
                   "MONO_AD053_BLAINE_COUNTY_BANK",
                   "MONO_AD054_LOMBANK",
                   "MONO_AD055_HITTING_KIDS_WORKS_WONDERS",
                   "MONO_AD056_VINEWOOD_HEALTH",
                   "MONO_AD057_BENDERS_WANKER",
                   "MONO_AD058_BENDERS_PIES",
                   "MONO_AD059_YOUTOOL",
                   "MONO_AD060_AMUNATION_GARDENING",
                   "MONO_AD061_AMUNATION_APOCOLYPSE",
                   "MONO_AD062_FLOW_WATER",
                   "MONO_AD063_SEX_ADDICTION_OPPORTUNITY",
                   "MONO_AD064_SERIOUS_COUGAR",
                   "MONO_AD065_CLOUD_COMPUTING",
                   "MONO_AD067_PRIDE_PREJ_GRAIN_ALCOHOL",
                   "MONO_AD068_PRIDE_PREJ_TORNADO",
                   "MONO_AD069_HITTING_KIDS_POT",
                   "MONO_AD070_HAMMERSTEIN_FAUST",
                   "MONO_AD071_GRAIN_OF_TRUTH",
                   "MONO_AD072_FLY_US_CHOICE",
                   "MONO_AD073_FLY_US_DRUNK",
                   "MONO_AD074_FLY_US_PLANES",
                   "MONO_AD075_REFINANCE_LS_COMMERCE",
                   "MONO_AD076_REBRANDING_JERKING",
                   "MONO_AD077_REBRANDING_ABYSS",
                   "MONO_AD078_SEX_ADDICT_DROWNING",
                   "MONO_AD079_SEX_ADDICT_TRAIN",
                   "MONO_AD080_SEX_MANOPAUSE",
                   "MONO_AD081_MMA",
                   "MONO_AD083_EGOCHASER",
                   "MONO_AD084_CHAINS_INTMACY_THROB",
                   "MONO_AD085_CHAINS_INTMACY_DIAMONDS",
                   "MONO_AD086_BRAVADO_FARMS",
                   "MONO_AD087_BRAVADO_CRUISE_CONTROL",
                   "MONO_AD088_SA_FLIGHT_SCHOOL",
                   "MONO_AD089_CREVIS_NATURE_REVISED",
                   "MONO_AD090_CREVIS_EVEREST",
                   "MONO_AD091_EPSILON_ANTARTICA",
                   "MONO_AD092_EPSILON_FAMOUS_PEOPLE",
                   "MONO_AD093_SEX_ADDICTION_VICTIM",
                   "MONO_AD094_PONTIUS",
                   "MONO_AD095_SUE_MURRY",
                   "MONO_AD096_JOCK_CRANLEY1",
                   "MONO_AD097_JOCK_CRANLEY2"]
    
    let soundbites = ["ID_01",
                      "ID_02",
                      "ID_03",
                      "ID_04",
                      "ID_05",
                      "ID_06",
                      "ID_07",
                      "ID_08",
                      "ID_09",
                      "ID_10",
                      "ID_11"]
    
    var songs: [Song] = []
    songs.append(Song(title: "MONO_BCR_COMMUNITY_HOUR",
                      body: "MONO_BCR_COMMUNITY_HOUR"))
    songs.append(Song(title: "MONO_BEYOND_INSEMINATION",
                      body: "MONO_BEYOND_INSEMINATION"))
    songs.append(Song(title: "MONO_BLESS_YOUR_HEART",
                      body: "MONO_BLESS_YOUR_HEART"))
    songs.append(Song(title: "MONO_ZBEYOND_INSEMINATION_PART_2",
                      body: "MONO_ZBEYOND_INSEMINATION_PART_2"))
    
    
    
    
    var i = 0
    let j = songs.count
    while i < j {
        let index = Int(arc4random_uniform(UInt32(songs.count)))
        let index2 = Int(arc4random_uniform(UInt32(soundbites.count)))
        let index4 = Int(arc4random_uniform(UInt32(adverts.count)))
        var index5 = index4
        var index6 = index5
        var index7 = index6
        var index8 = index7
        //print(index5)
        while index5 == index4 {
            index5 = Int(arc4random_uniform(UInt32(adverts.count)))
            print(index5)
        }
        while index6 == index5 || index6 == index4 {
            index6 = Int(arc4random_uniform(UInt32(adverts.count)))
        }
        while index7 == index6 || index7 == index5 || index7 == index4 {
            index7 = Int(arc4random_uniform(UInt32(adverts.count)))
        }
        while index8 == index7 || index8 == index6 || index8 == index5 || index8 == index4 {
            index8 = Int(arc4random_uniform(UInt32(adverts.count)))
        }
        let nadverts = Int(arc4random_uniform(5))
        //print(nadverts)
        let temp_song = songs[index]
        let temp_soundbite = soundbites[index2]
        var temp_ad = [String]()
        temp_ad.append("audio/Ads/" + adverts[index4])
        temp_ad.append("audio/Ads/" + adverts[index5])
        temp_ad.append("audio/Ads/" + adverts[index6])
        temp_ad.append("audio/Ads/" + adverts[index7])
        temp_ad.append("audio/Ads/" + adverts[index8])
        //print(temp_ad)
        var indices = [Int]()
        indices.append(index4)
        indices.append(index5)
        indices.append(index6)
        indices.append(index7)
        indices.append(index8)
        let temp_body = "audio/BCTR/" + temp_song.body
        let temp_sb = "audio/BCTR/" + temp_soundbite
        
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_sb, ofType: "mp3")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_body, ofType: "mp3")!)), after: nil)

        // Adverts
        for k in 0..<nadverts {
            playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_ad[k], ofType: "mp3")!)), after: nil)
            //adverts.remove(at: indices[i+1])
        }
        
        songs.remove(at: index)
        i += 1
    }
    
    return playlist
}
