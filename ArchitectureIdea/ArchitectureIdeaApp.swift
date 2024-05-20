import SwiftUI

@main
struct ArchitectureIdeaApp: App {
    
    private let recordingState = RecordingState()
    
    private var recordingController: RecordingController
    private var contentViewModel: ContentViewModel?
    
    init() {
        self.recordingController = RecordingController(recordingState: recordingState)
        self.contentViewModel = ContentViewModel(recordingState: recordingState, recordingController: recordingController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.contentViewModel, contentViewModel)
        }
    }
}
