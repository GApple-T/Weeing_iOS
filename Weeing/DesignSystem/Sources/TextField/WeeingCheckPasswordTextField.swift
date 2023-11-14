import SwiftUI

public struct WeeingCheckPasswordTextField: View {
    @State private var titleColor: Color
    @Binding var textFieldText: String

    public init(
        titleColor: Color,
        textFieldText: Binding<String>
    ) {
        _textFieldText = textFieldText
        self.titleColor = titleColor
    }

    public var body: some View {
        VStack(spacing: 0) {
            Text("Check Password")
                .font(.custom("AppleSDGothicNeoB00", size: 15))
                .foregroundColor(titleColor)
                .padding(.leading, 52)
                .padding(.trailing, 226)

            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.T10)
                .frame(height: 40)
                .padding(.horizontal, 45)
                .padding(.top, 6)
                .overlay(
                    HStack {
                        SecureField("", text: $textFieldText)
                            .padding(.leading, 55)
                            .padding(.trailing, 60)
                    })
        }
    }
}
