//
//  ViewController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 31/3/2021.
//

import UIKit
import RxSwift

/// Note that only part of view controller override this class.
/// Must ensure all view controller is updated after editing this class.
open class ViewController<ViewModel: ViewModelProtocol>: UIViewController, ViewControllerProtocol {
    public let viewModel: ViewModel
    public let disposeBag = DisposeBag()

    required public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        initializeSubscription()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func loadView() {
        super.loadView()
        initializeView()
    }

    open func initializeView() {}

    open override func viewDidLoad() {
        super.viewDidLoad()
        additionalInitializeView()
    }

    open func initializeSubscription() {
        initializeInvalidatePageSubscription()
        initializeAlertSubscription()
    }

    open func additionalInitializeView() {
        viewModel.interactor.fetchPage()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // invalidate page

    public func initializeInvalidatePageSubscription() {
        viewModel.fetchPagePublishSubject.subscribe { _ in
            self.invalidatePage()
        }.disposed(by: DisposeBag())
    }

    open func invalidatePage() {

    }

    // alert

    public func initializeAlertSubscription() {
        viewModel.alertPublishSubject.subscribe { error in
            self.alert(for: error)
        }.disposed(by: disposeBag)
    }

    public func alert(for error: FormError) {
        var viewController = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        viewController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(viewController, animated: true)
    }
}

//open class ViewController<U: ViewUI, M: ViewModelProtocol>: UIViewController, UIGestureRecognizerDelegate {
//    private(set) var viewUI: U
//    private(set) var viewModel: M
//
//    init(viewUI: U, viewModel: M) {
//        self.viewUI = viewUI
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required public init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    open override func loadView() {
//        super.loadView()
//        viewUI.loadView(view)
//    }
//
//    open override func viewDidLoad() {
//        super.viewDidLoad()
//        setupNavigationBar()
//        addHideKeyboardGestureRecognizer()
//        setupSubscription()
//        additionalInitialize()
//    }
//
//    open override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        addShowKeyboardObserver()
//        readditionalSetupIfNeeded()
//    }
//
//    open override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
//        setNeedsStatusBarAppearanceUpdate()  // refresh status bar text color for any pages
//    }
//
//    open override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        removeShowKeyboardObserver()
//    }
//
//    open override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }
//
//    // MARK: Status Bar
//
//    open override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .darkContent
//    }
//
//    // MARK: Back
//
//    open override func willMove(toParent parent: UIViewController?) {
//        super.willMove(toParent: parent)
//
//        if parent == nil {
//            willMoveBack()
//        }
//    }
//
//    /// Called when navigation controller back button is pressed
//    open func willMoveBack() {}
//
//    // MARK: Navigation Bar
//
//    private(set) var navigationItemManager: NavigationItemManager!
//
//    open var navigationBarTitle: String? {
//        return nil
//    }
//
//    /// Set navigation bar title by navigationBarTitle
//    open func updateNavigationBarTitle() {
//        title = navigationBarTitle
//    }
//
//    open var navigationItemLargeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode {
//        return .never
//    }
//
//    open func updateNavigationBarItems() {
//        navigationItemManager.setButtonItems(itemTypes: leftNavigationItemTypes, direction: .left)
//        navigationItemManager.setButtonItems(itemTypes: rightNavigationItemTypes, direction: .right)
//    }
//
//    open var leftNavigationItemTypes: [NavigationItemManager.ItemType] {
//        return []
//    }
//
//    open var rightNavigationItemTypes: [NavigationItemManager.ItemType] {
//        return []
//    }
//
//    private func setupNavigationBar() {
//        title = navigationBarTitle
//
//        navigationItem.largeTitleDisplayMode = navigationItemLargeTitleDisplayMode
//
//        navigationItemManager = NavigationItemManager(navigationItem: navigationItem)
//        navigationItemManager.setButtonItems(itemTypes: leftNavigationItemTypes, direction: .left)
//        navigationItemManager.setButtonItems(itemTypes: rightNavigationItemTypes, direction: .right)
//    }
//
//    // MARK: Keyboard
//
//    private var isKeyboardShowed = false {
//        didSet {
//            navigationController?.navigationBar.isUserInteractionEnabled = !isKeyboardShowed  // avoid editing back page
//        }
//    }
//
//    private func addHideKeyboardGestureRecognizer() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        tapGesture.cancelsTouchesInView = false  // avoid breaking tableView(_:didSelectRowAt:)
//        view.addGestureRecognizer(tapGesture)
//
//        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        swipeUpGesture.cancelsTouchesInView = false  // avoid breaking tableView(_:didSelectRowAt:)
//        swipeUpGesture.direction = .up
//        view.addGestureRecognizer(swipeUpGesture)
//
//        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        swipeDownGesture.cancelsTouchesInView = false  // avoid breaking tableView(_:didSelectRowAt:)
//        swipeDownGesture.direction = .down
//        view.addGestureRecognizer(swipeDownGesture)
//    }
//
//    @objc func hideKeyboard() {
//        view.endEditing(true)
//    }
//
//    private func addShowKeyboardObserver() {
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
//    }
//
//    private func removeShowKeyboardObserver() {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc private func keyboardWillShow(notification: NSNotification) {
//        guard let keyboardFrame = notification.keyboardFrame else {
//            return
//        }
//
//        guard let activeField = UIResponder.activeField() else {
//            return
//        }
//
//        guard let window = view.window else {
//            return
//        }
//
//        if let navigationController = navigationController, !navigationController.navigationBar.isTranslucent {
//            navigationController.navigationBar.isTranslucent = true  // enable backgroundd color transparent
//        }
//
//        isKeyboardShowed = true
//
//        // reset to original screen position y
//        let defaultFrameY = defaultFrameY
//        self.view.frame.origin.y = defaultFrameY
//
//        // adjust screen position y if keyboard will overlap field
//        let activeFieldWindowRect = activeField.relativeRect(to: window)
//        let bottomSpacing = window.frame.height - activeFieldWindowRect.bottom
//
//        if keyboardFrame.height > bottomSpacing {
//            self.view.frame.origin.y = defaultFrameY - (keyboardFrame.height - bottomSpacing)
//        }
//    }
//
//    @objc private func keyboardWillHide(notification: NSNotification) {
//        isKeyboardShowed = false
//
//        if self.view.frame.origin.y != defaultFrameY {
//            self.view.frame.origin.y = defaultFrameY
//        }
//    }
//
//    private var defaultFrameY: CGFloat {
//        return 0
//    }
//
//    // MARK: Subscription
//
//    private(set) var disposedBag = DisposeBag()
//
//    open func setupSubscription() {}
//
//    // MARK: Additional Setup
//
//    open func additionalSetup() {}
//
//    open var refreshForViewAppear: Bool {
//        return false
//    }
//
//    private var isFirstSetup = true
//
//    private func readditionalSetupIfNeeded() {
//        if isFirstSetup {  // only re-additional setup for 2nd enter this page
//            isFirstSetup = false
//            return
//        }
//
//        if refreshForViewAppear {
//            additionalSetup()
//        }
//    }
//
//    // MARK: Alert
//
//    func alert(title: String?, message: String?, handler: (() -> Void)? = nil) {
//        self.present(
//            AlertBuilder()
//                .title(title)
//                .message(message)
//                .addPreferredAction(
//                    title: "Ok",
//                    style: .default,
//                    handler: handler
//                )
//                .build()
//            ,
//            animated: true
//        )
//    }
//
//    func alert(_ error: Error, handler: (() -> Void)? = nil) {
//        self.alert(title: nil, message: error.localizedDescription, handler: handler)
//    }
//
//}
//
//// MARK: - Keyboard Position
//
//extension NSNotification {
//
//    var keyboardFrame: CGRect? {
//        guard let userInfo = userInfo else {
//            return nil
//        }
//
//        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
//            return nil
//        }
//
//        return keyboardSize.cgRectValue
//    }
//
//}
//
//extension UIResponder {
//
//    private struct Static {
//
//        static weak var responder: UIResponder?
//
//    }
//
//    static func first() -> UIResponder? {
//        Static.responder = nil
//        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
//        return Static.responder
//    }
//
//    static func activeField() -> UIView? {
//        return first() as? UIView
//    }
//
//    @objc private func _trap() {
//        Static.responder = self
//    }
//
//}
//
//extension UIView {
//
//    /// Return relative rect of self to view. If view is nil, return relative rect self to view
//    func relativeRect(to view: UIView?) -> CGRect {
//        return convert(bounds, to: view)
//    }
//
//}
//
//extension CGRect {
//
//    var left: CGFloat {
//        return origin.x
//    }
//
//    var top: CGFloat {
//        return origin.y
//    }
//
//    var right: CGFloat {
//        return origin.x + size.width
//    }
//
//    var bottom: CGFloat {
//        return origin.y + size.height
//    }
//
//}
