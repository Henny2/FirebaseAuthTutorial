//
//  ProfileView.swift
//  FirebaseAuthTutorial
//
//  Created by Henrieke Baunack on 10/26/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            // no title for this section
            Section{
                HStack {
                    Text("MJ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(.circle)
                    VStack(alignment: .leading, spacing: 4){
                        Text("Michael Jordan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text("test@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray) // because it recognizes it as an email
                    }
                }

            }
            Section("General"){
                
                
            }
            
            Section("Account"){
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
