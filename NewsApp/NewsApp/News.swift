//
//  News.swift
//  NewsApp
//
//  Created by Furkan on 16.09.2022.
//

import Foundation

class News : Codable{
    var key : String
    var url : String
    var description : String
    var image : String
    var name  : String
    var source : String
    
    init(Key:String,Url:String,Description:String,Image:String,Name:String,Source:String){
        self.key = Key
        self.url = Url
        self.description = Description
        self.image = Image
        self.name = Name
        self.source = Source
    }
}
