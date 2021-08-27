//
//  ContentView.swift
//  MinimalWeather
//
//  Created by Đorđije Novović on 2.1.21..
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var  viewModel: WeatherViewModel
    @State var animate: Bool = false
    
    var body: some View {
        
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text(viewModel.cityName)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        
                    Spacer()
                    Text(viewModel.temperature)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Image(systemName: viewModel.weatherIcon)
                        .font(.largeTitle)
                        .padding(32)
                        .scaleEffect(animate ? 2.5 : 1.5)
                   
                    
                    Text(viewModel.weatherDescription)
                        .font(.headline)
                        .bold()
                        .padding()
                    Spacer()
                    Button(action: {
                        viewModel.refresh()
                    }, label: {
                        Image(systemName: "location.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .padding()
                    })
                    Spacer()
                    
                }
                .shadow(color: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), radius: 5, x: 5.0, y: 5.0)
                .onAppear(perform: viewModel.refresh)
                .onAppear(perform: addAnimation)
                Spacer()
            }
        }
        .background(Color.accentColor)
        .ignoresSafeArea()
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
