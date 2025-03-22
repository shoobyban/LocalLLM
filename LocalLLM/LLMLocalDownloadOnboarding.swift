//
//  LLMLocalDownloadOnboarding.swift
//  LocalLLM
//
//  Created by Sam Ban on 20/03/2025.
//

import SpeziLLMLocalDownload
import SpeziOnboarding
import SpeziViews
import SwiftUI

/// Onboarding view that downloads a model to the local device.
struct LLMLocalDownloadOnboarding: View {
    @Binding var showOnboarding: Bool

    var body: some View {
        VStack {
            LLMLocalDownloadView(
                model: MODEL,
                downloadDescription: "Llama 3.2, 1 Billion Parameters, Instruction-Tuned, 4-bit Versions will be downloaded."
            ) {
                showOnboarding = false
            }
        }
    }
}

