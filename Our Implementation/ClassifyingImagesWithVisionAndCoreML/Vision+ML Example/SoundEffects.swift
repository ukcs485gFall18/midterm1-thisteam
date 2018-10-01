//
//  SoundEffects.swift
//  Vision+ML Example
//
//  Created by Adam Brassfield on 9/30/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import AudioToolbox

/*
 playSound uses logic to determine what an animal has been determined to be and
 selects a matching audio file to play
 
 Contains elements from lesson 18.3 in "Intro to App Development in Swift" by Apple.
 Code associated with this lesson is available for free by Apple at https://developer.apple.com/go/?id=intro-app-dev-curriculum-swift4
 
 bark.mp3 found at http://soundbible.com/2215-Labrador-Barking-Dog.html
 meow.mp3 found at http://soundbible.com/1954-Cat-Meow-2.html
 moo.mp3 found at http://soundbible.com/1572-Single-Cow.html
 baah.mp3 found at http://soundbible.com/520-Sheep-Bleating.html
 turtleNoise.mp3 found at http://soundbible.com/1137-Bubbles.html
 Some audio files were edited to better match the needs of our application
*/
func playSound(for animal:String) {
    var soundID:SystemSoundID = 0
    
    var soundURL:URL
    // The animal types include dog, cat, cow, sheep, and turtle
    if (animal.lowercased().contains("dog")) {
        soundURL = Bundle.main.url(forResource: "bark", withExtension: "mp3")!
    } else if (animal.lowercased().contains("cat")) {
        soundURL = Bundle.main.url(forResource: "meow", withExtension: "mp3")!
    } else if (animal.lowercased().contains("cow")) {
        soundURL = Bundle.main.url(forResource: "moo", withExtension: "mp3")!
    } else if (animal.lowercased().contains("sheep")) {
        soundURL = Bundle.main.url(forResource: "baah", withExtension: "mp3")!
    } else {
        soundURL = Bundle.main.url(forResource: "turtleNoise", withExtension: "mp3")!
    }
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
    AudioServicesPlaySystemSound(soundID)
}
