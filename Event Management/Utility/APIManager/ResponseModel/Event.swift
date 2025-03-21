//
//  Event.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation

//MARK: - Static Data

struct Event{
    let id: Int
    let title: String
    let image: String
    let details: String
    let price: String
    let location: String
    let date: String
}

let data:[Event] = [
    Event(id: 1,
          title:"Happy Birthday" ,
          image: "BrithdayEvent",
          details: "Today is all about celebrating YOU! May your day be filled with love, laughter, and unforgettable moments. As you step into another amazing year, may it bring you success, happiness, and endless opportunities. Enjoy every second of your special day with family, friends, and all the things that make you smile./n Let the cake be sweet, the gifts be thoughtful, and the memories be everlasting! 🎂🎁🥳 Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success!.Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success! 🚀🎈🎊", price: "499 onwards", location: "Ahmedabad", date: "Sat 25 Mar 2025"),
    Event(id: 2,
          title:"Fusion Fest" ,
          image: "Fusion Fest",
          details: "Welcome to Fusion Fest! 🎉 A vibrant celebration where culture, music, art, and flavors come together in perfect harmony. Get ready for an electrifying experience filled with performances, delicious food, and unforgettable memories. Let’s unite, celebrate diversity, and make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember! make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember! make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember! make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember!🎶🎨🍽️🎊", price: "699 onwards",location: "Gandhinagar",date: "Sun 1 Jan 2025"),
    Event(id: 3,
          title:"Happy Holi" ,
          image: "HoliEvent",
          details: "Celebrate the festival of colors with joy, laughter, and endless fun! Let’s spread love, happiness, and positivity as we drench ourselves in vibrant hues. Dance to the beats of dhol, enjoy delicious festive treats, and create unforgettable memories. May this Holi bring brightness, prosperity, and togetherness into your life. Wishing you a colorful and joy-filled celebration!. Wishing you a colorful and joy-filled celebration!Wishing you a colorful and joy-filled celebration!. Wishing you a colorful and joy-fille celebration!Wishing you a colorful and joy-filled celebration!. Wishing you a colorful and joy-filled celebration! 🎨🎶🎉", price: "699 onwards", location: "Gandhinagar", date: "Mon 15 Feb 2025"),
    Event(id: 4,
          title:"Night Party " ,
          image: "NightParty",
          details: "The night is young, and the party is just getting started! 🌙💃 Enjoy electrifying music, dazzling lights, and non-stop entertainment with an incredible crowd. Dance, laugh, and make memories that last a lifetime. Let’s turn the night into an epic celebration filled with energy and excitement! Dance, laugh, and make memories that last a lifetime. Let’s turn the night into an epic celebration filled with energy and excitement!.  Let’s turn the night into an epic celebration filled with energy and excitement! that last a lifetime. Let’s turn the night into an epic celebration filled with energy and excitement!.  Let’s turn the night into an epic celebration filled with energy and excitement!  🎶🔥🍹 ", price: "1000 onwards", location: "Ahmedabad", date: "Sat 25 Mar 2025"),
    Event(id: 5,
          title:"Welcome to Nova Night! " ,
          image: "NovaNight",
          details: "Get ready for an electrifying evening filled with music, dance, and unforgettable vibes! 🎶💃 Let the dazzling lights and high-energy beats take you on a night of pure excitement. Celebrate under the stars, enjoy thrilling performances, and create magical memories. Nova Night is where the party comes alive—let’s make it legendary. create magical memories. Nova Night is where the party comes alive—let’s make it legendary! create magical memories. Nova Night is where the party comes alive—let’s make it legendary. create magical memories. Nova Night is where the party comes alive—let’s make it legendary! 🌙🔥🥂", price: "1500 onwards", location: "Ahmedabad", date: "Sun 01 Mar 2025 "),
    Event(id: 6,
          title:"Happy Birthday" ,
          image: "BrithdayEvent",
          details: "Today is all about celebrating YOU! May your day be filled with love, laughter, and unforgettable moments. As you step into another amazing year, may it bring you success, happiness, and endless opportunities. Enjoy every second of your special day with family, friends, and all the things that make you smile./n Let the cake be sweet, the gifts be thoughtful, and the memories be everlasting! 🎂🎁🥳 Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success!.Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success! Wishing you a fantastic year ahead filled with adventure and success! 🚀🎈🎊", price: "499 onwards", location: "Ahmedabad", date: "Sat 25 Mar 2025"),
    Event(id: 7,
          title:"Fusion Fest" ,
          image: "Fusion Fest",
          details: "Welcome to Fusion Fest! 🎉 A vibrant celebration where culture, music, art, and flavors come together in perfect harmony. Get ready for an electrifying experience filled with performances, delicious food, and unforgettable memories. Let’s unite, celebrate diversity, and make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember! make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember! make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember! make this festival one to remember!. Let’s unite, celebrate diversity, and make this festival one to remember!🎶🎨🍽️🎊", price: "699 onwards",location: "Ahmedabad",date: "Sun 1 Jan 2025"),
    Event(id: 8,
          title:"Happy Holi" ,
          image: "HoliEvent",
          details: "Celebrate the festival of colors with joy, laughter, and endless fun! Let’s spread love, happiness, and positivity as we drench ourselves in vibrant hues. Dance to the beats of dhol, enjoy delicious festive treats, and create unforgettable memories. May this Holi bring brightness, prosperity, and togetherness into your life. Wishing you a colorful and joy-filled celebration!. Wishing you a colorful and joy-filled celebration!Wishing you a colorful and joy-filled celebration!. Wishing you a colorful and joy-fille celebration!Wishing you a colorful and joy-filled celebration!. Wishing you a colorful and joy-filled celebration! 🎨🎶🎉", price: "699 onwards", location: "Gandhinagar", date: "Mon 15 Feb 2025"),
    Event(id: 9,
          title:"Night Party " ,
          image: "NightParty",
          details: "The night is young, and the party is just getting started! 🌙💃 Enjoy electrifying music, dazzling lights, and non-stop entertainment with an incredible crowd. Dance, laugh, and make memories that last a lifetime. Let’s turn the night into an epic celebration filled with energy and excitement! Dance, laugh, and make memories that last a lifetime. Let’s turn the night into an epic celebration filled with energy and excitement!.  Let’s turn the night into an epic celebration filled with energy and excitement! that last a lifetime. Let’s turn the night into an epic celebration filled with energy and excitement!.  Let’s turn the night into an epic celebration filled with energy and excitement!  🎶🔥🍹 ", price: "1000 onwards", location: "Ahmedabad", date: "Sat 25 Mar 2025"),
    Event(id: 10,
          title:"Welcome to Nova Night! " ,
          image: "NovaNight",
          details: "Get ready for an electrifying evening filled with music, dance, and unforgettable vibes! 🎶💃 Let the dazzling lights and high-energy beats take you on a night of pure excitement. Celebrate under the stars, enjoy thrilling performances, and create magical memories. Nova Night is where the party comes alive—let’s make it legendary. create magical memories. Nova Night is where the party comes alive—let’s make it legendary! create magical memories. Nova Night is where the party comes alive—let’s make it legendary. create magical memories. Nova Night is where the party comes alive—let’s make it legendary! 🌙🔥🥂", price: "1500 onwards", location: "Ahmedabad", date: "Sun 01 Mar 2025 ")
    
]
