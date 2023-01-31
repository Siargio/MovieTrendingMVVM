//
//  NetworkConstant.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import Foundation

class NetworkConstant {
    public static let shared: NetworkConstant = NetworkConstant()

    private init() {
        //Singletone
    }

    public var apiKey: String {
        get {
            //API key from  https://www.themoviedb.org/
            return "7cea743de32057042b2cdaee9931b893"
        }
    }

    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }

    public var imageServerAdress: String {
        get {
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}
