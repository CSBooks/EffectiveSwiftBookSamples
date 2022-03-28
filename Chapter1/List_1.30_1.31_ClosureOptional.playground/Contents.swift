/// Boolを引数に取るクロージャの関数を実行するだけの型
struct BoolInteractor {
    // カラのクロージャをデフォルト引数とする
    func perform(closure: (Bool) -> () = { _ in }) {
        closure(Bool.random())
    }

    // Optionalのクロージャをデフォルト引数とする。
    func execute(closure: ((Bool) -> ())? = nil) {
        closure?(Bool.random()) // closure!()にするのはミス
    }
}

class Person {
    private let firstName: String
    private let interactor: BoolInteractor

    init(
        firstName: String,
        interactor: BoolInteractor = BoolInteractor()
    ) {
        self.firstName = firstName
        self.interactor = interactor
    }

    // 引数のクロージャを省略できるのは変わらない
    func f1() {
        interactor.perform()
        interactor.execute()
    }

    func f2() {
        interactor.perform { _ in
            // もちろんselfを省略できるのでエラーにならない
            print("\(firstName) ")
        }

        interactor.execute { _ in
            // selfを明示しないとコンパイルエラー
            print("\(self.firstName)")
        }
    }
}

do {
    let person = Person(firstName: "John")
    person.f2()
}

