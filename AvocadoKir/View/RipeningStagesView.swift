//
//  RipeningStagesView.swift
//  AvocadoKir
//
//  Created by Test on 2.10.23.
//

import SwiftUI

struct RipeningStagesView: View {
    var ripening: [Ripening] = ripeningsData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripening) { item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    RipeningStagesView()
}
