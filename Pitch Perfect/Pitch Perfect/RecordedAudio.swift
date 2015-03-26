//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Samar Kadhi on 3/26/15.
//  Copyright (c) 2015 Qadhi. All rights reserved.
//

import Foundation


class RecordedAudio: NSObject{
    

    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL,title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
        
        
   }
    

}
