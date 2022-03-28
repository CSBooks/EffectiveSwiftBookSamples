struct User: Decodable, Identifiable {
    let id: Int
    // ...
}

struct UserDataSource {
    func loadUser(for id: User.ID) -> User {
        // 本来はDBなどから取得したものを返すなど
        // ...
        User(id: id) // FIXME: 初期に載せる際は削除する
    }
}

let user = UserDataSource().loadUser(for: 1)
