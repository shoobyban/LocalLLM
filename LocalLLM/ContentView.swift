//
//  ContentView.swift
//  LocalLLM
//
//  Created by Sam Ban on 20/03/2025.
//

import SwiftUI
import SpeziLLM
import SpeziChat
import SpeziLLMLocal
import SpeziLLMLocalDownload

let MODEL = LLMLocalModel.llama3_2_1B_4bit
let ONBOARDING_COMPLETE = "llm.onboarding.complete"

struct ContentView: View {
    @State var greeting = true
    @AppStorage(ONBOARDING_COMPLETE) var showOnboarding = true
    @LLMSessionProvider<LLMLocalSchema> var session: LLMLocalSession

    var ready: Bool {
        return LLMLocalDownloadManager.modelExist(model: MODEL)
    }
    
    var body: some View {
        NavigationView {
            LLMChatView(
                session: $session
            )
            .sheet(isPresented: $showOnboarding) {
                LLMLocalDownloadOnboarding(showOnboarding: $showOnboarding)
            }
            .navigationTitle("Local LLM")
            .task {
                if greeting {
                    let assistantMessage = LLMContextEntity(role: .assistant(), content: "Welcome! Ignore the progressbar below, it's just a placeholder. Ask away.")
                    session.context.insert(assistantMessage, at: 0)
                }
                greeting = false
            }
        }
    }
    
    init() {
        self._session = LLMSessionProvider(schema: LLMLocalSchema(model: MODEL))
    }
}

