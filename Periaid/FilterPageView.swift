//
//  FilterPageView.swift
//  Periaid
//
//  Created by Padma Priya on 7/23/21.
//

import SwiftUI

struct FilterPageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var widthStart: CGFloat = 0
    @State var widthEnd: CGFloat = 15
    var totalWidth = UIScreen.main.bounds.size.width - 162
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "chevron.left")
                    .frame(width: 24, height: 24)
                    .padding()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("Filter")
                    .padding()
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 76/255, green: 80/255, blue: 83/255))
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                Spacer()
                Text("Clear")
                    .padding()
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 76/255, green: 80/255, blue: 83/255))
            }
            VStack(alignment: .leading) {
                Text("Categories")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                Text("Distance")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.black.opacity(0.20))
                        .frame(height: 3)
                    Rectangle()
                        .fill(Color.accentColor)
                        .frame(width: self.widthEnd - self.widthStart + 15, height: 3)
                        .offset(x: self.widthStart + 15)
                    HStack {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 15, height: 15)
                            .offset(x: self.widthStart + 10)
                            .gesture (
                                DragGesture()
                                    .onChanged( { (value) in
                                        if value.location.x >= 0 && value.location.x <= self.widthEnd {
                                            self.widthStart = value.location.x
                                        }
                                    })
                            )
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 15, height: 15)
                            .offset(x: self.widthEnd)
                            .gesture (
                                DragGesture()
                                    .onChanged( { (value) in
                                        if value.location.x <= self.totalWidth && value.location.x >= self.widthStart {
                                            self.widthEnd = value.location.x
                                        }
                                    })
                            )
                    }
                }.padding(.horizontal, 60)
                Text("Days of Operations")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                Text("Hours of Operations")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                Text("Products")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                Text("More Filters")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                Text("Keywords")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
            }
            Spacer(minLength: 50)
            HStack(alignment: .center) {
                Spacer()
                Text("Save and apply")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 76/255, green: 80/255, blue: 83/255))
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .frame(width: 287, height: 58, alignment: .center)
                    .background(Color(red: 245/255, green: 217/255, blue: 217/255))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                Spacer()
            }
        }.accentColor(Color(red: 239/255, green: 102/255, blue: 103/255))
    }
}

struct FilterPageView_Previews: PreviewProvider {
    static var previews: some View {
        FilterPageView()
    }
}
