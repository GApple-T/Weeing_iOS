import SwiftUI

struct Dropdownitem: Identifiable {
    let id: Int
    let title: String
    let onSelect: () -> Void
}

struct DropdownItem: View {
    @Binding var isSelecting: Bool
    @Binding var selectiontitle: String
    @Binding var selectionId: Int

    let item: Dropdownitem

    var body: some View {
        Button(action: {
            isSelecting = false
            selectiontitle = item.title
            selectionId = item.id
            item.onSelect()
        }) {
            VStack(spacing: 0) {
                Divider()
                    .background(.white)
                    .padding(.horizontal)
                HStack(spacing: 0) {
                    Spacer()
                    Text(item.title)
                        .font(.custom("AppleSDGothicNeoB00", size: 18))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .foregroundColor(.black)
            }
        }
    }
}
