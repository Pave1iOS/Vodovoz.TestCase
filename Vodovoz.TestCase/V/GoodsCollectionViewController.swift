//
//  GoodsCollectionViewController.swift
//  Vodovoz.TestCase
//
//  Created by Pavel Gribachev on 23.08.2024.
//

import UIKit

final class GoodsCollectionViewController: UIViewController {
	
	private lazy var goodsCollectionView = makeGoodsCollectionView()
	private let viewModel = GoodsViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		setupUI()
		
		viewModel.getItems()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		layout()
	}
	

}

// MARK: Setup UI
private extension GoodsCollectionViewController {
	func setupUI() {
		
		view.addSubview(goodsCollectionView)
		
		goodsCollectionView.register(
			GoodsCollectionViewCell.self,
			forCellWithReuseIdentifier: GoodsCollectionViewCell.identifier
		)
	}
	
	func layout() {
		NSLayoutConstraint.activate([
			goodsCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			goodsCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			goodsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			goodsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			goodsCollectionView.heightAnchor.constraint(equalToConstant: 150)
		])
	}
}

// MARK: Setup UICollectionView
private extension GoodsCollectionViewController {
	func collectionViewLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		let itemWidth = 150
		let itemHeight = 150
		let itemSpacing: CGFloat = 10

		layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = itemSpacing
		layout.minimumInteritemSpacing = itemSpacing
		
		return layout
	}
	
	func makeGoodsCollectionView() -> UICollectionView {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
		
		collectionView.isPagingEnabled = true
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		#warning("edit backgraund later")
		collectionView.backgroundColor = .white
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		return collectionView
	}
}

// MARK: CollectionView Delegate & DataSource
extension GoodsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: GoodsCollectionViewCell.identifier,
			for: indexPath
		) as? GoodsCollectionViewCell else { return UICollectionViewCell() }
		
		cell.configure(
			goodsImage: .milk,
			goodsPrice: "250",
			goodsLike: false,
			goodsCart: .shoppingCart
		)
		
		return cell
	}
}

#Preview {
	GoodsCollectionViewController()
}
