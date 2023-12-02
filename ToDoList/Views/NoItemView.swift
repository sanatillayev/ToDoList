//
//  NoItemView.swift
//  ToDoList
//
//  Created by Bilol Sanatillaev on 22/08/23.
//

import SwiftUI

struct NoItemView: View {
    
    let secondAccent: Color = Color("SecondAccentColor")
    let firstAccent: Color = Color("AccentColor")

    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Add something to your To Do list to improve your productivity!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add item 🚀")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondAccent : firstAccent)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset( y: animate ? -7 : 0)
                .shadow(
                    color: animate ? secondAccent.opacity(0.4) : firstAccent.opacity(0.5),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
            }
            .multilineTextAlignment(.center)
            .padding(30)
            .onAppear(perform: addAnimation)
            .frame(maxWidth: 400)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
