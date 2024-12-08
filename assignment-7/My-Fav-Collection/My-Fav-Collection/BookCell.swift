//
//  BookCell.swift
//  My-Fav-Collection
//
//  Created by Aruzhan Kaharmanova on 26.10.2024.
//

import UIKit

class BookCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: Book) {
        title.text = model.title
        poster.image = model.poster
        author.text = model.author
        genre.text = model.genre
    }
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var genre: UILabel!

}
