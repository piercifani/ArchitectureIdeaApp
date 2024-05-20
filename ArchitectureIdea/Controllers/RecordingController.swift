import Foundation
import SwiftUI
import ScreenCaptureKit
import AVFoundation
import OSLog

actor RecordingController: RecordingControllerProtocol {
    private(set) var recordingState: RecordingState
    
    private let avFoundationWrapper = AVFoundationWrapper()
    private var timer: Task<(), Never>!
    
    init(recordingState: RecordingState) {
        self.recordingState = recordingState
        Task { [weak self] in
            await self?.setupTimer()
        }
    }
    
    private func setupTimer() {
        let timer = Task(priority: .utility) { [weak self] in
            while !Task.isCancelled {
                guard let self else { return }
                await self.refreshDevices()
                try? await Task.sleep(for: .seconds(5))
            }
        }
        self.timer = timer
    }
    
    func startRecording() async {
        await recordingState.start()
    }
    
    func stopRecording() async {
        await recordingState.stop()
    }
    
    func refreshDevices() async {
        let names: [String] = [ "Device 1", "Device 2", "Device 3", "Device 4", "Device 5", "Device 6" ]
        
        let shuffledNameArray = names.shuffled()
        let randomNames = Array(shuffledNameArray.prefix(3))
                
        await recordingState.updateDevices(randomNames)
    }
    
    func clearDevices() async {
        await recordingState.clearDevices()
    }
    
    class AVFoundationWrapper: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        /// TODO: Actually wrap the stuff we need from AVFoundation
    }
}
