//
//  ProfilePageView.swift
//  Periaid
//
//  Created by Padma Priya on 7/8/21.
//

import SwiftUI

struct ProfilePageView: View {
    
    @State private var showsProfileImageActionSheet = false
    @State private var showsImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var profileImage:UIImage?
    
//    let menu = Bundle.main.decode([MenuSection])
    var body: some View {
//        ScrollView {
        VStack(spacing: 10) {
            Spacer()
                ZStack(alignment: .topTrailing) {
                    Image("SettingsIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24, alignment: .topTrailing)
                        .padding()
                    ZStack(alignment: .bottomTrailing) {
                        Image(uiImage: profileImage ?? UIImage(named: "UserDefaultImage")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 130, height: 130, alignment: .center)
                            .padding()
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding()
                            .onTapGesture {
                                self.showsProfileImageActionSheet.toggle()
                            }
                    }.frame(width: UIScreen.main.bounds.width, height: .infinity, alignment: .center)
                }.frame(width: UIScreen.main.bounds.width, height: .infinity, alignment: .topTrailing)
                Text("Claire Wallestine")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    
                HStack {
                    Spacer()
                    Text("Total \n Donated")
                        .font(.body)
                        .font(.system(size: 15))
                        .padding()
                        .multilineTextAlignment(.center)
                        .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                    Spacer()
                    Text("Resources \n shared")
                        .font(.body)
                        .font(.system(size: 15))
                        .padding()
                        .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .multilineTextAlignment(.center)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                    Spacer()
                }.padding()
                List {
                    HStack {
                        Text("Notifications")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Text("Language")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Text("Settings")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Text("Invite Friends")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Text("Support")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Text("Help")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Text("About")
                            .font(.body)
                            .font(.system(size: 15))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding()
                }
                .cornerRadius(10)
                .padding()
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
            }
//        }
        
//        .onAppear {
//            UITableView.appearance().separatorStyle = .none
//        }
//        .onDisappear {
//            UITableView.appearance().separatorStyle = .singleLine
//        }
        .sheet(isPresented: $showsImagePicker) {
            ImagePicker(sourceType: self.sourceType, image: $profileImage, isPresented: $showsImagePicker)
        }
        .actionSheet(isPresented: $showsProfileImageActionSheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Take Photo"), action: {
                        self.showsImagePicker = true
                        self.sourceType = .camera
                    }), ActionSheet.Button.default(Text("choose Photo"), action: {
                        self.showsImagePicker = true
                        self.sourceType = .photoLibrary
                    }), ActionSheet.Button.cancel()])
                }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
