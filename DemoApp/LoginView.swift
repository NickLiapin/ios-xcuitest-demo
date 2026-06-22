import SwiftUI

/// A small login screen. Valid credentials (admin / secret) navigate to the
/// counter screen; anything else shows an error. Every control has an
/// accessibility identifier so UI tests can target it reliably.
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var error: String?
    @State private var loggedIn = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .accessibilityIdentifier("usernameField")

                SecureField("Password", text: $password)
                    .accessibilityIdentifier("passwordField")

                if let error {
                    Text(error)
                        .foregroundStyle(.red)
                        .accessibilityIdentifier("errorLabel")
                }

                Button("Log in") {
                    if username == "admin" && password == "secret" {
                        error = nil
                        loggedIn = true
                    } else {
                        error = "Invalid credentials"
                    }
                }
                .accessibilityIdentifier("loginButton")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            .navigationDestination(isPresented: $loggedIn) {
                CounterView()
            }
        }
    }
}

#Preview {
    LoginView()
}
