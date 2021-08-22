//
//  ZoomableScrollView.swift
//  My Images
//
//  Created by Stewart Lynch on 2021-08-04.
//
// See https://newbedev.com/isn-t-there-an-easy-way-to-pinch-to-zoom-in-an-image-in-swiftui
// I have added 'uiView.setZoomScale(1.0, animated: true)' as well so that when switching
// Between images, you will always zoom back to the default 1.0 scale.
import SwiftUI

struct ZoomableScrollView<Content: View>: UIViewRepresentable {
  private var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  func makeUIView(context: Context) -> UIScrollView {
    // set up the UIScrollView
    let scrollView = UIScrollView()
    scrollView.delegate = context.coordinator  // for viewForZooming(in:)
    scrollView.maximumZoomScale = 20
    scrollView.minimumZoomScale = 1
    scrollView.bouncesZoom = true
    // create a UIHostingController to hold our SwiftUI content
    let hostedView = context.coordinator.hostingController.view!
    hostedView.translatesAutoresizingMaskIntoConstraints = true
    hostedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    hostedView.frame = scrollView.bounds
    scrollView.addSubview(hostedView)
    return scrollView
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(hostingController: UIHostingController(rootView: self.content))
  }

  func updateUIView(_ uiView: UIScrollView, context: Context) {
    // update the hosting controller's SwiftUI content
    uiView.setZoomScale(1.0, animated: true)
    context.coordinator.hostingController.rootView = self.content
    assert(context.coordinator.hostingController.view.superview == uiView)
  }

  // MARK: - Coordinator
  class Coordinator: NSObject, UIScrollViewDelegate {
    var hostingController: UIHostingController<Content>
    init(hostingController: UIHostingController<Content>) {
      self.hostingController = hostingController
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      return hostingController.view
    }
    
       
  }
}

