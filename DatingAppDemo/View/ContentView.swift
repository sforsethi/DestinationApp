//
//  ContentView.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 12/10/20.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    
    //MARK: - Card Views
    
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2  {
            views.append(CardView(dest: destinationData[index]))
        }
        return views
    }()
    
    //MARK: - Top Card
    private func isTopCard(cardView: CardView) -> Bool    {
        
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else    {
            return false
        }
        return index == 0
    }
    
    //MARK: - Drag States
     
    enum DragState   {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
            return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool    {
            switch self {
            
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
        
        var isPressing: Bool    {
            switch self {
            
            case .dragging, .pressing:
                return true
            case .inactive:
                return false
            }
        }

    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 12)  {
            
            //MARK: - Header
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            Spacer()
            
            //MARK: - Cards
            ZStack  {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12 ) : 0))
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ?  self.dragState.translation.height : 0)
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, transaction) in
                                        switch value {
                                        case .first(true):
                                                state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                        )
                }
            }
            
            .padding(.horizontal)
            //CardView(dest: destinationData[3])
            //    .padding(.all)
            
            Spacer()
            
            //MARK: - Footer
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)

        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success!"), message: Text("Wishing you a lovely vacation!"), dismissButton: .default(Text("Happy Vacation")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}