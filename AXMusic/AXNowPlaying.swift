//
//  AXNowPlaying.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import Foundation
import AVKit
import MediaPlayer

class AXNowPlaying: NSObject, ObservableObject {
    @Published var currentSongPosition = 0
    @Published var currentSong: AXSongElement = AXSongElement.allSongElements[0]
    @Published var currentAlbum: (Bool, String?) = (false, nil)
    
    @Published var audioPlayer: AVAudioPlayer!
    
    var hasActions = false
    
    func play() {
        let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        updateMediaInformation()
        if hasActions == false {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            } catch {
                print(error.localizedDescription)
            }
            
            addActionsToControlCenter()
            hasActions = true
        }
    }
    
    func updateMediaInformation() {
        let nowPlayingInfo : [String : Any] = [
            MPMediaItemPropertyPlaybackDuration: audioPlayer.duration,
            MPMediaItemPropertyTitle: currentSong.title,
            MPMediaItemPropertyArtist: currentSong.author,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: audioPlayer.currentTime,
            //            MPNowPlayingInfoPropertyPlaybackQueueCount  : totalCount as AnyObject,
            //            MPNowPlayingInfoPropertyPlaybackQueueIndex  : playIndex as AnyObject,
            MPMediaItemPropertyMediaType : MPMediaType.anyAudio.rawValue,
        ]
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    //    override func remoteControlReceived(with event: UIEvent?) {
    //        if event!.type == UIEvent.EventType.remoteControl{
    //            switch event!.subtype{
    //            case UIEvent.EventSubtype.remoteControlPlay:
    //                play(self)
    //            case UIEvent.EventSubtype.remoteControlPause:
    //                play(self)
    ////            case UIEvent.EventSubtype.remoteControlNextTrack:
    ////                next(self)
    ////            case UIEvent.EventSubtype.remoteControlPreviousTrack:
    ////                previous(self)
    //            default:
    //                print("There is an issue with the control")
    //            }
    //        }
    //    }
    
    func addActionsToControlCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.togglePlayPauseCommand.isEnabled = true
        commandCenter.togglePlayPauseCommand.addTarget(self, action: #selector(togglePlayPauseCommand(_:)))
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget(self, action: #selector(playCommand(_:)))
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget(self, action: #selector(pauseCommand(_:)))
        
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.nextTrackCommand.addTarget(self, action: #selector(nextCommand(_:)))
        
        commandCenter.previousTrackCommand.isEnabled = true
        commandCenter.previousTrackCommand.addTarget(self, action: #selector(previousCommand(_:)))
        
        commandCenter.changePlaybackPositionCommand.isEnabled = true
        commandCenter.changePlaybackPositionCommand.addTarget(self, action: #selector(changePlayBackPositionCommand(_:)))
        
        commandCenter.seekForwardCommand.isEnabled = true
        commandCenter.seekForwardCommand.addTarget(self, action: #selector(seekForwardCommand(_:)))
        
        commandCenter.seekBackwardCommand.isEnabled = true
        commandCenter.seekBackwardCommand.addTarget(self, action: #selector(seekBackwardCommand(_:)))
    }
    
    @objc func togglePlayPauseCommand(_ action: MPRemoteCommandCenter) -> MPRemoteCommandHandlerStatus {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            return .success
        } else {
            audioPlayer.play()
            return .success
        }
    }
    
    @objc func playCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
            return .success
        }
        return .commandFailed
    }
    
    @objc func pauseCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            return .success
        }
        return .commandFailed
    }
    
    @objc func nextCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        audioPlayer.pause()
        return .success
    }
    
    @objc func previousCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        audioPlayer.pause()
        return .success
    }
    
    @objc func changePlayBackPositionCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        let action = action as! MPChangePlaybackPositionCommandEvent
        audioPlayer.currentTime = action.positionTime
        return .success
    }
    
    @objc func seekForwardCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        audioPlayer.pause()
        return .success
    }
    
    @objc func seekBackwardCommand(_ action: MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus {
        audioPlayer.pause()
        return .success
    }
    
    
}
//
//class AXMediaInformation: NSObject, AVAudioPlayerDelegate {
//    var nowPlaying: AXNowPlaying
//
//    init(nowPlaying: AXNowPlaying) {
//        self.nowPlaying = nowPlaying
//    }
//
//    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
//        print("EOROROROR", error?.localizedDescription)
//    }
//
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        print("FINISHED")
//    }
//
//    func updateInfo() {
//        //        var nowPlayingInfo: [String: AnyObject] = [
//        //            MPMediaItemPropertyPlaybackDuration: nowPlaying.currentSong.
//        //        ]
//        //        var nowPlayingInfo : [String : AnyObject] = [
//        //        MPMediaItemPropertyPlaybackDuration : item.duration ?? 0 as AnyObject,
//        //        MPMediaItemPropertyTitle : item.contentObj.title as AnyObject,MPNowPlayingInfoPropertyElapsedPlaybackTime : item.currentTime as AnyObject,MPNowPlayingInfoPropertyPlaybackQueueCount :totalCount as AnyObject,MPNowPlayingInfoPropertyPlaybackQueueIndex : playIndex as AnyObject,MPMediaItemPropertyMediaType : MPMediaType.anyAudio.rawValue as AnyObject, MPMediaItemPropertyArtist]      MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
////        showMediaInfo()
//    }
//
//
//
////    @objc func
//}
