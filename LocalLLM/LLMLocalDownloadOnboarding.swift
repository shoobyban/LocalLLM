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
    @AppStorage("selectedModel") private var selectedModel: String = "LLMLocalModel.llama3_2_1B_4bit"

    private let models = [
        "LLMLocalModel.llama3_1_8B_4bit": "Llama 3.1, 8 Billion Parameters, Instruct Mode, 4-bit Version",
        "LLMLocalModel.llama3_8B_4bit": "Llama 3, 8 Billion Parameters, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.llama3_2_1B_4bit": "Llama 3.2, 1 Billion Parameters, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.llama3_2_3B_4bit": "Llama 3.2, 3 Billion Parameters, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.llama3_1_aloe_8B_4bit": "Llama 3.1 Aloe, Beta 8 Billion Parameters, 4-bit Version",
        "LLMLocalModel.llama3_med42_8B_4bit": "Llama 3.0 Med42, 8 Billion Parameters, 4-bit Version",
        "LLMLocalModel.mistralNeMo4bit": "Mistral Nemo, Instruction-Tuned, Model 2407, 4-bit Version",
        "LLMLocalModel.smolLM_135M_4bit": "SmolLM, 135 Million Parameters, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.mistral7B4bit": "Mistral, 7 Billion Parameters, Instruction-Tuned, Version 0.3, 4-bit Version",
        "LLMLocalModel.codeLlama13b4bit": "Code Llama, 13 Billion Parameters, Instruction-Tuned, Hugging Face Format, 4-bit, MLX Version",
        "LLMLocalModel.phi4bit": "Phi 2, Hugging Face Format, 4-bit, MLX Version",
        "LLMLocalModel.phi3_4bit": "Phi 3 Mini, 4K Context Window, Instruction-Tuned, 4-bit Version, No Q-Embedding",
        "LLMLocalModel.phi3_5_4bit": "Phi 3.5 Mini, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.gemma2bQuantized": "Quantized Gemma, 2 Billion Parameters, Instruction-Tuned",
        "LLMLocalModel.gemma_2_9b_it_4bit": "Gemma 2, 9 Billion Parameters, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.gemma_2_2b_it_4bit": "Gemma 2, 2 Billion Parameters, Instruction-Tuned, 4-bit Version",
        "LLMLocalModel.qwen1_5_0_5b_4bit": "Qwen 1.5, 0.5 Billion Parameters, Chat-Tuned, 4-bit Version",
        "LLMLocalModel.qwen2_7b_4bit": "Qwen 2, 7 Billion Parameters, 4-bit version",
        "LLMLocalModel.openelm270m4bit": "OpenELM, 270 Million Parameters, Instruction-Tuned",
        "LLMLocalModel.deepseek_r1_distill_qwen_1_5b_8bit": "DeepSeek R1 Distill Qwen 1.5 Billion Parameters, 8-bit Version",
        "LLMLocalModel.deepseek_r1_distill_qwen_7b_4bit": "DeepSeek R1 Distill Qwen 7 Billion Parameters, 4-bit Version",
        "LLMLocalModel.deepseek_r1_distill_llama_8b_4bit": "DeepSeek R1 Distill Llama 8 Billion Parameters, 4-bit Version"
    ]

    var body: some View {
        VStack {
            Picker("Select Model", selection: $selectedModel) {
                ForEach(models.keys.sorted(), id: \.self) { key in
                    Text(models[key] ?? key).tag(key)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            LLMLocalDownloadView(
                model: selectedModel,
                downloadDescription: models[selectedModel] ?? "No description available."
            ) {
                showOnboarding = false
            }
        }
    }
}

