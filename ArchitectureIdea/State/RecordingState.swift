import SwiftUI

@Observable
@MainActor
class RecordingState {
    
    private(set) var isRecording: Bool = false
    private(set) var devices: [String] = []
    
    func start() async {
        self.isRecording = true
        assert(Thread.current.isMainThread)
    }

    func stop() async {
        self.isRecording = false
        assert(Thread.current.isMainThread)
    }
    
    func updateDevices(_ devices: [String]) {
        self.devices = devices
        assert(Thread.current.isMainThread)
    }
    
    func clearDevices() async {
        self.devices = []
        assert(Thread.current.isMainThread)
    }
}
