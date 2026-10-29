
import SwiftUI
import UniformTypeIdentifiers

@main
struct CADENZZAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var showPicker = false
    @State private var selectedFile = "No file selected"

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(.cyan)

                Text("CADENZZA")
                    .font(.largeTitle.bold())

                Text("Auto Convert")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Text(selectedFile)
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                Button("Choose ZIP / Unity3D File") {
                    showPicker = true
                }
                .buttonStyle(.borderedProminent)

                Text("Select a file to prepare for inspection.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("Home")
            .fileImporter(
                isPresented: $showPicker,
                allowedContentTypes: [.zip, .item],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    selectedFile = urls.first?.lastPathComponent
                        ?? "No file selected"
                case .failure:
                    selectedFile = "Unable to open file"
                }
            }
        }
    }
}
