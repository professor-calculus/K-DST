//
//  LSRR.swift
//  K-DST
//
//  Created by Alexander Titterton on 07/02/2019.
//  Copyright © 2019 Alexander Titterton. All rights reserved.
//

import Foundation
import AVFoundation

func LSRR() -> AVQueuePlayer {
    let playlist = AVQueuePlayer()
    playlist.allowsExternalPlayback = false
    class Song {
        var title: String = ""
        var intro = [String]()
        var body: String = ""
        
        init(title: String, intro: [String], body: String) {
            self.title = title
            self.intro = intro
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
    
    let kenny = ["EVENING_01",
                 "EVENING_02",
                 "EVENING_03",
                 "EVENING_04",
                 "EVENING_05",
                 "EVENING_06",
                 "GENERAL_01",
                 "GENERAL_02",
                 "GENERAL_03",
                 "GENERAL_04",
                 "GENERAL_05",
                 "GENERAL_06",
                 "GENERAL_07",
                 "GENERAL_08",
                 "GENERAL_09",
                 "GENERAL_10",
                 "GENERAL_11",
                 "GENERAL_12",
                 "GENERAL_13",
                 "GENERAL_14",
                 "GENERAL_15",
                 "GENERAL_16",
                 "GENERAL_17",
                 "GENERAL_18",
                 "GENERAL_19",
                 "GENERAL_20",
                 "GENERAL_21",
                 "GENERAL_22",
                 "GENERAL_23",
                 "GENERAL_24",
                 "GENERAL_25",
                 "GENERAL_26",
                 "GENERAL_27",
                 "GENERAL_28",
                 "GENERAL_29",
                 "GENERAL_30",
                 "GENERAL_31",
                 "GENERAL_32",
                 "GENERAL_33",
                 "GENERAL_34",
                 "GENERAL_35",
                 "GENERAL_36",
                 "GENERAL_37",
                 "GENERAL_38",
                 "GENERAL_39",
                 "GENERAL_40",
                 "GENERAL_41",
                 "GENERAL_42",
                 "MONO_SOLO_01",
                 "MONO_SOLO_02",
                 "MONO_SOLO_03",
                 "MONO_SOLO_04",
                 "MONO_SOLO_05",
                 "MONO_SOLO_06",
                 "MONO_SOLO_07",
                 "MONO_SOLO_08",
                 "MONO_SOLO_09",
                 "MONO_SOLO_10",
                 "MONO_SOLO_11",
                 "MONO_SOLO_12",
                 "MONO_SOLO_13",
                 "MONO_SOLO_14",
                 "MONO_SOLO_15",
                 "MONO_SOLO_16",
                 "MONO_SOLO_17",
                 "MONO_SOLO_18",
                 "MONO_SOLO_19",
                 "MONO_SOLO_20",
                 "MONO_SOLO_21",
                 "MONO_SOLO_22",
                 "MONO_SOLO_23",
                 "MONO_SOLO_24",
                 "MONO_SOLO_25",
                 "MORNING_01",
                 "MORNING_02",
                 "MORNING_03",
                 "MORNING_04",
                 "MORNING_05",
                 "MORNING_06",
                 "MORNING_07"]
    
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
                      "ID_11",
                      "ID_12",
                      "ID_13"]
    
    let news = ["MONO_NEWS_01",
                "MONO_NEWS_02",
                "MONO_NEWS_03",
                "MONO_NEWS_04",
                "MONO_NEWS_05",
                "MONO_NEWS_06",
                "MONO_NEWS_07",
                "MONO_NEWS_08",
                "MONO_NEWS_09",
                "MONO_NEWS_10",
                "MONO_NEWS_100",
                "MONO_NEWS_101",
                "MONO_NEWS_102",
                "MONO_NEWS_103",
                "MONO_NEWS_104",
                "MONO_NEWS_105",
                "MONO_NEWS_106",
                "MONO_NEWS_107",
                "MONO_NEWS_108",
                "MONO_NEWS_109",
                "MONO_NEWS_11",
                "MONO_NEWS_110",
                "MONO_NEWS_111",
                "MONO_NEWS_112",
                "MONO_NEWS_113",
                "MONO_NEWS_114",
                "MONO_NEWS_115",
                "MONO_NEWS_116",
                "MONO_NEWS_117",
                "MONO_NEWS_118",
                "MONO_NEWS_119",
                "MONO_NEWS_12",
                "MONO_NEWS_120",
                "MONO_NEWS_121",
                "MONO_NEWS_122",
                "MONO_NEWS_123",
                "MONO_NEWS_13",
                "MONO_NEWS_14",
                "MONO_NEWS_15",
                "MONO_NEWS_16",
                "MONO_NEWS_17",
                "MONO_NEWS_18",
                "MONO_NEWS_19",
                "MONO_NEWS_20",
                "MONO_NEWS_21",
                "MONO_NEWS_22",
                "MONO_NEWS_23",
                "MONO_NEWS_24",
                "MONO_NEWS_25",
                "MONO_NEWS_26",
                "MONO_NEWS_27",
                "MONO_NEWS_28",
                "MONO_NEWS_29",
                "MONO_NEWS_30",
                "MONO_NEWS_31",
                "MONO_NEWS_32",
                "MONO_NEWS_33",
                "MONO_NEWS_34",
                "MONO_NEWS_35",
                "MONO_NEWS_36",
                "MONO_NEWS_37",
                "MONO_NEWS_38",
                "MONO_NEWS_39",
                "MONO_NEWS_40",
                "MONO_NEWS_41",
                "MONO_NEWS_42",
                "MONO_NEWS_43",
                "MONO_NEWS_44",
                "MONO_NEWS_45",
                "MONO_NEWS_46",
                "MONO_NEWS_47",
                "MONO_NEWS_48",
                "MONO_NEWS_49",
                "MONO_NEWS_50",
                "MONO_NEWS_51",
                "MONO_NEWS_52",
                "MONO_NEWS_53",
                "MONO_NEWS_54",
                "MONO_NEWS_55",
                "MONO_NEWS_56",
                "MONO_NEWS_57",
                "MONO_NEWS_58",
                "MONO_NEWS_59",
                "MONO_NEWS_60",
                "MONO_NEWS_61",
                "MONO_NEWS_62",
                "MONO_NEWS_63",
                "MONO_NEWS_64",
                "MONO_NEWS_81",
                "MONO_NEWS_82",
                "MONO_NEWS_83",
                "MONO_NEWS_84",
                "MONO_NEWS_85",
                "MONO_NEWS_86",
                "MONO_NEWS_87",
                "MONO_NEWS_88",
                "MONO_NEWS_89",
                "MONO_NEWS_90",
                "MONO_NEWS_91",
                "MONO_NEWS_92",
                "MONO_NEWS_93",
                "MONO_NEWS_94",
                "MONO_NEWS_95",
                "MONO_NEWS_96",
                "MONO_NEWS_97",
                "MONO_NEWS_98",
                "MONO_NEWS_99"]
    
    let newsIntros = ["TO_NEWS_01",
                      "TO_NEWS_02",
                      "TO_NEWS_03",
                      "TO_NEWS_04",
                      "TO_NEWS_05",
                      "TO_NEWS_06"]
    
    let adIntros = ["TO_AD_01",
                    "TO_AD_02",
                    "TO_AD_03",
                    "TO_AD_04",
                    "TO_AD_05",
                    "TO_AD_06",
                    "TO_AD_07"]
    
    var songs: [Song] = []
    songs.append(Song(title: "ALL_THE_THINGS_SHE_SAID",
                      intro: ["SmallFacesIntro","AllTheThingsSheSaidIntro2"],
                      body: "ALL_THE_THINGS_SHE_SAID"))
    songs.append(Song(title: "BAKER_STREET",
                      intro: ["BakerStreetIntro","BakerStreetIntro2"],
                      body: "BAKER_STREET"))
    songs.append(Song(title: "BIG_LOG",
                      intro: ["RobertPlantIntro","RobertPlantIntro2"],
                      body: "BIG_LOG"))
    songs.append(Song(title: "BLACK_VELVET",
                      intro: ["BlackVelvetIntro","BlackVelvetIntro2"],
                      body: "BLACK_VELVET"))
    songs.append(Song(title: "BURNING_HEART",
                      intro: ["BurningHeartIntro","BurningHeartIntro2"],
                      body: "BURNING_HEART"))
    songs.append(Song(title: "CARRY_ON_MY_WAYWARD_SUN",
                      intro: ["KansasIntro","KansasIntro"],
                      body: "CARRY_ON_MY_WAYWARD_SUN"))
    songs.append(Song(title: "CATS_IN_THE_CRADLE",
                      intro: ["CatCradleIntro","CatCradleIntro"],
                      body: "CATS_IN_THE_CRADLE"))
    songs.append(Song(title: "CIRCLE_IN_THE_SAND",
                      intro: ["70sIntro","70sIntro"],
                      body: "CIRCLE_IN_THE_SAND"))
    songs.append(Song(title: "COMING_ON_STRONG",
                      intro: ["ComingStrongIntro","ComingStrongIntro2"],
                      body: "COMING_ON_STRONG"))
    songs.append(Song(title: "DANGER_ZONE",
                      intro: ["GENERAL_43","GENERAL_43"],
                      body: "DANGER_ZONE"))
    songs.append(Song(title: "DIRTY_WHITE_BOY",
                      intro: ["DirtyWhiteBoysIntro","DirtyWhiteBoysIntro"],
                      body: "DIRTY_WHITE_BOY"))
    songs.append(Song(title: "FORTUNATE_SON",
                      intro: ["CCRIntro","CCRIntro2"],
                      body: "FORTUNATE_SON"))
    songs.append(Song(title: "GIMME_ALL_YOUR_LOVIN",
                      intro: ["ZZTopIntro","ZZTopIntro2"],
                      body: "GIMME_ALL_YOUR_LOVIN"))
    songs.append(Song(title: "HEARTBEAT",
                      intro: ["DonJohnsonIntro","DonJohnsonIntro2"],
                      body: "HEARTBEAT"))
    songs.append(Song(title: "HIGHER_LOVE",
                      intro: ["HigherLoveIntro","HigherLoveIntro2"],
                      body: "HIGHER_LOVE"))
    songs.append(Song(title: "HOLLYWOOD_NIGHTS",
                      intro: ["GENERAL_43","GENERAL_43"],
                      body: "HOLLYWOOD_NIGHTS"))
    songs.append(Song(title: "IF_YOU_LEAVE_ME_NOW",
                      intro: ["IfYouLeaveIntro","IfYouLeaveIntro"],
                      body: "IF_YOU_LEAVE_ME_NOW"))
    songs.append(Song(title: "IM_FREE",
                      intro: ["ImFreeIntro","ImFreeIntro2"],
                      body: "IM_FREE"))
    songs.append(Song(title: "I_CANT_WAIT",
                      intro: ["ICantWaitIntro","ICantWaitIntro2"],
                      body: "I_CANT_WAIT"))
    songs.append(Song(title: "I_DONT_CARE_ANYMORE",
                      intro: ["GENERAL_43","GENERAL_43"],
                      body: "I_DONT_CARE_ANYMORE"))
    songs.append(Song(title: "I_WOULDNT_WANT_TO_BE",
                      intro: ["WouldntWantToBeIntro","WouldntWantToBeIntro"],
                      body: "I_WOULDNT_WANT_TO_BE"))
    songs.append(Song(title: "LONELY_IS_THE_NIGHT",
                      intro: ["LonelyIsTheNightIntro","LonelyIsTheNightIntro2"],
                      body: "LONELY_IS_THE_NIGHT"))
    songs.append(Song(title: "MISSISSIPPI_QUEEN",
                      intro: ["MountainIntro","MountainIntro2"],
                      body: "MISSISSIPPI_QUEEN"))
    songs.append(Song(title: "NIGHT_MOVES",
                      intro: ["BobSegerIntro","BobSegerIntro2"],
                      body: "NIGHT_MOVES"))
    songs.append(Song(title: "OGDENS_NUT_GONE_FLAKE",
                      intro: ["GENERAL_43","GENERAL_43"],
                      body: "OGDENS_NUT_GONE_FLAKE"))
    songs.append(Song(title: "PEACE_OF_MIND",
                      intro: ["PeaceOfMindIntro","PeaceOfMindIntro2"],
                      body: "PEACE_OF_MIND"))
    songs.append(Song(title: "PHOTOGRAPH",
                      intro: ["DefLeppardIntro","DefLeppardIntro2"],
                      body: "PHOTOGRAPH"))
    songs.append(Song(title: "RADIO_GA_GA",
                      intro: ["RadioGagaIntro","RadioGagaIntro"],
                      body: "RADIO_GA_GA"))
    songs.append(Song(title: "RAIN",
                      intro: ["RainIntro","RainIntro2"],
                      body: "RAIN"))
    songs.append(Song(title: "ROCKIN_ME",
                      intro: ["70sIntro","70sIntro"],
                      body: "ROCKIN_ME"))
    songs.append(Song(title: "ROUNDABOUT",
                      intro: ["RoundaboutIntro","RoundaboutIntro2"],
                      body: "ROUNDABOUT"))
    songs.append(Song(title: "SATURDAY_NIGHTS_ALRIGHT",
                      intro: ["EltonIntro","EltonIntro2"],
                      body: "SATURDAY_NIGHTS_ALRIGHT"))
    songs.append(Song(title: "SHADOWS_OF_THE_NIGHT",
                      intro: ["ShadowsOfTheNightIntro","ShadowsOfTheNightIntro2"],
                      body: "SHADOWS_OF_THE_NIGHT"))
    songs.append(Song(title: "THE_BREAKUP_SONG",
                      intro: ["BreakupSongIntro","BreakupSongIntro2"],
                      body: "THE_BREAKUP_SONG"))
    songs.append(Song(title: "THIRTY_DAYS_IN_THE_HOLE",
                      intro: ["30DaysHoleIntro","30DaysHoleIntro2"],
                      body: "THIRTY_DAYS_IN_THE_HOLE"))
    songs.append(Song(title: "TOO_LATE_FOR_GOODBYES",
                      intro: ["TooLateForGoodbyesIntro","TooLateForGoodbyesIntro2"],
                      body: "TOO_LATE_FOR_GOODBYES"))
    songs.append(Song(title: "WE_BUILT_THIS_CITY",
                      intro: ["WeBuiltCityIntro","WeBuiltCityIntro2"],
                      body: "WE_BUILT_THIS_CITY"))
    songs.append(Song(title: "WHAT_A_FOOL_BELIEVES",
                      intro: ["WhatAFoolBelievesIntro","WhatAFoolBelievesIntro"],
                      body: "WHAT_A_FOOL_BELIEVES"))
    
    
    
    var i = 0
    let j = songs.count
    while i < j {
        let index = Int(arc4random_uniform(UInt32(songs.count)))
        let index2 = Int(arc4random_uniform(UInt32(soundbites.count)))
        let index3 = Int(arc4random_uniform(UInt32(kenny.count)))
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
        let introindex = Int(arc4random_uniform(2))
        let temp_song = songs[index]
        let temp_soundbite = soundbites[index2]
        let temp_kenny = kenny[index3]
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
        let temp_intro = "audio/LSRR/" + temp_song.intro[introindex]
        let temp_body = "audio/LSRR/" + temp_song.body
        let temp_sb = "audio/LSRR/" + temp_soundbite
        let temp_dj = "audio/LSRR/" + temp_kenny
        
        // 50-50 chance of news item or not
        let nNews = Int(arc4random_uniform(2))
        
        //print(temp_intro)
        //print(temp_body)
        //print(temp_outro)
        
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_sb, ofType: "mp3")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_dj, ofType: "mp3")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_intro, ofType: "mp3")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_body, ofType: "mp3")!)), after: nil)
        
        // News item
        if nNews > 0
        {
            let newsIntroIndex = Int(arc4random_uniform(UInt32(newsIntros.count)))
            let temp_newsIntro = newsIntros[newsIntroIndex]
            let temp_newsIntro_path = "audio/LSRR/" + temp_newsIntro
            playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_newsIntro_path, ofType: "mp3")!)), after: nil)
            
            let newsIndex = Int(arc4random_uniform(UInt32(news.count)))
            let temp_news = news[newsIndex]
            let temp_news_path = "audio/News/" + temp_news
            playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_news_path, ofType: "mp3")!)), after: nil)
        }
        
        // Adverts intro
        if nadverts > 0
        {
            let adIntroIndex = Int(arc4random_uniform(UInt32(adIntros.count)))
            let temp_adIntro = adIntros[adIntroIndex]
            let temp_adIntro_path = "audio/LSRR/" + temp_adIntro
            playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_adIntro_path, ofType: "mp3")!)), after: nil)
        }
        
        // Adverts
        for k in 0..<nadverts {
            playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_ad[k], ofType: "mp3")!)), after: nil)
            //adverts.remove(at: indices[i+1])
        }
        
        songs.remove(at: index)
        //tommy.remove(at: index3)
        i += 1
    }
    
    return playlist
}
