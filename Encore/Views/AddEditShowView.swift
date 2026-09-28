//
//  AddEditShowView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/27/26.
//

import SwiftUI
import SwiftData

struct AddEditShowView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: AddEditShowViewModel
    var body: some View {
        Text("Add Conten Here")
    }
}

#Preview {
    AddEditShowView()
}
