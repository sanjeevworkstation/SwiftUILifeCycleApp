//
//  SwiftUILifeCycleAppApp.swift
//  SwiftUILifeCycleApp
//
//  Created by Sanjeev Gautam on 20/11/20.
//

import SwiftUI

@main
struct SwiftUILifeCycleAppApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    
    init() {
        /// perform Any task on app launch
        print("Perform any task here in init")
    }
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .onOpenURL(perform: { url in
                print("Incoming url: \(url)")
            })
            
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
            @unknown default:
                print("App State : Unknown")
            }
        }
    }
}
