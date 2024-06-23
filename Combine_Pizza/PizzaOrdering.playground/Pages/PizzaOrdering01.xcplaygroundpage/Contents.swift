import UIKit
import Combine

let pizzaOrder = Order()

let pizzaOrderPublisher = NotificationCenter.default
    .publisher(for: .didUpdateOrderStatus,
               object: pizzaOrder)

pizzaOrderPublisher.sink { notification in
    Task {
        try? await Task.sleep(for: .seconds(2))
        print("-----------notification start-------------------")
        dump(pizzaOrder)
        print("-----------notification end-------------------")
    }
}

pizzaOrderPublisher.map { notification in
    notification.userInfo?["status"] as? OrderStatus ?? OrderStatus.placing
}
.sink { orderStatus in
    print("Order status [\(orderStatus)]")
}

pizzaOrderPublisher.compactMap { notification in
    notification.userInfo?["status"] as? OrderStatus
}
.assign(to: \.status, on: pizzaOrder)

print("Order: \(pizzaOrder.status)")


NotificationCenter.default.post(name: .didUpdateOrderStatus,
                                object: pizzaOrder,
                                userInfo: ["status": OrderStatus.processing])


print("Order_2: \(pizzaOrder.status)")

// asign을 통해 post받은 status를 적용시켜줌
