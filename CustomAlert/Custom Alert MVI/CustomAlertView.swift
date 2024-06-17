import SwiftUI
import Combine

struct CustomAlertView: MVIBaseView {
    @ObservedObject var viewModel: CustomAlertViewModel
    @State private var alertAnimation = false
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.3)
                .onTapGesture {
                    viewModel.close()
                }

            VStack(spacing: 24) {
                Text(viewModel.state.type.title)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .semibold))
                HStack(spacing: 16) {
                    cancelButtonView
                    acceptButtonView
                }
                .padding(.horizontal, 28)
            }
            .padding(18)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 1)
            .frame(maxWidth: .infinity, maxHeight: 180)
            .padding(.horizontal, 30)
            .scaleEffect(alertAnimation ? 1 : 0.9)
            .opacity(alertAnimation ? 1 : 0)
            .onAppear{
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
                    alertAnimation = true
                }
            }
            .onDisappear {
                alertAnimation = false
            }
        }
        .ignoresSafeArea()
    }
}
    
private extension CustomAlertView {
    
    var acceptButtonView: some View {
        Button(viewModel.state.type.acceptButtonTitle, action: {
            viewModel.intentHandler(.acceptButtonTapped)
        })
        .font(.system(size: 16, weight: .black))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 35.0)
                .fill(.black)
        )
    }
    
    var cancelButtonView: some View {
        Button(viewModel.state.type.cancelButtonTitle, action: {
            viewModel.intentHandler(.cancelButtonTapped)
        })
        .font(.system(size: 16, weight: .black))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 35)
                .stroke(.black, lineWidth: 1.0)
        )
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(viewModel: CustomAlertViewModel(state: .init(type: .cancelSwapRegistration, isActive: .constant(true))))
    }
}
