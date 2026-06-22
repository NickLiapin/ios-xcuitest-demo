import SwiftUI

/// A simple counter shown after login: increment, decrement, reset.
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome")
                .font(.title)
                .accessibilityIdentifier("welcomeLabel")

            Text("\(count)")
                .font(.system(size: 48, weight: .bold))
                .monospacedDigit()
                .accessibilityIdentifier("countLabel")

            HStack(spacing: 16) {
                Button("-") { count -= 1 }
                    .accessibilityIdentifier("decrementButton")
                Button("Reset") { count = 0 }
                    .accessibilityIdentifier("resetButton")
                Button("+") { count += 1 }
                    .accessibilityIdentifier("incrementButton")
            }
            .font(.title2)
            .buttonStyle(.bordered)
        }
        .padding()
        .navigationTitle("Counter")
    }
}

#Preview {
    CounterView()
}
