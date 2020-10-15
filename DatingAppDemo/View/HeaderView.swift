//
//  HeaderView.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 12/10/20.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Properties
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0)  {
            
            Button(action: {
                //action
                print("Information")
                self.showInfoView.toggle()
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Image("logo-pink")
                .resizable()
                .scaledToFit()
                .frame(width: 210, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.pink)
                .accentColor(Color.pink)
            
            Spacer()
            
            Button(action: {
                //action
                print("Guide")
                self.showGuideView.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
