//
//  MonthsTableViewCell.swift
//  AppIntroTableViewChallenge
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

protocol MonthsTableViewCellProtocol {
    func setupCell(name: String)
}


class MonthsTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var myMonthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MonthsTableViewCell: MonthsTableViewCellProtocol {
    
    internal func setupCell(name: String) {
        self.myMonthLabel.text = name
    }
}
