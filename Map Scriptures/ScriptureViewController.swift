 //
//  ScriptureViewController.swift
//  Map Scriptures
//
//  Created by Shawn Crawley on 10/25/16.
//  Copyright © 2016 Shawn Crawley. All rights reserved.
//

import UIKit
import WebKit
 
 class ScriptureViewController : UIViewController, WKNavigationDelegate {
    
    //MARK: - Properties
    
    var book: Book!
    var chapter = 0
    
    private weak var mapViewController: MapViewController?
    private var webView: WKWebView!
    
    //MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Map" {
            let navVC = segue.destination as? UINavigationController
            if let mapVC = navVC?.topViewController as? MapViewController {
                //NEEDSWORK: Configure map view controller appropriately
            }
        }
    }
    
    //MARK: - View controller lifecycle
    
    override func loadView() {
        let webViewConfiguration = WKWebViewConfiguration()
        
        webViewConfiguration.preferences.javaScriptEnabled = false
        
        webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureDetailViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDetailViewController()
        
        let html = ScriptureRenderer.sharedRenderer.htmlForBookId(book.id, chapter: chapter)
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    //MARK: - Web kit navigation delegate
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let path = navigationAction.request.url?.absoluteString {
            if path.hasPrefix(ScriptureRenderer.Constant.baseUrl) {
                if let mapVC = mapViewController {
                    //NEEDSWORK: zoom in on tapped geoplace
                } else {
                    performSegue(withIdentifier: "Show Map", sender: self)
                }
                
                decisionHandler(.cancel)
            }
        }
    }
    
    //MARK: - Helpers
    
    func configureDetailViewController() {
        if let splitVC = splitViewController {
            if let navVC = splitVC.viewControllers.last as? UINavigationController {
                mapViewController = navVC.topViewController as? MapViewController
            } else {
                mapViewController = splitVC.viewControllers.last as? MapViewController
            }
        } else {
            mapViewController = nil
        }
    }
 }
