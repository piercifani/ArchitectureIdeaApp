class MockContentViewModel: ContentViewModelProtocol {
    private let recordingState: RecordingState
    
    var isRecording: Bool = true
    
    var devices: [String] = ["device is cool"]
    
    init() {
        recordingState = RecordingState()
    }

    func start() async {
       
    }

    func stop() async {

    }
    
    func refreshDevices() async {
     
    }
    
    func clearDevices() async {
        
    }
}
