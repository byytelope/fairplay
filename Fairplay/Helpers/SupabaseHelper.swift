import Foundation
import Supabase

struct SupabaseHelper {
  static let _decoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }()

  static let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://btfgxgtxneijuuvfsyav.supabase.co")!,
    supabaseKey: "sb_publishable_Fzp7Rxo2BMxVXysH2LE1rQ_YP4kTRdS",
    options: .init(
      db: .init(decoder: _decoder)
    )
  )
}
