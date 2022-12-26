//
//  HomePageContracts.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

protocol HomePageViewModelProtocol {
    var delegate: HomePageViewModelDelegate? { get set }
}

protocol HomePageViewModelDelegate: AnyObject {}
