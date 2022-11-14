//
//  WeatherDetailsCellView.swift
//  Weather
//
//  Created by Bohdan Hawrylyshyn on 13.11.2022.
//

import SwiftUI

enum WeatherDetailsType {
    case wind, humidity, feelsLike, sunrise, sunset
    
    var title: Text {
        switch self {
        case .wind:
            return Text("Wind".uppercased())
        case .humidity:
            return Text("Humidity".uppercased())
        case .feelsLike:
            return Text("Feels like".uppercased())
        case .sunrise:
            return Text("Sunrise".uppercased())
        case .sunset:
            return Text("Sunset".uppercased())
        }
    }
    
    var icon: Image {
        switch self {
        case .wind:
            return Image(systemName: "wind")
        case .humidity:
            return Image(systemName: "humidity")
        case .feelsLike:
            return Image(systemName: "thermometer.medium")
        case .sunrise:
            return Image(systemName: "sunrise.fill")
        case .sunset:
            return Image(systemName: "sunset.fill")
        }
    }
}

struct WeatherDetailsCellView: View {
    
    @State var detailsType: WeatherDetailsType
    @Binding var addInfo: String?
    @Binding var weatherData: String?
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    detailsType.icon
                    detailsType.title
                        .font(.customFont(weight: .regular, size: 14))
                    Spacer()
                }
                .opacity(0.55)
                Text(weatherData ?? "")
                    .foregroundColor(.white)
                    .font(.customFont(weight: .medium, size: 24))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                Group {
                    if addInfo != nil {
                        Divider()
                        switch detailsType {
                        case .wind, .humidity:
                            Text(addInfo ?? "")
                        case .feelsLike:
                            Text("Wind is making it feel colder")
                        case .sunrise:
                            Text("Sunset: \(addInfo ?? "")")
                        case .sunset:
                            Text("Sunrise: \(addInfo ?? "")")
                        }
                    }
                }
                .font(.customFont(weight: .regular, size: 14))
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(
            width: UIScreen.screenWidth * 0.45,
            height: UIScreen.screenWidth * 0.45)
    }
}


struct WeatherDetailsCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.gray
            WeatherDetailsCellView(
                detailsType: .feelsLike,
                addInfo: .constant("asdsaassdsadd"),
                weatherData: .constant("adas"))
        }
    }
}
