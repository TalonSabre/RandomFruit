//
//  ContentView.swift
//  Fruits
//
//  Created by CPW on 11/4/22.
//

import SwiftUI

struct ContentView: View
{
    @State var fruitI = 0
    @State var fruitS = "Apple"
    @State var fruit = "🍎"
    @State var rarity = 1
    @State private var alert = false
    
    var body: some View
    {
        ZStack
        {
            if rarity == 1
            {
                Color(.systemGray)
            }
            else if rarity == 2
            {
                Color(.systemGray)
                Color(.systemCyan).opacity(0.35)
            }
            else if rarity == 3
            {
                Color(.systemGray)
                Color(.systemGreen).opacity(0.35)
            }
            else if rarity == 4
            {
                Color(.systemGray)
                Color(.systemYellow).opacity(0.35)
            }
            else if rarity == 5
            {
                Color(.systemGray)
                Color(.systemOrange).opacity(0.35)
            }
            else
            {
                Color(.systemGray)
                Color(.systemRed).opacity(0.35)
            }
            
            VStack
            {
                Text(fruit)
                    .font(.system(size: 128))
                    .shadow(radius: 8)
                    .shadow(radius: 4)
                    .shadow(radius: 2)
                
                Text("Fruit Type: \(fruitS)")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.heavy)
                
                Text(putStars(rarity: rarity))
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Button
                {
                    fruitI = Int.random(in: 0...8750)
                    fruitS = getFruit(odds: fruitI)
                    rarity = getRarity(fruit: fruitS)
                    fruit = putFruit(fruit: fruitS)
                    
                    if rarity == 6
                    {
                        alert = true
                    }
                }
            label:
                {
                    Text("Draw Fruit")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.cyan)
                        .cornerRadius(16)
                }
                .padding(.vertical, 16)
                .alert(isPresented: $alert)
                {
                    Alert(title: Text("Congratulations!\nYou are either lucky\nor addicted."))
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    func getRarity(fruit: String) -> Int
    {
        switch fruit
        {
        case "Apple":
            return 1
        case "Orange":
            return 1
        case "Strawberry":
            return 1
        case "Peach":
            return 1
        case "Blueberries":
            return 1
        case "Grapes":
            return 1
        case "Cherries":
            return 1
        case "Green Apple":
            return 2
        case "Lemon":
            return 2
        case "Watermelon":
            return 2
        case "Banana":
            return 2
        case "Pinapple":
            return 3
        case "Kiwi":
            return 3
        case "Tomato":
            return 3
        case "Olive":
            return 4
        case "Burger":
            return 6
    //v1.01 additions below
        case "Melon":
            return 2
        case "Pear":
            return 1
        case "Corn":
            return 4
        case "Lollipop":
            return 6
        case "Mango":
            return 3
    //v1.02
        case "Donut":
            return 6
        case "Mushroom":
            return 5
        case "Peanuts":
            return 5
        case "Beans":
            return 4
        case "Avacado":
            return 3
        case "Chili":
            return 4
        case "Onion":
            return 5
        default:
            return 1
        }
    }
    
    func getFruit(odds: Int) -> String
    {
        // COMMON
        //     4000/8750 :: 80/175 = 45.714%
        //     50/875 per :: 10/175 per = 5.7143%
        if odds < 500 { return "Apple" }
        else if odds < 1000 { return "Orange" }
        else if odds < 1500 { return "Strawberry" }
        else if odds < 2000 { return "Pear" }
        else if odds < 2500 { return "Peach" }
        else if odds < 3000 { return "Blueberries" }
        else if odds < 3500 { return "Grapes" }
        else if odds < 4000 { return "Cherries" }
        // UNCOMMON
        //     2000/8750 :: 40/175 = 22.857%
        //     40/875 :: 8/175 per = 4.57143%
        else if odds < 4400 { return "Green Apple" }
        else if odds < 4800 { return "Lemon" }
        else if odds < 5200 { return "Melon" }
        else if odds < 5600 { return "Watermelon" }
        else if odds < 6000 { return "Banana" }
        // RARE
        //     1500/8750 :: 30/175 = 17.143%
        //     30/875 :: 6/175 per = 3.42857%
        else if odds < 6300 { return "Avacado" }
        else if odds < 6600 { return "Pinapple" }
        else if odds < 6900 { return "Kiwi" }
        else if odds < 7200 { return "Mango" }
        else if odds < 7500 {  return "Tomato" }
        // VERY RARE
        //     800/8750 :: 16/175 = 9.143%
        //     20/875 :: 4/175 per = 2.2857%
        else if odds < 7700 { return "Beans" }
        else if odds < 7900 { return "Chili" }
        else if odds < 8100 { return "Olive" }
        else if odds < 8300 {  return "Corn" }
        // EPIC
        //     300/8750 :: 30/875 = 3.42857%
        //     10/875 :: 2/175 per = 1.143%
        else if odds < 8400 { return "Mushroom" }
        else if odds < 8500 { return "Peanuts" }
        else if odds < 8600 { return "Onion" }
        // LEGENDARY
        //     150/8750 :: 3/175 = 1.7143%
        //     5/875 :: 1/175 per = 0.5714%
        else if odds < 8650 { return "Lollipop" }
        else if odds < 8700 { return "Donut" }
        else { return "Burger" }
    }
    
    func putFruit(fruit: String) -> String
    {
        switch fruit
        {
        case "Apple":
            return "🍎"
        case "Orange":
            return "🍊"
        case "Strawberry":
            return "🍓"
        case "Green Apple":
            return "🍏"
        case "Grapes":
            return "🍇"
        case "Cherries":
            return "🍒"
        case "Blueberries":
            return "🫐"
        case "Peach":
            return "🍑"
        case "Lemon":
            return "🍋"
        case "Watermelon":
            return "🍉"
        case "Banana":
            return "🍌"
        case "Pinapple":
            return "🍍"
        case "Kiwi":
            return "🥝"
        case "Tomato":
            return "🍅"
        case "Olive":
            return "🫒"
        case "Burger":
            return "🍔"
    //v1.01 additions below
        case "Melon":
            return "🍈"
        case "Pear":
            return "🍐"
        case "Corn":
            return "🌽"
        case "Lollipop":
            return "🍭"
        case "Mango":
            return "🥭"
    //v1.02
        case "Donut":
            return "🍩"
        case "Mushroom":
            return "🍄"
        case "Peanuts":
            return "🥜"
        case "Beans":
            return "🫘"
        case "Avacado":
            return "🥑"
        case "Chili":
            return "🌶️"
        case "Onion":
            return "🧅"
        default:
            return "⚪️"
        }
    }
    
    func putStars(rarity: Int) -> String
    {
        switch rarity
        {
        case 6:
            return "⭐⭐⭐⭐⭐⭐\nLegendary"
        case 5:
            return "⭐⭐⭐⭐⭐\nEpic"
        case 4:
            return "⭐⭐⭐⭐\nVery Rare"
        case 3:
            return "⭐⭐⭐\nRare"
        case 2:
            return "⭐⭐\nUncommon"
        default:
            return "⭐\nCommon"
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
