//
//  SceneDelegate.swift
//  Firebase
//
//  Created by bro on 2022/05/28.
//

import UIKit
import AppTrackingTransparency
import FirebaseAnalytics

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    //iOS 15부터 프롬프트를 띄울때, 앱이 액티브인 상황에서 띄우라고 변경이 되었기 때문에
    // 앱이 액티브가 된 상황에서 띄우도록 작성을 해주어야 한다.
    // 그리고 가이드라인에서 앱 추적에 대해서 체크를 할 때에는 액티브가 되고 +1 초후에 띄우라고 되어있기때문에 그러한 부분도 추가를 해주었다.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //AppTrackingTransparency를 통해서 앱 사용간 추적 허용받기
            //ATT Framework -> iOS 14이상이라 그 이전까지 지원을 하는 경우에는 분기처리가 필요하다.
            //Analytics사용하기 전 사용자에게 허용받기
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                    
                case .notDetermined:
                    //프롬포트가 떠있는 상태
                    print("notDetermined")
                    Analytics.setAnalyticsCollectionEnabled(false)
                case .restricted:
                    // 거절한 상태
                    print("restricted")
                    Analytics.setAnalyticsCollectionEnabled(false)
                case .denied:
                    // 거부한 상태
                    print("denied")
                    Analytics.setAnalyticsCollectionEnabled(false)
                case .authorized:
                    //허용이 된 상태
                    //허용을 했을때만 애널리틱스를 수집할 수 잇다.
                    print("authorized")
                    Analytics.setAnalyticsCollectionEnabled(true)
                @unknown default:
                    print("unknown")
                    Analytics.setAnalyticsCollectionEnabled(false)
                }
            }
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

