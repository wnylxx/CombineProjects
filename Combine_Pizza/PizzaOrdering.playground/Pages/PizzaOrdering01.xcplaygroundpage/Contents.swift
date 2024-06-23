import UIKit
import Combine

let pizzaOrder = Order()

let pizzaOrderPublisher = NotificationCenter.default
    .publisher(for: .didUpdateOrderStatus,
               object: pizzaOrder)

pizzaOrderPublisher.sink { notification in
    print(notification)
    dump(notification)
}

pizzaOrderPublisher.map { notification in
    notification.userInfo?["status"] as? OrderStatus ?? OrderStatus.placing
}
.sink { orderStatus in
    print("Order status [\(orderStatus)]")
}

NotificationCenter.default.post(name: .didUpdateOrderStatus,
                                object: pizzaOrder,
                                userInfo: ["status": OrderStatus.processing])


print("Order: \(pizzaOrder.status)")

//현재 코드에서는 pizzaOrder.status 상태가 실제로 변경된 것이 아니라, 
//NotificationCenter를 통해 OrderStatus.processing 상태를 포함하는 알림이 게시된 것을 확인하는 상태
