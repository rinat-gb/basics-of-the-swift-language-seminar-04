// 1.Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).

enum PizzaKind_1 {
    case Pepperoni
    case ChetyreSyra
    case Barbeku
    case Diablo
}

// 2. Создать структуру пиццы. Она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки
// (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы.
// Подсказка: добавки лучше также сделать перечислением.

struct Pizza {
    enum PizzaKind: String {
        case Pepperoni = "Пепперони"
        case ChetyreSyra = "4 сыра"
        case Barbeku = "Барбекю"
        case Diablo = "Дьябло"

        func getPizzaName() -> String { rawValue }
    }

    enum Additions: String {
        case Tomatoes = "помидоры"
        case Sausage = "колбаса"
        case Pepper = "перец"
        case Cheese = "сыр"

        func getAdditionName() -> String { rawValue }
    }

    mutating func addAddition(addition: Additions) {
        additions.append(addition)
    }

    var pizzaKind: PizzaKind
    var additions: [Additions] = []
    var isTestoTonkoe: Bool
}

// 3. Создать класс пиццерии, добавить массив с возможными видами пиццы.
// Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.

class Pizzeria_3 {
    private var pizzas: [Pizza]

    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }
}

// 4. Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.

class Pizzeria {
    private var pizzas: [Pizza]

    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }

    public var description: String {
        var res = "Список всех пиц в пиццерии:"

        for (num, pizza) in pizzas.enumerated() {
            res += "\n" + String(num + 1) + ". " + pizza.pizzaKind.getPizzaName()

            if !pizza.additions.isEmpty {
                res += " (с дополнениями):"

                for addition in pizza.additions {
                    res += "\n\t" + addition.getAdditionName()
                }
            }

            if pizza.isTestoTonkoe {
                res += ", тонкое тесто"
            } else {
                res += ", толстое тесто"
            }
        }
        return res
    }

    func addPizza(pizza: Pizza) {
        pizzas.append(pizza)
    }
}

// 5. Создать экземпляр класса пиццерии и добавить в него несколько видов пицц.

print("\nДомашнее задание по четвёртому семинару по языку Swift\n")

var pizza0 = Pizza(pizzaKind: .Pepperoni, isTestoTonkoe: true)

var pizza1 = Pizza(pizzaKind: .Diablo, isTestoTonkoe: false)
pizza1.addAddition(addition: Pizza.Additions.Cheese)

var pizza2 = Pizza(pizzaKind: .ChetyreSyra, isTestoTonkoe: false)
pizza2.addAddition(addition: Pizza.Additions.Tomatoes)
pizza2.addAddition(addition: Pizza.Additions.Cheese)

var pizzas = [pizza0, pizza1, pizza2]

var pizzeria = Pizzeria(pizzas: pizzas)

print(pizzeria.description)

print("\nДобавляем ещё одну пиццу, теперь меню такое:\n")

var pizza5 = Pizza(pizzaKind: .Barbeku, isTestoTonkoe: true)
pizza5.addAddition(addition: Pizza.Additions.Sausage)
pizza5.addAddition(addition: Pizza.Additions.Tomatoes)
pizza5.addAddition(addition: Pizza.Additions.Pepper)

pizzeria.addPizza(pizza: pizza5)
print(pizzeria.description)
