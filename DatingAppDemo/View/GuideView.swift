//
//  GuideView.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 12/10/20.
//

import SwiftUI

struct GuideView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(alignment: .center, spacing: 30) {
                HeaderComponent()

                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                    
                
                Text("Discover and pick the perfect destination for your romantic holiday!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25)    {
                    GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like this destination? Swipe right and it will be saved to  your favourites list.", icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "Would you rather skip this destination? Swipe left and you'll no longer see it.", icon: "xmark.circle")
                    
                    GuideComponent(title: "Book", subtitle: "Tap the button", description: "Our selection of destination is perfect for you to embark your new life together.", icon: "checkmark.circle")
                    
                }
                
                
                Spacer(minLength: 10)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                })  {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                        
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
