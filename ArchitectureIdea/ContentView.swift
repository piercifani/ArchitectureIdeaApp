import SwiftUI

struct ContentView: View {
    
    @Environment(ContentViewModel.self)
    var contentViewModel
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            
            if let model = ___viewModel {
                Text("Is Recording: \(model.recordingState.isRecording ? "Yes" : "No")")
                Spacer().frame(height: 20)
                Button(model.recordingState.isRecording ? "Stop Recording" : "Start Recording") {
                    if !model.recordingState.isRecording {
                        model.start()
                    } else {
                        model.stop()
                    }
                }
                Button("Refresh Devices") {
                    model.refreshDevices()
                }
                Button("Clear Devices") {
                    model.clearDevices()
                }
                List(model.recordingState.devices, id: \.self) { device in
                    Text(device)
                }
            }
        }
        .padding()
        .animation(.default, value: contentViewModel.recordingState.devices)
    }
    
    /// This is here just to make the diff seem smaller on GitHub
    private var ___viewModel: ContentViewModel? {
        return contentViewModel
    }
}

// Preview

#Preview {
    ContentView()
        .environment(ContentViewModel.mockForPreviews())
}
