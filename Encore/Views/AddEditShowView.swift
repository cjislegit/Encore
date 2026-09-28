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
    
    let existingShow: Show?
    
    init(show: Show? = nil, initialStatus: ShowStatus = .upcoming) {
        self.existingShow = show
        self._viewModel = State(initialValue: AddEditShowViewModel(show: show, initialStatus: initialStatus))
    }
    
    var body: some View {
        @Bindable var vm = viewModel
        
        NavigationStack {
            Form {
                Section("Show Info") {
                    TextField("Artist", text: $vm.artistName)
                    TextField("Venue", text: $vm.venueName)
                    TextField("City", text: $vm.city)
                    DatePicker("Date", selection: $vm.date, displayedComponents: .date)
                    Picker("Status", selection: $vm.status) {
                        ForEach(ShowStatus.allCases, id: \.self) { status in
                            Text(status.rawValue.capitalized)
                                .tag(status)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddEditShowView()
}
