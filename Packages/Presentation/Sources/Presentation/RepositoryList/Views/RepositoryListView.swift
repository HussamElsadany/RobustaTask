//
//  RepositoryListView.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import Combine
import SwiftUI

public struct RepositoryListView: View {

    @ObservedObject var viewModel: RepositoryListViewModel

    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repos) { repository in
                    NavigationLink(destination: RepositoryRow(repository: repository)) {
                        RepositoryRow(repository: repository)
                    }
                }
            }
            .navigationTitle(viewModel.title)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
                viewModel.fetchPublicReposList()
        }
        .alert(isPresented: $viewModel.showError, content: {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}
