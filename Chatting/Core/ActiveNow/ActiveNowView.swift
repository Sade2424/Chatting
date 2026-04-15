//
//  ActiveNowView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:32){
                ForEach(0...10, id: \.self) { user in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName:"person.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundStyle(Color(.systemGray4))
                            
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width:18, height: 18)
                                
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width:12, height: 12)
                            }
                        }
                        
                        Text ("Onyx")
                            .font(.subheadline)
                            .foregroundStyle(Color(.gray))
                    }
                }
            }
            .padding()
        }
        .frame(height:106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}

