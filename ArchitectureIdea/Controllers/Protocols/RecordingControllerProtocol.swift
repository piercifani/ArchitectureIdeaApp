import Foundation
import SwiftUI
import ScreenCaptureKit
import AVFoundation

protocol RecordingControllerProtocol: AnyObject {
    func refreshDevices() async
    func startRecording() async
    func stopRecording() async
    func clearDevices() async
}
