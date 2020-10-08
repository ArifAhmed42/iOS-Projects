//
//  ImageCardView.swift
//  Spinner
//
//  Created by SM Arif Ahmed on 7/10/20.
//  Copyright © 2020 SM Arif Ahmed. All rights reserved.
//

import SwiftUI

struct ImageCardView: View {
    
    
    @Binding  var imageName: String
    @Binding var imageBackground: Color
    
    var body: some View {
        Image(imageName)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .padding(.all,12)
        .background(imageBackground.opacity(0.5))
        .cornerRadius(20)
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(imageName: Binding.constant("lime"), imageBackground: Binding.constant(Color.white))
    }
}
