//
//  PageViewController.swift
//  hw24
//
//  Created by Елизавета Метла on 10/3/20.
//

import UIKit
import Kingfisher


class PageViewController: UIPageViewController {
    
    private var controllers: [UIViewController] = []
    private let count = 5
    private var pageControl: UIPageControl!
    private var images: [String] = ["https://www.dropbox.com/s/v9drze8ykux0wdl/cat-61079_1920.jpg?dl=1", "https://www.dropbox.com/s/x6qxy7rgg5fxn29/cat-1246659_1920.jpg?dl=1",
    "https://www.dropbox.com/s/43y1n2a61mj01iw/cat-1940487_1920.jpg?dl=1",
    "https://www.dropbox.com/s/595s2xk1xw5pc7j/cat-3336579_1920.jpg?dl=1",
    "https://www.dropbox.com/s/kzz0j48ld91ynf6/cat-5098930_1920.jpg?dl=1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl = UIPageControl(frame: .zero)
        pageControl.numberOfPages = count
        pageControl.currentPage = 0
        pageControl.tintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        view.addSubview(pageControl)

        dataSource = self
        delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        for index in 1...count {
            if let vc = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController {
                vc.imageURL = images[index - 1]
                controllers.append(vc)
            }
        }
        
        if let initialVC = controllers.first {

            setViewControllers([initialVC], direction: .forward, animated: false, completion: nil)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size = pageControl.size(forNumberOfPages: count)
        let point = CGPoint(x: view.center.x - size.width / 2, y: view.frame.maxY - 55)
        
        pageControl.frame =  CGRect(origin: point, size: size)
    }
    
}

extension PageViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextVCindex = index - 1
        
        if nextVCindex >= 0 {
            let vc = controllers[nextVCindex]

            return vc
        }
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextVCindex = index + 1
        
        if nextVCindex < count {
            let vc = controllers[nextVCindex]
            return vc
        }
        return nil
 
    }
}

extension PageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]){
        
        if let viewController = pendingViewControllers.first, let index = controllers.firstIndex(of: viewController) {
            pageControl.currentPage = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard finished else {
            return
        }
        
        if let viewController = viewControllers?.first, let index = controllers.firstIndex(of: viewController) {
            pageControl.currentPage = index
        }
        
    }
    
}
