import Foundation
import SwiftUI

class CustomAlertViewModel: MVIBaseViewModel {
    @Published var state: CustomAlertState
    
    init(state: CustomAlertState) {
        self.state = state
    }
    
    func intentHandler(_ intent: CustomAlertIntent) {
        switch intent {
        case .acceptButtonTapped:
            state.delegate?.acceptAction()
        case .cancelButtonTapped:
            state.delegate?.cancelAction()
        }
    }
}

extension CustomAlertViewModel {
    func close() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
            state.isActive = false
        }
    }
}

