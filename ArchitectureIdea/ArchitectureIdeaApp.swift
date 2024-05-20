import SwiftUI

@main
struct ArchitectureIdeaApp: App {
    
    @State
    private var recordingState: RecordingState

    @State
    private var contentViewModel: ContentViewModel
    
    init() {
        let recordingState = RecordingState()
        self.recordingState = recordingState
        let recordingController = RecordingController(recordingState: recordingState)
        self.contentViewModel = ContentViewModel(
            recordingState: recordingState,
            recordingController: recordingController
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.contentViewModel, contentViewModel)
        }
    }
}
