//
//  PublicRepositoryUseCase.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import CoreError

// MARK: PublicRepositoryUseCaseProtocol
public protocol PublicRepositoryUseCaseProtocol: AnyObject {
    func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void)
}

// MARK: PublicRepositoryUseCase
public class PublicRepositoryUseCase {

    private let repo: PublicRepositoriesRepoProtocol

    public init(repo: PublicRepositoriesRepoProtocol) {
        self.repo = repo
    }
}

extension PublicRepositoryUseCase: PublicRepositoryUseCaseProtocol {
    public func fetchPublicReposList(completion: @escaping (Result<[RepositoryModel], CoreError>) -> Void) {
        repo.fetchPublicReposList { result in
            completion(result)
        }
    }
}
