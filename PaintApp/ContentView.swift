//
//  ContentView.swift
//  PaintApp
//
//  Created by Vikas Mule on 24/07/25.
//

import SwiftUI

// Line while drawing color, point, linewidth
struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct ContentView: View {
    @State private var currentLine: Line = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 1.0
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            Button("Erase") {
                lines.removeAll()
            }
            .padding()
            .disabled(lines.isEmpty ? true : false)
            
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
                
            }
            .frame(minWidth: 400, minHeight: 400)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                self.currentLine.points.append(value.location)
                self.lines.append(currentLine)
            }).onEnded({ value in
                self.currentLine = Line(points: [])
            })
            )
            
            HStack {
                Spacer()
                ColorPickerView(selelctedColor: $selectedColor)
                    .onChange(of: selectedColor, { oldValue, newColor in
                        currentLine.color = newColor
                    })
                
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }.frame(maxWidth: 200)
                 .onChange(of: thickness) { oldValue, newValue in
                    currentLine.lineWidth = newValue
                }
                Divider()
                
            
                Spacer()
            }
            
        }.padding()
        
    }
}

#Preview {
    ContentView()
}
