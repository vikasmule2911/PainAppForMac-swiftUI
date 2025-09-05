//
//  ColorPickerView.swift
//  PaintApp
//
//  Created by Vikas Mule on 24/07/25.
//

import SwiftUI

struct ColorPickerView: View {
    
    let colors = [Color.red, Color.blue, Color.green, Color.purple]
    @Binding var selelctedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle().fill(color).onTapGesture {
                    selelctedColor = color
                }
                .frame(maxWidth: 20, maxHeight: 20)
                
                Text("Vikas Mule")
            }
        }
        .padding()
    }
}

#Preview {
    ColorPickerView(selelctedColor: .constant(.red))
}
