//
//  File.swift
//
//
//  Created by nasrin niazi on 2023-02-09.
//

import Foundation
import UIKit

import UIKit
public protocol CoordinatorProtocol: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var DI:[String:Any]? {get set}
    func start()
    func finish()
    
    init(_ navigationController: UINavigationController)
}

public extension CoordinatorProtocol {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
///use to know which child coordinator has finished and for next flow what dependency is needed
public protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

/// define what type of flow we can use in-app.
public enum CoordinatorType {
    case app,tab,calculator,features,convertor
}
