//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Arno Princeston pan on 2023-07-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("babyBlue"))
            VStack{
                CityTextView(cityName: "Cupertino", stateName: "CA")
                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 184, height: 184)
                    Text("76°")
                        .font(.system(size: 68, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 24){

                    WeatherDayView(dayOfWeek: "TUES", imageName: "sun.max.fill", temperature: 77)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 70)
                    WeatherDayView(dayOfWeek: "THURS", imageName: "cloud.heavyrain.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 65)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 64)
                }
                Spacer()
                
                Button{
                    print("tap")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 314, height: 64)
                        .background(Color.white)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .cornerRadius(16.0)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    // things that aren't always the same
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    // changing Color(s)
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var stateName: String
    
    var body: some View{
        Text("\(cityName), \(stateName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
