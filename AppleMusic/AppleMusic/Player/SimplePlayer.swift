//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by GIGAS on 2021/03/08.
//  Copyright © 2021 GIGAS. All rights reserved.
//

import AVFoundation

class SimplePlayer {
    // TODO: 싱글톤 만들기, 왜 만드는가?
    static let shared = { SimplePlayer() }()
    
    private let player = AVPlayer()

    var currentTime: Double {
        // TODO: currentTime 구하기
        return player.currentItem?.currentTime().seconds ?? .zero
    }
    
    var totalDurationTime: Double {
        // TODO: totalDurationTime 구하기
        return player.currentItem?.duration.seconds ?? .zero
    }
    
    var isPlaying: Bool {
        // TODO: isPlaying 구하기
        guard player.currentItem != nil else { return false }
        return player.rate != 0
    }
    
    var currentItem: AVPlayerItem? {
        // TODO: currentItem 구하기
        return player.currentItem
    }
    
    init() { }
    
    func pause() {
        // TODO: pause구현
        player.pause()
    }
    
    func play() {
        // TODO: play구현
        player.play()
    }
    
    func seek(to time:CMTime) {
        // TODO: seek구현
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with item: AVPlayerItem?) {
        // TODO: replace current item 구현
        player.replaceCurrentItem(with: item)
    }
    
    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
