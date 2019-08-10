//
//  ListView.swift
//  Citas
//
//  Created by Asge Yohannes on 8/8/19.
//  Copyright © 2019 Asge Yohannes. All rights reserved.
//

import SwiftUI

let kImage = "Mandela"

let kTitle = "Stretchy header in SwiftUI"

let kPublishedAt = Date()

let kAuthor = "Author Name"

let kContent = """
Nelson Rolihlahla Mandela was a South African anti-apartheid revolutionary, political leader, and philanthropist who served as President of South Africa from 1994 to 1999. He was the country's first black head of state and the first elected in a fully representative democratic election.
    A Xhosa, Mandela was born to the Thembu royal family in Mvezo, British South Africa. He studied law at the University of Fort Hare and the University of Witwatersrand before working as a lawyer in Johannesburg. There he became involved in anti-colonial and African nationalist politics, joining the ANC in 1943 and co-founding its Youth League in 1944. After the National Party's white-only government established apartheid, a system of racial segregation that privileged whites, he and the ANC committed themselves to its overthrow. Mandela was appointed President of the ANC's Transvaal branch, rising to prominence for his involvement in the 1952 Defiance Campaign and the 1955 Congress of the People. He was repeatedly arrested for seditious activities and was unsuccessfully prosecuted in the 1956 Treason Trial. Influenced by Marxism, he secretly joined the banned South African Communist Party (SACP). Although initially committed to non-violent protest, in association with the SACP he co-founded the militant Umkhonto we Sizwe in 1961 and led a sabotage campaign against the government. He was arrested and imprisoned in 1962, and subsequently sentenced to life imprisonment for conspiring to overthrow the state following the Rivonia Trial.
"""

private let kHeaderHeight: CGFloat = 300

struct DetailView: View {
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                GeometryReader { (geometry: GeometryProxy) in
                    if geometry.frame(in: .global).minY <= 0 {
                        Image(kImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height)
                    } else {
                        Image(kImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height
                                    + geometry.frame(in: .global).minY)
                    }
                }.frame(maxHeight: kHeaderHeight)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("\(kPublishedAt, formatter: Self.formatter)")
                            .foregroundColor(.secondary)
                            .font(.caption)

                        Spacer()

                        Text("Author: \(kAuthor)")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }

                    Text(kTitle)
                        .font(.headline)

                    Text(kContent)
                        .font(.body)
                        .multilineTextAlignment(.center)
                }.frame(idealHeight: .greatestFiniteMagnitude)
                    .padding()
            }
        }.edgesIgnoringSafeArea(.top)
    }
    
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
#endif
