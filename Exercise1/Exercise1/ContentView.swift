//
//  ContentView.swift
//  Exercise1
//
//  Created by Khue on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            GradientBgView(isNight: isNight)
                .ignoresSafeArea()
            VStack {
                Text("Hanoi, VietNam")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundStyle(Color.white)
                    .padding(.top, 60)
                    .padding(.bottom, 40)
                Image(systemName: "cloud.sun.fill")
                    .symbolRenderingMode(.palette)
                    .resizable()
                    .foregroundStyle(.white, .yellow)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("20°")
                    .font(.system(size: 60, weight: .regular))
                    .foregroundStyle(Color.white)
                Spacer()
                HStack {
                    let days: [(day: String, image: String, temp: Int)] = [
                        ("M", "sunset.fill", 28),
                        ("T", "sun.max.fill", 30),
                        ("W", "cloud.sun.fill", 21),
                        ("T", "cloud.sun.fill", 18),
                        ("F", "wind.snow", 10),
                        ("S", "snow", -5),
                    ]
                    ForEach(0..<days.count) { i in
                        let day = days[i]
                        WeatherDayView(dayOfWeek: day.day,
                                       imageName: day.image,
                                       temp: day.temp)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Mode")
                        .font(.headline)
                        .foregroundStyle(isNight ? Color.black : Color.blue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding()
                }

            }
            
        }
    }
}

struct GradientBgView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: isNight ? [.black, .gray] : [.blue, Color(hex: "BBFFFF")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(Color.white)
                .padding(.bottom, 20)
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow)
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .regular))
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
