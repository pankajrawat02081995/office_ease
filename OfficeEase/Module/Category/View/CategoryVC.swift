import UIKit

class CategoryVC: UIViewController {
    
    @IBOutlet weak var createCategoryView: UIView!
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            return self.createLayout()
        }
        
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "CategoryXIB", bundle: nil), forCellWithReuseIdentifier: CategoryXIB.identifier)
        collectionView.dataSource = self
    }
    
    private func createLayout() -> NSCollectionLayoutSection {
        let spacing: CGFloat = 10
        let itemsPerRow: CGFloat = 2
        let totalSpacing = spacing * (itemsPerRow - 1)
        let itemWidth = (collectionView.bounds.width - totalSpacing) / itemsPerRow
        let itemHeight = itemWidth / 3  // Reduced height
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth),
                                              heightDimension: .absolute(itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(itemHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: Int(itemsPerRow))
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: 0, bottom: spacing, trailing: 0)
        
        return section
    }
}

extension CategoryVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryXIB.identifier, for: indexPath) as? CategoryXIB else {
            return UICollectionViewCell()
        }
        
        cell.lblCat.text = "Category \(indexPath.item + 1)"
        cell.lblCat.textColor = .blue
        
        let itemWidth = (collectionView.bounds.width - 30) / 2  // Adjust width based on spacing
        let itemHeight = itemWidth / 3  // Reduced height
        cell.setupCornerRadius(height: itemHeight)
        
        return cell
    }
}
