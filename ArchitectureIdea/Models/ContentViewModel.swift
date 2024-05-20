import SwiftUI
import Observation

@Observable
@MainActor
class ContentViewModel {
    
    @ObservationIgnored
    private let recordingController: RecordingControllerProtocol
    
    let recordingState: RecordingState
    
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
    
    func start() {
        Task {
            await recordingController.startRecording()
        }
    }

    func stop() {
        Task {
            await recordingController.stopRecording()
        }
    }
    
    func refreshDevices() {
        Task {
            await recordingController.refreshDevices()
        }
    }
    
    func clearDevices() {
        Task {
            await recordingController.clearDevices()
        }
    }
}
