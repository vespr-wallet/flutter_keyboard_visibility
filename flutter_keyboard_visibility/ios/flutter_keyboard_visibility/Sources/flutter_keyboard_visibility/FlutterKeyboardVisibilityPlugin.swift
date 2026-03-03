import Flutter
import UIKit

@objc(FlutterKeyboardVisibilityPlugin)
public class FlutterKeyboardVisibilityPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {

    private var flutterEventSink: FlutterEventSink?
    private var flutterEventListening = false
    private var isVisible = false

    public static func register(with registrar: FlutterPluginRegistrar) {
        let stream = FlutterEventChannel(
            name: "flutter_keyboard_visibility",
            binaryMessenger: registrar.messenger()
        )
        let instance = FlutterKeyboardVisibilityPlugin()
        stream.setStreamHandler(instance)
    }

    override init() {
        super.init()

        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(didShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        center.addObserver(self, selector: #selector(willShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(didHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func didShow() {
        if !isVisible {
            isVisible = true
            if flutterEventListening {
                flutterEventSink?(1)
            }
        }
    }

    @objc private func willShow() {
        if !isVisible {
            isVisible = true
            if flutterEventListening {
                flutterEventSink?(1)
            }
        }
    }

    @objc private func didHide() {
        if isVisible {
            isVisible = false
            if flutterEventListening {
                flutterEventSink?(0)
            }
        }
    }

    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        flutterEventSink = events
        flutterEventListening = true

        if isVisible {
            flutterEventSink?(1)
        }

        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        flutterEventListening = false
        return nil
    }
}
