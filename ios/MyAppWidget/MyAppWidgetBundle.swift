//
//  MyAppWidgetBundle.swift
//  MyAppWidget
//
//  Created by Lathiya Jayesh on 11/08/24.
//

import WidgetKit
import SwiftUI

@main
struct MyAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyAppWidget()
        MyAppWidgetLiveActivity()
    }
}
