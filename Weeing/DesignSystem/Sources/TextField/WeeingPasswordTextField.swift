import SwiftUI

public struct WeeingPasswordTextField: View {
    @Binding var textFieldText: String
    @Binding var isSecure: Bool
    @FocusState var isFocused: Bool
    var helpMessage: String
    var link: String
    var titleColor: Color
    var isError: Bool

    public init(
        textFieldText: Binding<String>,
        isSecure: Binding<Bool>,
        titleColor: Color,
        helpMessage: String = "",
        link: String = "",
        isError: Bool = false
    ) {
        _textFieldText = textFieldText
        _isSecure = isSecure
        self.titleColor = titleColor
        self.helpMessage = helpMessage
        self.link = link
        self.isError = isError
    }

    public var body: some View {
        VStack(spacing: 0) {
            Text("Password")
                .foregroundColor(titleColor)
                .font(.custom("AppleSDGothicNeoB00", size: 16))
                .padding(.trailing, 268)
                .padding(.leading, 50)
            
                HStack {
                    Group {
                        if isSecure {
                            SecureField("", text: $textFieldText)
                        } else {
                            TextField("", text: $textFieldText)
                        }
                    }
                    .frame(height: 40)
                    .padding(.leading, 12)
                    .focused($isFocused)
                    .font(.custom("AppleSDGothicNeoM00", size: 14))
                    .foregroundStyle(Color.N20)

                    Button {
                        isSecure.toggle()
                    } label: {
                        isSecure ?
                            Image(systemName: "eye") :
                            Image(systemName: "eye.slash")
                    }
                    .foregroundStyle(Color.N30)
                    .padding(.trailing, 14)
                }
                .background(Color.T10)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(isError ? Color.ERORR : Color.T10)
                        .frame(height: 40)
                        .foregroundStyle(Color.T10)
                }
                .padding(.top, 6)
                .padding(.horizontal, 45)

                HStack {
                    Text(helpMessage)
                        .font(.custom("AppleSDGothicNeoM00", size: 10))
                        .foregroundStyle(isError ? Color.ERORR : Color.N20)
                        .padding(.leading, 58)

                    Spacer()

                    Text(link)
                        .font(.custom("AppleSDGothicNeoSB00", size: 10))
                        .foregroundStyle(Color.S20)
                        .padding(.trailing, 52)
                }
                .padding(.top, 4)
            }
    }
}
