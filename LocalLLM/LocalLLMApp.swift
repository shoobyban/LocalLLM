//
//  LocalLLMApp.swift
//  LocalLLM
//
//  Created by Sam Ban on 20/03/2025.
//

import SwiftUI
import SpeziLLMLocalDownload
import Spezi
import SpeziLLM
import SpeziLLMLocal

@main
struct LocalLLMApp: App {
    @ApplicationDelegateAdaptor(LocalLLMAppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView().spezi(appDelegate)
        }
    }
}

class LocalLLMAppDelegate: SpeziAppDelegate {
    override var configuration: Configuration {
        Configuration {
            LLMRunner {
                LLMLocalPlatform()
            }
        }
    }
}
