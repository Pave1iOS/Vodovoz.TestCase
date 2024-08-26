//
//  GoodsCollectionViewCell.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 23.08.2024.
//

import UIKit

final class GoodsCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "GoodsCollectionViewCell"
	
	private lazy var goodsImage = makeGoodsImage()
	private lazy var goodsPrice = makeGoodsPrice()
	private lazy var goodsLike = makeGoodsLike()
	private lazy var goodsCart = makeGoodsCart()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(goodsImage: UIImage, goodsPrice: String, goodsLike: Bool, goodsCart: UIImage) {
		self.goodsImage.image = goodsImage
		self.goodsPrice.text = goodsPrice
		self.goodsCart.image = goodsCart
		
		self.goodsLike.image = goodsLike
		? UIImage(systemName: "heart")
		: UIImage(systemName: "heart.fill")
	}
}

private extension GoodsCollectionViewCell {
	func makeGoodsImage() -> UIImageView {
		let imageView = UIImageView()
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
				
		return imageView
	}
	
	func makeGoodsPrice() -> UILabel {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .boldSystemFont(ofSize: 15)
		label.numberOfLines = 0
				
		return label
	}
	
	func makeGoodsLike() -> UIImageView {
		let imageView = UIImageView()
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
				
		return imageView
	}
	
	func makeGoodsCart() -> UIImageView {
		let imageView = UIImageView()
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
				
		return imageView
	}
}

private extension GoodsCollectionViewCell {
	func layout() {
		contentView.addSubview(goodsPrice)
		contentView.addSubview(goodsImage)
		contentView.addSubview(goodsLike)
		contentView.addSubview(goodsCart)
				
		NSLayoutConstraint.activate([
			goodsImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -30),
			goodsImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			goodsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
			goodsImage.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			goodsPrice.heightAnchor.constraint(equalToConstant: 20),
			goodsPrice.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
			goodsPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
			goodsPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
			
			goodsLike.heightAnchor.constraint(equalToConstant: 20),
			goodsLike.widthAnchor.constraint(equalToConstant: 20),
			goodsLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
			goodsLike.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			
			goodsCart.heightAnchor.constraint(equalToConstant: 30),
			goodsCart.widthAnchor.constraint(equalToConstant: 30),
			goodsCart.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
			goodsCart.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
		])
	}
}

#if DEBUG
import SwiftUI

struct GoodsCollectionViewCell_Preview: PreviewProvider {
	static var previews: some View {
		UIViewPreview {
			let cell = GoodsCollectionViewCell()
			cell.configure(goodsImage: UIImage(named: "milk")!, goodsPrice: "250 ₽", goodsLike: true, goodsCart: UIImage(systemName: "cart")!)
			return cell
		}
		.previewLayout(.fixed(width: 300, height: 300))
	}
}

struct UIViewPreview<View: UIView>: UIViewRepresentable {
	let view: View
	
	init(_ builder: @escaping () -> View) {
		view = builder()
	}
	
	func makeUIView(context: Context) -> View {
		return view
	}
	
	func updateUIView(_ uiView: View, context: Context) {
	}
}
#endif
