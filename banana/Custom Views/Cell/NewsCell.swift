//
//  NewsCell.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import UIKit

class NewsCell: UICollectionViewCell {
    static let reuseID = "Newscell"
    
    let avatarImageView = AvatarImageView(frame: .zero)
    let titleLabel = TitleLabel(textAlignment: .left, fontSize: 16)
    let sourceLabel = BodyLabel(textAlignment: .left)
    let dateLabel = BodyLabel(textAlignment: .left)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(article: Article) {
        titleLabel.text = article.title
        avatarImageView.downloadImage(from: article.urlToImage ?? "")
        sourceLabel.text = article.source.name
        
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: article.publishedAt ?? "") {
                dateFormatter.dateFormat = "MMMM dd. yyyy"
                let formattedDate = dateFormatter.string(from: date)
                dateLabel.text = formattedDate
            } else {
                dateLabel.text = article.publishedAt
            }

    }
    
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(titleLabel)
        addSubview(sourceLabel)
        addSubview(dateLabel)
        
        let padding: CGFloat = 8
        titleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -28),
            
            sourceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            sourceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: sourceLabel.trailingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -28),
            dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -padding)
        ])
        
        sourceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        dateLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
