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
	private lazy var goodsLike = makeGoodsLike(true)
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
		
		self.goodsPrice.attributedText = display(price: goodsPrice, withFontSize: 15)
		
		self.goodsCart.image = goodsCart
		
		self.goodsLike.image = goodsLike
		? UIImage(systemName: "heart.fill")
		: UIImage(systemName: "heart")
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
		label.numberOfLines = 0
				
		return label
	}
	
	func makeGoodsLike(_ isLike: Bool) -> UIImageView {
		let imageView = UIImageView()
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		
		imageView.tintColor = isLike
		? .black
		: .red
		
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
		contentView.layer.borderColor = UIColor.lightGray.cgColor.copy(alpha: 0.3)
		contentView.layer.borderWidth = 1
		contentView.layer.cornerRadius = 5
		contentView.backgroundColor = .white
		contentView.addSubview(goodsPrice)
		contentView.addSubview(goodsImage)
		contentView.addSubview(goodsLike)
		contentView.addSubview(goodsCart)

		NSLayoutConstraint.activate([
			goodsImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			goodsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			goodsImage.bottomAnchor.constraint(equalTo: goodsPrice.topAnchor, constant: -15),
			goodsImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			goodsPrice.heightAnchor.constraint(equalToConstant: 20),
			goodsPrice.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
			goodsPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			goodsPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
			
			goodsLike.heightAnchor.constraint(equalToConstant: 30),
			goodsLike.widthAnchor.constraint(equalToConstant: 30),
			goodsLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			goodsLike.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			
			goodsCart.heightAnchor.constraint(equalToConstant: 30),
			goodsCart.widthAnchor.constraint(equalToConstant: 30),
			goodsCart.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			goodsCart.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
	}
}

private extension GoodsCollectionViewCell {
	// отображение цены согласно ТЗ
	func display(price: String, withFontSize size: CGFloat) -> NSAttributedString {
		let attributedString = NSMutableAttributedString()
		
		let bold: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: size)]
		let thin: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: size)]
		
		let attributedPrice = NSAttributedString(string: "\(price) ", attributes: bold)
		let attributedSymbol = NSAttributedString(string: "₽", attributes: thin)
		
		attributedString.append(attributedPrice)
		attributedString.append(attributedSymbol)
		
		return attributedString
	}
}

// MARK: DEBAG - Preview
#if DEBUG
import SwiftUI

struct GoodsCollectionViewCell_Preview: PreviewProvider {
	static var previews: some View {
		UIViewPreview {
			let cell = GoodsCollectionViewCell()
			cell.configure(
				goodsImage: UIImage(named: "milk")!,
				goodsPrice: "250",
				goodsLike: false,
				goodsCart: .shoppingCart
			)
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
