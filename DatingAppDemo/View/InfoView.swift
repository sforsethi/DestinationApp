//
//  InfoView.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 14/10/20.
//

import SwiftUI

struct InfoView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Spacer(minLength: 10)
                            
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
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

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Destination")
            RowAppInfoView(itemOne: "Compatibitlity", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "@sforsethi")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0")


        }
    }
}

struct RowAppInfoView: View {
    //MARK: - Properties
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack  {
                Text(itemOne).foregroundColor(Color.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack  {
                Text("Photos").foregroundColor(Color.gray)
                Spacer()
                Text("Pexels / Uns plash")
            }
            
            Divider()
            
            Text("Photographers").foregroundColor(Color.gray)  
        }
    }
}
