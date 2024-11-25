//
//  NavigationRoute.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import Foundation

class RouteManager: ObservableObject {
    @Published var routes =  [Route]();
    
    func push(to screen: Route) {
        routes.append(screen)
    }
    
    func reset() {
        routes = []
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
}
