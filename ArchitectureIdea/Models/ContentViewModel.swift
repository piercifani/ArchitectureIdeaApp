import SwiftUI
import Observation

@Observable class ContentViewModel {
    
    @ObservationIgnored
    private let recordingController: RecordingControllerProtocol
    
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

    static func mockForPreviews() -> ContentViewModel {
        let mockState = RecordingState()
        #warning("RecordingController should be mocked here")
        let recordingController = RecordingController(recordingState: mockState)
        return .init(recordingState: mockState, recordingController: recordingController)
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
