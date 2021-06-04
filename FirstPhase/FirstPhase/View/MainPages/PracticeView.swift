//
//  PracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct PracticeView: View {
    
    @State var isPresentedTweetPracticeView: Bool = false
    @State var isPresentedCreatePracticeView: Bool = false
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    @State var isShowingAction: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            ForEach(practiceViewModel.practices.indices, id: \.self) { index in
                
                HStack {
                    
                    Button(action: {
                        practiceViewModel.tweetSheetBoolForPracticeView[index].toggle()
                    }) {
                        OnePracticeView(practice: practiceViewModel.practices[index])
                    }
                    //Previewは有効じゃないけど実装時はうまくいく
                    .sheet(isPresented: $practiceViewModel.tweetSheetBoolForPracticeView[index], content: {
                        TweetPracticeView(practice: practiceViewModel.practices[index])
                    })
                    
                    Button(action: {
                        isShowingAction.toggle()
                    }, label: {
                        Text("Button")
                    })
                    .actionSheet(isPresented: $isShowingAction, content: {
                        ActionSheet(title: Text("編集の操作を選んでください。"), message: Text("記録も同様に扱われます。"), buttons: [
                            .default(Text("編集をします"), action: {
                                practiceViewModel.updatePracticeBoolForPracticeView[index].toggle()
                            }),
                            .destructive(Text("削除をします"), action: {
                                print("削除しました")
                            }),
                            .cancel()
                        ])
                    })
                    .sheet(isPresented: $practiceViewModel.updatePracticeBoolForPracticeView[index], content: {
                        CreatePracticeView(updatePractice: practiceViewModel.practices[index])
                    })
                    
                }
            }
            
            Button(action: {
                self.isPresentedCreatePracticeView.toggle()
            }, label: {
                Label("Add Another Practice", systemImage: "plus")
                    .padding()
            })
            .sheet(isPresented: $isPresentedCreatePracticeView, content: {
                CreatePracticeView()
            })
        }
    }
}

//struct PracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        PracticeView().environmentObject(PracticeViewModel())
//    }
//}

///#Comment Gestureによる編集および削除のAlert機能
//.gesture(DragGesture()
//            .onEnded({ value in
//                if (abs(value.translation.width) < 20) { return }
//                if value.translation.width > 20 {
//                    isShowDeleteAlert = true
//                } else if value.translation.width < -20 {
//                    isShowUpdateAlert = true
//                }
//
//            }))
//.alert(isPresented: $isShowDeleteAlert, content: {
//    Alert(title: Text("このPracticeとログを削除しますか？"), primaryButton: Alert.Button.default(Text("Yes"), action: {
//        practiceViewModel.deletePractice(practice: <#T##Practice#>)
//    }), secondaryButton: .cancel())
//})
//.alert(isPresented: $isShowUpdateAlert, content: {
//    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Alert(title: Text("Alert"))/*@END_MENU_TOKEN@*/
//})


///#Comment NavigationLinkによるTweet Viewへの遷移
//        NavigationView {

//                NavigationLink(destination: TweetPracticeView(practice: practiceViewModel.practices[index])) {
//                    OnePracticeView(practice: practiceViewModel.practices[index])
//                }

//}
