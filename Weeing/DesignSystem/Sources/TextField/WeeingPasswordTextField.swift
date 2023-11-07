import SwiftUI

public struct WeeingPasswordTextField: View {
    @Binding var textFieldText: String
    @Binding var pressedEye: Bool
    var helpMessage: String
    var textFieldColor: Color
    var titleColor: Color
    var isError: Bool

    public init(
        textFieldText: Binding<String>,
        pressedEye: Binding<Bool>,
        textFieldColor: Color,
        titleColor: Color,
        helpMessage: String = "",
        isError: Bool = false
    ) {
        _textFieldText = textFieldText
        _pressedEye = pressedEye
        self.textFieldColor = textFieldColor
        self.titleColor = titleColor
        self.helpMessage = helpMessage
        self.isError = isError
    }

    public var body: some View {
        VStack(spacing: 0) {
            Text("Password")
                .foregroundColor(titleColor)
                .font(.custom("AppleSDGothicNeoB00", size: 16))
                .padding(.trailing, 268)
                .padding(.leading, 50)

            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isError ? Color.ERORR : textFieldColor)
                .foregroundColor(textFieldColor)
                .frame(height: 40)
                .padding(.horizontal, 45)
                .padding(.top, 6)
                .overlay(
                    HStack(spacing: 0) {
                        if pressedEye == false {
                            SecureField("", text: $textFieldText)
                                .font(.system(size: 12))
                                .padding(.leading, 55)
                                .padding(.trailing, 10)
                        } else {
                            TextField("", text: $textFieldText)
                                .font(.system(size: 12))
                                .padding(.leading, 55)
                                .padding(.trailing, 10)
                        }

                        Button {
                            self.pressedEye.toggle()
                        } label: {
                            if pressedEye == false {
                                Image(systemName: "eye")
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .foregroundColor(.N20)
                                    .padding(.trailing, 59)
                            } else {
                                Image(systemName: "eye.slash")
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .foregroundColor(.N20)
                                    .padding(.trailing, 59)
                            }
                        }
                        .padding(.top, 10)
                    }
                )
            
            Text(helpMessage)
                .font(.system(size: 10))
                .foregroundStyle(isError ? Color.ERORR : Color.N20)
        }
    }
}
