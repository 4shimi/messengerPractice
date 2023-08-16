//
//  ChatView.swift
//  MessengerTutorial
//
//  Created by 정회승 on 2023/08/16.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
            //Header
            VStack (spacing: 4) {
                CircularProfileImageView(user: User.MOCK_USER, size: .xLarge)
                
                Text("Bruce Wayne")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Messenger")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            ScrollView{
                //Messages
                
                ForEach(0...10, id: \.self) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                    
                }
                
                Spacer()
            }
            //Message input view
            
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(20)
                    .font(.subheadline)
                Button {
                    print("send message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)

            }
            .padding()

        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
