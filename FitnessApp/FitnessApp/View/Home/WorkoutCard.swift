//
//  WorkoutCard.swift
//  FitnessApp
//
//  Created by 정정욱 on 1/5/25.
//

import SwiftUI

struct WorkoutCard: View {
    @State var workout: Workout
    
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
            
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text(workout.duration)
                }
                
                HStack {
                    Text(workout.date)
                    
                    Spacer()
                    
                    Text(workout.calories)
                }
            }
        }
        .padding()
    }
}
    
struct WorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run", tintColor: .cyan, duration: "43 Mins", date: "Aug 1st", calories: "431kcal"))
    }
}
