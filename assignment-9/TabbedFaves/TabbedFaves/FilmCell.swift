//
//  FilmCell.swift
//  TabbedFaves
//
//  Created by Aruzhan Kaharmanova on 14.11.2024.
//

import UIKit

class FilmCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var genre: UILabel!
}
