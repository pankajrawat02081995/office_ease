//
//  ViewController.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let totalPages = 3 // Adjust according to your data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyGradient()
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupCollectionView() {
        // Ensure the collection view is registered and the layout is correctly set up
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "WelcomeXIB", bundle: nil), forCellWithReuseIdentifier: WelcomeXIB.identifier)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = totalPages
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
    }
    
    @IBAction func nextOnPress(_ sender: UIButton) {
        let currentPage = pageControl.currentPage
        let nextPage = currentPage + 1
        if nextPage < totalPages {
            pageControl.currentPage = nextPage
            let indexPath = IndexPath(item: nextPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func skipOnPress(_ sender: UIButton) {
        self.pushViewController(ofType: SignInVC.self, fromStoryboard: .main)
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WelcomeXIB.identifier, for: indexPath) as? WelcomeXIB else {
            return UICollectionViewCell()
        }
        // Configure cell (if needed, you can pass data to your cell here)
        return cell
    }
    
    // Ensure cells take full screen width for paging effect
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    // Handle page control updates
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / collectionView.frame.width)
        pageControl.currentPage = pageIndex
    }
}
