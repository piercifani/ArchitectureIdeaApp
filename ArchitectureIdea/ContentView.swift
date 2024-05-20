import SwiftUI

struct ContentView: View {
    @Environment(\.contentViewModel) var ContentViewModel
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            
            if let model = ContentViewModel {
                Text("Is Recording: \(model.isRecording ? "Yes" : "No")")
                Spacer().frame(height: 20)
                Button(model.isRecording ? "Stop Recording" : "Start Recording") {
                    Task {
                        if !model.isRecording {
                            await model.start()
                        } else {
                            await model.stop()
                        }
                    }
                }
                Button("Refresh Devices") {
                    Task {
                        await model.refreshDevices()
                    }
                }
                Button("Clear Devices") {
                    Task {
                        await model.clearDevices()
                    }
                }
                List(model.devices, id: \.self) { device in
                    Text(device)
                }
            }
        }
        .padding()
    }
}

// Preview

let viewModel = MockContentViewModel()

#Preview {
    ContentView()
        .environment(\.contentViewModel, viewModel)
}

