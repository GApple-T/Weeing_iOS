import SwiftUI

public struct WeeingEmailTextField: View {
    @Binding var textFieldText: String
    var textFieldColor: Color
    var titleColor: Color
    var helpMessage: String
    var isError: Bool

    public init(
        textFieldText: Binding<String>,
        textFieldColor: Color,
        titleColor: Color,
        helpMessage: String = "",
        isError: Bool = false

    ) {
        _textFieldText = textFieldText
        self.textFieldColor = textFieldColor
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

            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isError ? Color.ERORR : textFieldColor)
                .foregroundColor(textFieldColor)
                .frame(height: 40)
                .padding(.horizontal, 45)
                .padding(.top, 6)
                .overlay(
                    ZStack {
                        TextField("", text: $textFieldText)
                            .padding(.leading, 55)
                            .padding(.trailing, 130)

                        Text("@gsm.hs.kr")
                            .font(.custom("AppleSDGothicNeoM00", size: 14))
                            .foregroundColor(.N20)
                            .padding(.leading, 218)
                    }
                )

            Text(helpMessage)
                .font(.system(size: 10))
                .foregroundStyle(isError ? Color.ERORR : Color.N20)
        }
    }
}
