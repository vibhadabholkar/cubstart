//
//  ArticleView.swift
//  newsfeedSkeleton
//
//  Created by Vibha Dabholkar on 4/10/22.
//

import Foundation

import SwiftUI
import UIKit
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let image = article.image,
               let url = URL(string: image) {
                URLImage(url, identifier: url.absoluteString) {
                    EmptyView()
                } inProgress: { progress in
                    ProgressView()
                } failure: { error, retry in
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius : 10))
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .environment(\.urlImageOptions, .init(fetchPolicy: .returnStoreElseLoad(downloadDelay: nil)))
            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, wight: .semibold))
                Text(article.source ?? "")
                    
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
