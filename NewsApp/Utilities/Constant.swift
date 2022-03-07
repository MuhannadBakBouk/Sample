//
//  Constant.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//

import Foundation

enum API : String {
    case url = "https://newsapi.org/v2/"
    case key = "a980ef6bc0a847e6b2958b2a7da5e3ee"
    case accept = "application/json; charset=utf-8"
}

enum Cells : String {
    case coachItemCell  = "CoachItemCell"
    case tabCell = "TabCell"
    case overViewCell = "OverViewCell"
    case instructorCell = "InstructorCell"
    case statisticsCell = "StatisticsCell"
    case classCell = "ClassCell"
}

enum Icons : String {
    case publication  = "livephoto"
    case sysWifiProblem = "exclamationmark.icloud.fill"
    case infoAlert = "info.circle"
}

enum Images : String{
    case training = "training"
}
