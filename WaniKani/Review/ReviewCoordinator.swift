//
//  ReviewCoordinator.swift
//  WaniKani
//
//  Created by Andriy K. on 4/1/16.
//  Copyright © 2016 Andriy K. All rights reserved.
//

import UIKit

protocol ReviewCoordinatorDelegate: class {
  func reviewCompleted(_ coordinator: ReviewCoordinator)
}

class ReviewCoordinator: NSObject, Coordinator, BottomBarContainerDelegate {

  let presenter: UINavigationController
  let containerViewController: BottomBarContainerViewController
  let sideMenuController: SideMenuHolderViewController
  fileprivate let settingsSuit: SettingsSuit
  let type: WebSessionType

  let childrenCoordinators: [Coordinator]

  fileprivate var sideMenuVisible = false

  weak var delegate: ReviewCoordinatorDelegate?

  public init(presenter: UINavigationController, type: WebSessionType, settingsSuit: SettingsSuit) {
    self.presenter = presenter
    self.settingsSuit = settingsSuit
    self.type = type
    containerViewController = BottomBarContainerViewController.instantiateViewController()
    sideMenuController = SideMenuHolderViewController(type: type, settingsSuit: settingsSuit)
    childrenCoordinators = []
  }

  func start() {
    CookiesStorage.loadCookies()
    containerViewController.delegate = self
    containerViewController.dataSource = type
    sideMenuController.delegate = self
    presenter.modalPresentationCapturesStatusBarAppearance = true
    presenter.present(containerViewController, animated: true, completion: nil)
    containerViewController.childViewController = sideMenuController
    sideMenuController.didMove(toParentViewController: containerViewController)
    updateStatusBar(hide: settingsSuit.hideStatusBarEnabled)
  }

  fileprivate func updateStatusBar(hide: Bool) {
    UIApplication.shared.isStatusBarHidden = hide
  }
}

// MARK: - BottomBarContainerDelegate
extension ReviewCoordinator {

  func toolBarItemPressed(index: Int) {
    let action = type.barActionForIndex(index: index)
    switch action {
      case .finish, .submitToGameCenter: leftButtonPressed()
      case .strokes: rightButtonPressed()
    }
  }

  func focusShortcutUsed() {
  }

  private func leftButtonPressed() {
    presenter.dismiss(animated: true) {
      self.delegate?.reviewCompleted(self)
    }
    updateStatusBar(hide: false)
  }

  private func rightButtonPressed() {
    if sideMenuVisible == true {
      sideMenuController.hideViewController()
      sideMenuVisible = false
      showBar()
    } else {
      sideMenuController.presentRightMenuViewController()
      sideMenuVisible = true
      hideBar()
    }

  }
}

extension ReviewCoordinator {

  func hideBar() {
    updateStatusBar(hide: false)
    containerViewController.hideBar()
  }

  func showBar() {
    updateStatusBar(hide: settingsSuit.hideStatusBarEnabled)
    containerViewController.showBar()
  }

}
