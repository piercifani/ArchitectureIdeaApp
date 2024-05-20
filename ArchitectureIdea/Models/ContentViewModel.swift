import SwiftUI
import Observation

@Observable class ContentViewModel: ContentViewModelProtocol {
    @ObservationIgnored private let recordingController: RecordingController
    
    private let recordingState: RecordingState
    
    var isRecording: Bool {
        get { recordingState.isRecording }
        set { }
    }
    
    var devices: [String] {
        get { recordingState.devices }
        set { }
    }

    init(recordingState: RecordingState, recordingController: RecordingController) {
        self.recordingState = recordingState
        self.recordingController = recordingController
    }

    func start() async {
        await recordingController.startRecording()
    }

    func stop() async {
        await recordingController.stopRecording()
    }
    
    func refreshDevices() async {
        await recordingController.refreshDevices()
    }
    
    func clearDevices() async {
        await recordingController.clearDevices()
    }
}

extension EnvironmentValues {
    var contentViewModel: ContentViewModelProtocol? {
        get { self[ContentViewModelProtocolKey.self] }
        set { self[ContentViewModelProtocolKey.self] = newValue }
    }
}

private struct ContentViewModelProtocolKey: EnvironmentKey {
    static var defaultValue: ContentViewModelProtocol? = nil
}
