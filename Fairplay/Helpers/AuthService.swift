import GoogleSignIn
import Supabase
import SwiftUI

@Observable
class AuthService {
  func signInWithGoogle() async throws {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
    guard let rootViewController = windowScene.windows.first?.rootViewController else { return }

    let result = try await GIDSignIn.sharedInstance.signIn(
      withPresenting: rootViewController
    )

    guard let idToken = result.user.idToken?.tokenString else {
      print("No idToken found.")
      return
    }

    let accessToken = result.user.accessToken.tokenString
    try await supabase.auth.signInWithIdToken(
      credentials: OpenIDConnectCredentials(
        provider: .google,
        idToken: idToken,
        accessToken: accessToken
      )
    )
  }

  func signOut() async throws {
    GIDSignIn.sharedInstance.signOut()
    try await supabase.auth.signOut()
  }
}
