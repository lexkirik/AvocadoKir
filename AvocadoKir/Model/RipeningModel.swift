//
//  RipeningModel.swift
//  AvocadoKir
//
//  Created by Test on 4.10.23.
//

import SwiftUI

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
