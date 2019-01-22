//
//  MovieTableViewCell.swift
//  CustomTableView
//
//  Created by Michelle M on 18/11/2018.
//  Copyright © 2018 batgirl. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    var moviesFormatted: MoviesFormatted!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(moviesFormatted: MoviesFormatted) {
        self.moviesFormatted = moviesFormatted
        
        self.movieTitle.text = self.moviesFormatted.title
        self.year.text = self.moviesFormatted.year
        
        let url = URL(string: self.moviesFormatted.poster)
        let data = try? Data(contentsOf: url!)
        let img = UIImage(data: data!)
        
        // Resize image proportionately
        let newImg = self.resizeImage(img!, newHeight: 161.0)
        self.posterImg.image = newImg
    }
    
    func resizeImage(_ image: UIImage, newHeight: CGFloat) -> UIImage {
        print("debug before: width: \(image.size.width) height: \(image.size.height)")
        
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        let imgData = newImage!.jpegData(compressionQuality: 0.5)! as Data
        UIGraphicsEndImageContext()
        
        print("debug after: width: \(newImage?.size.width) height: \(newImage?.size.height)")
        
        return UIImage(data:imgData)!
    }
    
    
}
