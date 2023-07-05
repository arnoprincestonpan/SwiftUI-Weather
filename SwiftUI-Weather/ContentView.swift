//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Arno Princeston pan on 2023-07-05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino", stateName: "CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                WeekWeatherStatusView(isNight: $isNight)
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButtonLabel(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
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
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray : Color("babyBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
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

struct MainWeatherStatusView: View {
    // variables that change
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 184, height: 184)
            Text("\(temperature)°")
                .font(.system(size: 68, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeekWeatherStatusView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        HStack(spacing: 24){
            
            WeatherDayView(dayOfWeek: "TUES", imageName: isNight ? "moon.fill" : "sun.max.fill", temperature: 77)
            WeatherDayView(dayOfWeek: "WED", imageName: isNight ? "moon.haze.fill" : "sun.dust.fill", temperature: 70)
            WeatherDayView(dayOfWeek: "THURS", imageName: isNight ? "cloud.fog.fill" : "cloud.fill", temperature: 68)
            WeatherDayView(dayOfWeek: "FRI", imageName: isNight ? "moon.stars.circle.fill" : "sun.and.horizon.fill", temperature: 65)
            WeatherDayView(dayOfWeek: "SAT", imageName: isNight ? "moon.fill" : "sun.max.fill", temperature: 64)
        }
    }
}
