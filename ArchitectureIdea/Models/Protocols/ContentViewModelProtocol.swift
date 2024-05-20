import Foundation
import SwiftUI

protocol ContentViewModelProtocol: AnyObject {
    var isRecording: Bool { get set }
    var devices: [String] { get set }
    
    func start() async
    func stop() async
    func refreshDevices() async
    func clearDevices() async
}
