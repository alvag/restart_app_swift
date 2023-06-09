//
//  HomeView.swift
//  Restart
//
//  Created by Max Alva on 9/06/23.
//

import SwiftUI

struct HomeView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            
            // HEADER
            
            Spacer()
            
            ZStack {
              CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
              Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                  .easeOut(duration: 4)
                  .repeatForever()
                  , value: isAnimating
                )
            }
            
            // CENTER
            
            Text("The time that leads to mastery in dependen on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // FOOTER
            
            Spacer()
        
            Button(action: {
              withAnimation {
                isOnboardingViewActive = true
              }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .onAppear(perform: {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
              })
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
