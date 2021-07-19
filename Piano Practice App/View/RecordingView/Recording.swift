////
////  Recording.swift
////  Piano Practice App
////
////  Created by Jin Park on 7/10/21.
////
//
//import Foundation
//import AVFoundation
//import UIKit
//
//var recordButton: UIButton!
//var recordingSession: AVAudioSession!
//var audioRecorder: AVAudioRecorder!
//
//func viewDidLoad() {
//    recordingSession = AVAudioSession.sharedInstance()
//
//    do {
//        try recordingSession.setCategory(.playAndRecord, mode: .default)
//        try recordingSession.setActive(true)
//        recordingSession.requestRecordPermission() { [unowned self] allowed in
//            DispatchQueue.main.async {
//                if allowed {
//                    self.loadRecordingUI()
//                } else {
//                    // failed to record!
//                }
//            }
//        }
//    } catch {
//        // failed to record!
//    }
//}
//
//func loadRecordingUI() {
//    recordButton = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
//    recordButton.setTitle("Tap to Record", for: .normal)
//    recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
//    recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
//    view.addSubview(recordButton)
//}
//
//func startRecording() {
//    let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
//
//    let settings = [
//        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//        AVSampleRateKey: 12000,
//        AVNumberOfChannelsKey: 1,
//        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
//    ]
//
//    do {
//        audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
//        audioRecorder.delegate = self
//        audioRecorder.record()
//
//        recordButton.setTitle("Tap to Stop", for: .normal)
//    } catch {
//        finishRecording(success: false)
//    }
//}
//
//func getDocumentsDirectory() -> URL {
//    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//    return paths[0]
//}
//
//func finishRecording(success: Bool) {
//    audioRecorder.stop()
//    audioRecorder = nil
//
//    if success {
//        recordButton.setTitle("Tap to Re-record", for: .normal)
//    } else {
//        recordButton.setTitle("Tap to Record", for: .normal)
//        // recording failed :(
//    }
//}
//
//@objc func recordTapped() {
//    if audioRecorder == nil {
//        startRecording()
//    } else {
//        finishRecording(success: true)
//    }
//}
//
//
//func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//    if !flag {
//        finishRecording(success: false)
//    }
//}
