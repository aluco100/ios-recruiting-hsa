//
//  Movie.swift
//  Movies
//
//  Created by Alfredo Luco on 05-02-21.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject, Decodable {
    
    //Coding Keys to map. Aqui van los labels que aparecen en la respuesta del servicio de la api, los cuales van a ser mapeados
    
    enum CodingKeys: CodingKey {
        case id,
             adult,
             backdrop_path,
             genre_ids,
             original_language,
             original_title,
             overview,
             popularity,
             poster_path,
             release_date,
             title,
             video,
             vote_average,
             vote_count
    }
    
    //Constructor
    
    required convenience init(from decoder: Decoder) throws {
        
        //Se inicializa el context de core data
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        let context = appDelegate.persistentContainer.viewContext
        
        //Se inicializa el objeto en base al context
        
        self.init(context: context)
        
        //Mapping de propiedades
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int32.self, forKey: .id)
        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.backdrop_path = try container.decode(String.self, forKey: .backdrop_path)
        self.genre_ids = try container.decode([Int].self, forKey: .genre_ids)
        self.original_language = try container.decode(String.self, forKey: .original_language)
        self.original_title = try container.decode(String.self, forKey: .original_title)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.poster_path = try container.decode(String.self, forKey: .poster_path)
        self.release_date = try container.decode(String.self, forKey: .release_date)
        self.title = try container.decode(String.self, forKey: .title)
        self.video = try container.decode(Bool.self, forKey: .video)
        self.vote_average = try container.decode(Double.self, forKey: .vote_average)
        self.vote_count = try container.decode(Int32.self, forKey: .vote_count)
    }
    
}
