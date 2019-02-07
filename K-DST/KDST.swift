//
//  Playlist.swift
//  K-DST
//
//  Created by Alexander Titterton on 21/03/2018.
//  Copyright © 2018 Alexander Titterton. All rights reserved.
//

import Foundation
import AVFoundation

func KDST() -> AVQueuePlayer {
    let playlist = AVQueuePlayer()
    playlist.allowsExternalPlayback = false
    class Song {
        var title: String = ""
        var intro = [String]()
        var body: String = ""
        var outro = [String]()
        
        init(title: String, intro: [String], body: String, outro: [String]) {
            self.title = title
            self.intro = intro
            self.body = body
            self.outro = outro
        }
    }
    
    var adverts = ["American_bank_of_Los_Santos",
                   "Ammunation",
                   "Beagle_brokerage_and_pawn",
                   "Blotto\'s_#1",
                   "Blotto\'s_#2",
                   "Blotto\'s_#3",
                   "Bouche_cologne",
                   "Casa_City",
                   "Castradon",
                   "Celebrate_with_cake_#1",
                   "Celebrate_with_cake_#2",
                   "Change_your_identity",
                   "Cluckin\'_bell_#1",
                   "Cluckin\'_bell_#2",
                   "Commando_pest_eradication",
                   "Commemorative_miniatures",
                   "Creative_plastic_surgery",
                   "Crimson_executive_spouse_indemnity_services",
                   "Don\'t_let_your_children_ride_bicycles",
                   "Dream_makers",
                   "Eris_shoes",
                   "Executive_intruder_extermination_service",
                   "Exorbio_gaming_system",
                   "Fokari_film",
                   "Grin",
                   "Hampshire_nannies_ltd",
                   "Herr_Gruber's_spa",
                   "Intergalactic_wrestling_championship_on_Weasel",
                   "Inversion_therapy",
                   "Kilimanjaro_clothes_#1",
                   "Kilimanjaro_clothes_#2",
                   "Law_on_Weasel_#1",
                   "Law_on_Weasel_#2",
                   "Law_on_Weasel_#3",
                   "Logger_beer",
                   "Logger_light",
                   "Lustrious_#1",
                   "Lustrious_#2",
                   "Mike_Andrews_#1",
                   "Mike_Andrews_#2",
                   "My_five_uncles_on_LSBC",
                   "Proposition_421_smoking_ban",
                   "Proposition_602_driving_on_bus_lanes",
                   "Proposition_832_green_cards_for_illegal_aliens",
                   "Rapidite",
                   "Redwood_cigarettes",
                   "Renegade_cologne",
                   "San_Andreas_telephone_#1",
                   "San_Andreas_telephone_#2",
                   "San_Andreas_telephone_#3",
                   "San_Andreas_telephone_#4",
                   "Shine_by_Helmet_shine",
                   "Sooth",
                   "Sprunk",
                   "Starfish_resort_and_casino",
                   "The_cavern_of_sorrow",
                   "The_crazy_cup",
                   "The_epsilon_program_#1",
                   "The_epsilon_program_#2",
                   "The_epsilon_program_#3",
                   "The_glory_hole_themepark_#1",
                   "The_glory_hole_themepark_#2",
                   "The_midlife_crisis_center",
                   "The_military",
                   "Tropicarcinoma",
                   "Ultimate_disc_in_the_dark",
                   "Zebra_bar_#1",
                   "Zebra_bar_#2",
                   "de_Koch_diamonds"]
    
    var tommy = ["01_Earthquake",
                 "02_Bridges_open",
                 "03_Bone_County_open",
                 "04_Two_kinds_of_people",
                 "05_Rock_'n'_roll_or_classical",
                 "06_Whatever_happened_to_Love_fist_",
                 "07_Keeping_the_spirit_of_rock_alive",
                 "08_Get_to_the_clinic",
                 "10_Music_may_not_be_the_food_of_love",
                 "15_I_live_the_dream",
                 "16_Prosecutor_busted_for_weed",
                 "17_Weed_farm_burned_down",
                 "18_UFOs",
                 "1977_What_a_year",
                 "19_Evening_1",
                 "20_Evening_2",
                 "21_Morning_1",
                 "22_Morning_2",
                 "23_Morning_3",
                 "24_Night_1",
                 "25_Night_2",
                 "26_Night_3",
                 "27_Fog_1",
                 "28_Fog_2",
                 "29_Rain_1",
                 "30_Rain_2",
                 "31_Sunny_1",
                 "32_Sunny_2"]
    
    var soundbites = ["33_Songs_about_abusing_drugs_and_women",
                      "34_Tommy__The_nightmare__Smith_on_The_Dust",
                      "37_If_the_police_can't_stop_you_#1",
                      "38_If_the_police_can't_stop_you_#2",
                      "39_K-DST__The_Dust",
                      "40_Gone_to_rehab",
                      "41_Ashes_to_ashes,_Dust_to_Dust",
                      "43_Music_never_gets_old"]
    
    var songs: [Song] = []
    songs.append(Song(title: "Eminence_Front",
                      intro: ["103_Eminence_front_Intro_DJ_1","103_Eminence_front_Intro_DJ_1"],
                      body: "101_Eminence_front",
                      outro: ["106_Eminence_front_Outro_DJ_1", "107_Eminence_front_Outro_DJ_2"]))
    songs.append(Song(title: "Running_Down_A_Dream",
                      intro: ["46_Running_down_a_dream_Intro_DJ_1","47_Running_down_a_dream_Intro_DJ_2"],
                      body: "44_Running_down_a_dream",
                      outro: ["49_Running_down_a_dream_Outro_DJ_1", "50_Running_down_a_dream_Outro_DJ_2"]))
    songs.append(Song(title: "Barracuda",
                      intro: ["53_Barracuda_Intro_DJ_1","54_Barracuda_Intro_DJ_2"],
                      body: "51_Barracuda",
                      outro: ["56_Barracuda_Outro_DJ_1", "57_Barracuda_Outro_DJ_2"]))
    songs.append(Song(title: "Woman_to_Woman",
                      intro: ["60_Woman_to_woman_Intro_DJ_1","61_Woman_to_woman_Intro_DJ_2"],
                      body: "58_Woman_to_woman",
                      outro: ["63_Woman_to_woman_Outro_DJ_1", "64_Woman_to_woman_Outro_DJ_2"]))
    songs.append(Song(title: "Young_Turks",
                      intro: ["67_Young_Turks_Intro_DJ_1","68_Young_Turks_Intro_DJ_2"],
                      body: "65_Young_Turks",
                      outro: ["70_Young_Turks_Outro_DJ_1", "71_Young_Turks_Outro_DJ_2"]))
    songs.append(Song(title: "Somebody_Up_There",
                      intro: ["74_Somebody_up_there_likes_me_Intro_DJ_1","75_Somebody_up_there_likes_me_Intro_DJ_2"],
                      body: "72_Somebody_up_there_likes_me",
                      outro: ["77_Somebody_up_there_likes_me_Outro_DJ_1", "77_Somebody_up_there_likes_me_Outro_DJ_1"]))
    songs.append(Song(title: "Some_Kind_Of_Wonderful",
                      intro: ["80_Some_kind_of_wonderful_Intro_DJ_1","81_Some_kind_of_wonderful_Intro_DJ_2"],
                      body: "78_Some_kind_of_wonderful",
                      outro: ["83_Some_kind_of_wonderful_Outro_DJ_1", "84_Some_kind_of_wonderful_Outro_DJ_2"]))
    songs.append(Song(title: "Strutter",
                      intro: ["87_Strutter_Intro_DJ_1","88_Strutter_Intro_DJ_2"],
                      body: "85_Strutter",
                      outro: ["90_Strutter_Outro_DJ_1", "91_Strutter_Outro_DJ_2"]))
    songs.append(Song(title: "Hold_The_Line",
                      intro: ["93_Hold_the_line_Intro","93_Hold_the_line_Intro"],
                      body: "92_Hold_the_line",
                      outro: ["94_Hold_the_line_Outro", "94_Hold_the_line_Outro"]))
    songs.append(Song(title: "Green_River",
                      intro: ["97_Green_river_Intro_DJ_1","98_Green_river_Intro_DJ_2"],
                      body: "95_Green_river",
                      outro: ["99_Green_river_Outro", "99_Green_river_Outro"]))
    songs.append(Song(title: "A_Horse_With_No_Name",
                      intro: ["110_A_horse_with_no_name_Intro_DJ_1","111_A_horse_with_no_name_Intro_DJ_2"],
                      body: "108_A_horse_with_no_name",
                      outro: ["113_A_horse_with_no_name_Outro_DJ_1", "114_A_horse_with_no_name_Outro_DJ_2"]))
    songs.append(Song(title: "Slow_Ride",
                      intro: ["117_Slow_ride_Intro_DJ_1","118_Slow_ride_Intro_DJ_2"],
                      body: "115_Slow_ride",
                      outro: ["120_Slow_ride_Outro_DJ_1", "121_Slow_ride_Outro_DJ_2"]))
    songs.append(Song(title: "White_Wedding",
                      intro: ["124_White_wedding_Intro_DJ_1","125_White_wedding_Intro_DJ_2"],
                      body: "122_White_wedding",
                      outro: ["127_White_wedding_Outro_DJ_1", "128_White_wedding_Outro_DJ_2"]))
    songs.append(Song(title: "Get_Down_To_It",
                      intro: ["131_Get_down_to_it_Intro_DJ_1","132_Get_down_to_it_Intro_DJ_2"],
                      body: "129_Get_down_to_it",
                      outro: ["134_Get_down_to_it_Outro_DJ_1", "135_Get_down_to_it_Outro_DJ_2"]))
    songs.append(Song(title: "Two_Tickets_To_Paradise",
                      intro: ["138_Two_tickets_to_paradise_Intro_DJ_1","139_Two_tickets_to_paradise_Intro_DJ_2"],
                      body: "136_Two_tickets_to_paradise",
                      outro: ["141_Two_tickets_to_paradise_Outro_DJ_1", "142_Two_tickets_to_paradise_Outro_DJ_2"]))
    songs.append(Song(title: "Smokin",
                      intro: ["145_Smokin\'_Intro_DJ_1","146_Smokin\'_Intro_DJ_2"],
                      body: "143_Smokin\'",
                      outro: ["148_Smokin\'_Outro_DJ_1", "149_Smokin\'_Outro_DJ_2"]))
    songs.append(Song(title: "Free_Bird",
                      intro: ["152_Free_bird_Intro_DJ_1","153_Free_bird_Intro_DJ_2"],
                      body: "150_Free_bird",
                      outro: ["155_Free_bird_Outro_DJ_1", "156_Free_bird_Outro_DJ_2"]))
    
    
    
    var i = 0
    let j = songs.count
    while i < j {
        let index = Int(arc4random_uniform(UInt32(songs.count)))
        let index2 = Int(arc4random_uniform(UInt32(soundbites.count)))
        let index3 = Int(arc4random_uniform(UInt32(tommy.count)))
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
        let outroindex = Int(arc4random_uniform(2))
        let temp_song = songs[index]
        let temp_soundbite = soundbites[index2]
        let temp_tommy = tommy[index3]
        var temp_ad = [String]()
        temp_ad.append("audio/KDST/" + adverts[index4])
        temp_ad.append("audio/KDST/" + adverts[index5])
        temp_ad.append("audio/KDST/" + adverts[index6])
        temp_ad.append("audio/KDST/" + adverts[index7])
        temp_ad.append("audio/KDST/" + adverts[index8])
        //print(temp_ad)
        var indices = [Int]()
        indices.append(index4)
        indices.append(index5)
        indices.append(index6)
        indices.append(index7)
        indices.append(index8)
        let temp_intro = "audio/KDST/" + temp_song.intro[introindex]
        let temp_body = "audio/KDST/" + temp_song.body
        let temp_outro = "audio/KDST/" + temp_song.outro[outroindex]
        let temp_sb = "audio/KDST/" + temp_soundbite
        let temp_dj = "audio/KDST/" + temp_tommy
        
        //print(temp_intro)
        //print(temp_body)
        //print(temp_outro)
        
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_sb, ofType: "m4a")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_dj, ofType: "m4a")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_intro, ofType: "m4a")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_body, ofType: "m4a")!)), after: nil)
        playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_outro, ofType: "m4a")!)), after: nil)
        
        for i in 0..<nadverts {
            playlist.insert(AVPlayerItem(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: temp_ad[i], ofType: "mp3")!)), after: nil)
            //adverts.remove(at: indices[i+1])
        }
        
        songs.remove(at: index)
        //tommy.remove(at: index3)
        i += 1
    }
    
    return playlist
}
