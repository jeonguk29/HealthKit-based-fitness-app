//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by 정정욱 on 1/4/25.
//

import SwiftUI

struct FitnessTabView: View {
    @State var selectedTab = "Home"
    
    init(){
        // 탭바 스타일 설정
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.selected.iconColor = . green
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.green]
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            HistoricDataView()
                .tag("Historic")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Historic")
                }
        }
    }
}

#Preview {
    FitnessTabView()
}
