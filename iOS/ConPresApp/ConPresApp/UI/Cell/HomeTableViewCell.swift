//
//  HomeTableViewCell.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 02/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    /// Disciplina
    @IBOutlet weak var courseLabel: UILabel!
    /// Docente
    @IBOutlet weak var lecturerLabel: UILabel!
    /// Local
    @IBOutlet weak var locationLabel: UILabel!
    /// Horário
    @IBOutlet weak var scheduleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
