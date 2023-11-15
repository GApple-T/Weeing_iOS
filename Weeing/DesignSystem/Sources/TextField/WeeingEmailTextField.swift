import SwiftUI

public struct WeeingEmailTextField: View {
    @Binding var textFieldText: String
    @FocusState var isFocused: Bool
    var titleColor: Color
    var helpMessage: String
    var isError: Bool

    public init(
        textFieldText: Binding<String>,
        titleColor: Color,
        helpMessage: String = "",
        isError: Bool = false

    ) {
        _textFieldText = textFieldText
        self.titleColor = titleColor
        self.helpMessage = helpMessage
        self.isError = isError
    }

    public var body: some View {
        VStack(spacing: 0) {
                Text("Email")
                    .foregroundColor(titleColor)
                    .font(.custom("AppleSDGothicNeoB00", size: 16))
                    .padding(.trailing, 298)
                    .padding(.leading, 52)
            
                TextField("                                                           @gsm.hs.kr", text: $textFieldText)
                    .frame(height: 40)
                    .padding(.leading, 12)
                    .focused($isFocused)
                    .foregroundStyle(Color.N20)
                    .background(Color.T10)
                    .font(.custom("AppleSDGothicNeoM00", size: 14))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(isError ? Color.ERORR : Color.T10)
                            .frame(height: 40)
                            .foregroundStyle(Color.T10)
                    )
                    .padding(.horizontal, 45)
                    .padding(.top, 6)
            
            Text(helpMessage)
                .font(.system(size: 10))
                .foregroundStyle(isError ? Color.ERORR : Color.N20)
                .padding(.leading, 52)
                .padding(.trailing, 154)
                .padding(.top, 4)
        }
    }
}
