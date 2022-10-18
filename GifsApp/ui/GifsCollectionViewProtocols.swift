//
//  GifsCollectionViewProtocols.swift
//  GifsApp
//
//  Created by Shulumba Igor on 18.10.2022.
//

import SwiftyJSON
import UIKit

protocol GifsCollectionViewCustomLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForCellAtIndexPath indexPath:IndexPath, contentWidth width: CGFloat) -> CGFloat
    func cellPaddingFor(_ collectionView: UICollectionView) -> CGFloat
}

public protocol TenorEndpoint {
    associatedtype json
    associatedtype response
    
    /// Client key for privileged API access
    var key: String { get }
    /// Tenor endpoint type
    var endpointType: TenorEndpointType { get }
    /// Generated URL
    func url() -> URL
    func responseExtractor(_: json) -> response
}

public protocol GifsCollectionViewDelegate: AnyObject {
    func didSelectGifsItem(gifItem: GifsItem)
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

public protocol GifsItem: AnyObject {
    var gifItemURL: URL { get }
    var gifItemSize: CGSize { get }
    var gifID: String { get }
}

public protocol GifsProvider: AnyObject {
    func setApiKey(apiKey: String)
    func startLoadingGifs(with text: String?, completion: @escaping (_ success: Bool) -> Void)
    func loadMoreGifs(completion: @escaping (_ success: Bool, _ insertItemsAt: [IndexPath]) -> Void)
    func registerShare(gifItem: GifsItem)
    func numberOfItems() -> Int
    func gifItemAt(indexPath: IndexPath) -> GifsItem
}

