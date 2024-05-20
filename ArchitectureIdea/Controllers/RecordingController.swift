import Foundation
import SwiftUI
import ScreenCaptureKit
import AVFoundation
import OSLog

final class RecordingController: NSObject, @unchecked Sendable, AVCaptureVideoDataOutputSampleBufferDelegate, RecordingControllerProtocol {
    private(set) var recordingState: RecordingState

    init(recordingState: RecordingState) {
        self.recordingState = recordingState
        
        super.init() // Call the superclass's initializer
        
        setupTimer()
    }
    
    private func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            Task {
                print("Refreshing devices from background...")
                await self.refreshDevices()
            }
        }
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
}
