//
//  DetailsPage.swift
//  Faves&Details
//
//  Created by Aruzhan Kaharmanova on 06.11.2024.
//

import UIKit

class DetailsPage: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var inputModel: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.poster
    }

    func configure(with model: Book?) {
        self.inputModel = model
    }
}
