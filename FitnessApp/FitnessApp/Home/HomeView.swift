//
//  ContentView.swift
//  FitnessApp
//
//  Created by 정정욱 on 1/4/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var calories: Int = 300
    @State var active: Int = 45
    @State var steps: Int = 8000
    
    var mockActivities = [
        Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .green, amount: "8000"),
        Activity(id: 1, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .red, amount: "8000"),
        Activity(id: 2, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .blue, amount: "8000"),
        Activity(id: 3, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .purple, amount: "8000")
    ]
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Welcome").font(.largeTitle).padding()
                
                HStack {
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories").font(.callout).bold().foregroundColor(.red)
                            
                            Text("123 kcal").bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active").font(.callout).bold().foregroundColor(.green)
                            
                            Text("52 mins").bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand").font(.callout).bold().foregroundColor(.blue)
                            
                            Text("8 hours").bold()
                        }
                    }
                    Spacer()
                    
                    ZStack {
                        ProgressCircleView(progress: $calories, goal: 600, color: .red)
                        
                        ProgressCircleView(progress: $active, goal: 60, color: .green)
                            .padding(.all, 20)
                        
                        ProgressCircleView(progress: $steps, goal: 10000, color: .blue)
                            .padding(.all, 40)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                } //:HSTACK
                .padding()
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        print("show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count:2)) {
                    
                    ForEach(mockActivities, id: \.id) {activity in
                        ActivityCard(activity: activity)}
                }
                
            } //:VSTACK
            .padding(.horizontal)
        } //:SCROLL
    }
}

#Preview {
    HomeView()
}
