//
//  ContentView.swift
//  FitnessApp
//
//  Created by 정정욱 on 1/4/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State private var circleProgress: Int = 100
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Welcome").font(.largeTitle).padding()
                    
                    HStack{
                        Spacer()
                        
                        VStack{
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                
                                Text("\(viewModel.calories) kcal")
                                    .bold()
                            }.padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                
                                Text("\(viewModel.active)mins")
                                    .bold()
                            }.padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("\(viewModel.stand) hours")
                                    .bold()
                            }
                            
                        }
                        Spacer()
                        ZStack{
                            ProgressCircleView(progress: viewModel.$calories, goal: 600, color: .red)
                            ProgressCircleView(progress: viewModel.$active, goal: 60, color: .green).padding(.all, 20)
                            ProgressCircleView(progress: viewModel.$stand, goal: 12, color: .blue).padding(.all, 40)
                            
                        }.padding(.horizontal)
                        
                        Spacer()
                    }.padding()
                    
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
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                        ForEach(viewModel.mockActivities, id: \.id) {activity in
                            ActivityCard(activity: activity)}
                    }
                    
                } //:VSTACK
                .padding(.horizontal)
                
                HStack {
                    Text("Recent Workouts")
                        .font(.title2)
                    
                    Spacer()
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                LazyVStack{
                    ForEach(viewModel.mockWorkouts, id: \.id) {workout in
                        WorkoutCard(workout: workout)
                    }
                }
            } //:SCROLL
            
        }
    }
}

#Preview {
    HomeView()
}
