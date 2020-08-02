//
//  HomeView.swift
//  SwiftUIViewOnOrientationChange
//
//  Created by Zhengqian Kuang on 2020-08-01.
//  Copyright © 2020 Kuang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        Text("\(viewModel.interfaceOrientation)")
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
