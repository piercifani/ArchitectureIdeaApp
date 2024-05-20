import SwiftUI

@Observable
class RecordingState {
    private var _isRecording: Bool = false
    private var _devices: [String] = []
    
    var isRecording: Bool {
        get { _isRecording }
        set { _isRecording = newValue }
    }
    
    var devices: [String] {
        get { _devices }
        set { _devices = newValue }
    }
    
    @MainActor
    func start() async {
        self._isRecording = true
        print("MainActor should be main thread", Thread.current)
    }

    @MainActor
    func stop() async {
        self._isRecording = false
        print("MainActor should be main thread", Thread.current)
    }
    
    @MainActor
    func updateDevices(_ devices: [String]) {
        self.devices = devices
        print("MainActor should be main thread", Thread.current)
    }
    
    func clearDevices() async {
        self._devices = []
        print("Not MainActor random thread?", Thread.current)
    }
}

extension EnvironmentValues {
    var recordingState: RecordingState {
        get { self[RecordingStateKey.self] }
        set { self[RecordingStateKey.self] = newValue }
    }
}

private struct RecordingStateKey: EnvironmentKey {
    static var defaultValue: RecordingState = RecordingState()
}
