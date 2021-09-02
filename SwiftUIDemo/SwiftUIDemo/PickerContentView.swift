//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 이아연 on 2021/06/17.
//

import SwiftUI

struct PickerContentView: View {
    
    //@State -> Struct는 내부 프로퍼티를 변경할 수 없지만, @State 키워드를 붙이면 가능합. Swift 5.1부터 제공.
    let genderType = ["남자", "여자", "기타"]
    let residenceType = ["서울", "대전", "대구", "광주", "부산", "제주", "수원", "기타"]
    let jobType = ["간호사","개발자","의사","프리랜서","요리사","헤어디자이너","회사원"]
    
    @State var name_kr : String = ""
    @State var name_en : String = ""
    @State var bornDate = Date()
    @State var gender : Int = 0
    @State var residence : Int = 0
    @State var job : Int = 0
    @State var result : String = ""

    var body: some View {
        NavigationView {
            Form{
                Section (header: Text("이름")){
                    TextField("이름(한글)", text: $name_kr)
                        .keyboardType(.default)
                    
                    TextField("이름(영문)", text: $name_en)
                        .keyboardType(.default)
                }
                
                Section (header: Text("출생")){
                    DatePicker(selection : $bornDate, in: ...Date(), displayedComponents : .date) {
                        Text("생년월일을 선택해주세요.")
                    }
                }
                
                Section (header: Text("거주지")){
                    Picker("현재 거주지를 선택해주세요.", selection: $residence) {
                        ForEach(0 ..< residenceType.count) {
                            Text("\(residenceType[$0])")
                        }
                    }
                }
                
                Section (header: Text("직업")){
                    Picker(selection: $job, label: Text("직업을 선택해주세요")) {
                        ForEach(0 ..< jobType.count) {
                            Text(self.jobType[$0])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section (header: Text("성별")){
                    Picker("성별", selection: $gender){
                        ForEach(0 ..< genderType.count) {
                            Text("\(genderType[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
               
                Section (header: Text("자기소개 결과")){
                    Text("\(result)")
                    Button("결과보기"){
                        let currentYear = Calendar.current.component(.year, from: Date())
                        let birthYear = Calendar.current.component(.year, from: bornDate)
                        result = name_kr.isEmpty ? "이름이 누락되었습니다." : """
                                                                        안녕하세요, 저는\(name_kr)입니다.
                                                                        현재 \(currentYear - birthYear + 1)세로,\(residenceType[residence])에 거주중입니다.
                                                                        그리고, \(jobType[job])의 직업을 가지고 있습니다.
                                                                        """
                    }
                    
                }
              
                
            }.navigationTitle("회원가입")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PickerContentView()
    }
}
