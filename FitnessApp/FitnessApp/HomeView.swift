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
            } //:VSTACK
        } //:SCROLL
    }
}

#Preview {
    HomeView()
}
