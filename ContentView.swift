//
//  ContentView.swift
//  EasyRes
//
//  Created by Jane on 4/25/22.
//

import SwiftUI
import UIKit

class myInfo: ObservableObject{
    //this class is used to transfer the user's input so that it can be used across views (aka the resume views)
    //TODO: use these variable names when creating your template view
    
    //basic information variables
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var linkedIn: String = ""
    @Published var website: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    
    //school variables
    @Published var school: String = ""
    @Published var startSchool: String = ""
    @Published var endSchool: String = ""
    @Published var gpa: String = ""
    @Published var clubs: String = ""
    @Published var awards: String = ""
    @Published var major: String = ""

    //work experience 1 variables
    @Published var e1title: String = ""
    @Published var e1company: String = ""
    @Published var e1location: String = ""
    @Published var e1start: String = ""
    @Published var e1end: String = ""
    @Published var e1detail1: String = ""
    @Published var e1detail2: String = ""
    @Published var e1detail3: String = ""

    //work experience 2 variables
    @Published var e2title: String = ""
    @Published var e2company: String = ""
    @Published var e2location: String = ""
    @Published var e2start: String = ""
    @Published var e2end: String = ""
    @Published var e2detail1: String = ""
    @Published var e2detail2: String = ""
    @Published var e2detail3: String = ""
    
    //work experience 3 variables
    @Published var e3title: String = ""
    @Published var e3company: String = ""
    @Published var e3location: String = ""
    @Published var e3start: String = ""
    @Published var e3end: String = ""
    @Published var e3detail1: String = ""
    @Published var e3detail2: String = ""
    @Published var e3detail3: String = ""
    
    //project 1 variables
    @Published var p1name: String = ""
    @Published var p1title: String = ""
    @Published var p1detail1: String = ""
    @Published var p1detail2: String = ""
    @Published var p1detail3: String = ""
    
    //project 2 variables
    @Published var p2name: String = ""
    @Published var p2title: String = ""
    @Published var p2detail1: String = ""
    @Published var p2detail2: String = ""
    @Published var p2detail3: String = ""
    
    //project 3 variables
    @Published var p3name: String = ""
    @Published var p3title: String = ""
    @Published var p3detail1: String = ""
    @Published var p3detail2: String = ""
    @Published var p3detail3: String = ""
    
    //skills
    @Published var skill1: String = ""
    @Published var skill2: String = ""
    @Published var skill3: String = ""
    @Published var skill4: String = ""
    @Published var skill5: String = ""
    
    //courses
    @Published var course1: String = ""
    @Published var course2: String = ""
    @Published var course3: String = ""
    @Published var course4: String = ""
    @Published var course5: String = ""
    
    //description
    @Published var description: String = ""
   
}



struct ContentView: View {
    //basic information variables
        @State var temp1: String = ""
        @State var temp2: String = ""
        @State var temp3: String = ""
        @State var temp4: String = ""
        @State var temp5: String = ""
        @State var temp6: String = ""
        @State var temp7: String = ""
        @State var temp8: String = ""

    
    @StateObject var me = myInfo()
    
    init(){
            UITableView.appearance().backgroundColor = .clear
            UITabBar.appearance().backgroundColor = UIColor.white

        }
    
    var body: some View {
        NavigationView {
            TabView {
    
                // ///////////////// ///
                //TEMPLATES TAB VIEW //
                // ///////////////////
                //****TODO: make it look a bit nicer if we want
                VStack{
                    Text("Resume Templates").font(.custom("Arimo-Bold", size: 30))
                        .padding(.bottom, 40)
                    HStack{ //templates 1 and 2
                        
                        //Template 1
                        NavigationLink(destination: JaneView().environmentObject(self.me)) {
                            VStack{
                                Image("jane")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                    Text("Bold Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                        
                        //Template 2
                        NavigationLink(destination: JeffreyView().environmentObject(self.me)) {
                            VStack{
                                Image("jeffrey")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                    Text ("Project Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                    }
                   
                    HStack{ // templates 3 & 4
                        
                        //Template 3
                        NavigationLink(destination: VibhaView().environmentObject(self.me)) {
                            VStack{
                                Image("vibha")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                    Text ("Detailed Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                        
                        //Template 4
                        NavigationLink(destination: VivianView().environmentObject(self.me)) {
                            VStack{
                                Image("vivian")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                
                                    Text ("Technical Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                    }
                } .tabItem{
                    Image(systemName: "house.fill")
                    Text("Templates")}
                
                
                // /////////////////
                //PROFILE TAB VIEW //
                // //////////////////
                VStack{
                    Text("My Information").font(.custom("Arimo-Bold", size: 30))
                        .padding(.bottom, 40)
                    List {
                        //BASIC INFORMATION
                        Section(header:Text("BASIC INFORMATION") .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Full Name", text: $me.name)
                            TextField("Location", text: $me.location)
                            TextField("LinkedIn", text: $me.linkedIn)
                            TextField("Website", text: $me.website)
                            TextField("Email", text: $me.email)
                            TextField("Phone Number", text: $me.phone)
    
                        }
                        
                        //EDUCATION
                        Section(header:Text("EDUCATION")
                            .font(.custom("Arimo-SemiBold", size: 16))){

                            TextField("School Name", text: $me.school)
                            TextField("Start Month & Year", text: $me.startSchool)
                            TextField("End Month & Year", text: $me.endSchool )
                            TextField("GPA", text: $me.gpa)
                            TextField("Clubs", text: $me.clubs)
                            TextField("Awards", text: $me.awards)

                        }

                        //WORK EXPERIENCE
                        Section(header:Text("WORK EXPERIENCE 1") .font(.custom("Arimo-SemiBold", size: 16))){

                            TextField("Job Title", text: $me.e1title)
                            TextField("Company", text: $me.e1company)
                            TextField("Location", text: $me.e1location)
                            TextField("Start Month & Year", text: $me.e1start)
                            TextField("End Month & Year", text: $me.e1end)
                            TextField("Details 1", text: $me.e1detail1)
                            TextField("Details 2", text: $me.e1detail2)
                            TextField("Details 3", text: $me.e1detail3)
                        }

                        Section(header:Text("WORK EXPERIENCE 2") .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Job Title", text: $me.e2title)
                            TextField("Company", text: $me.e2company)
                            TextField("Location", text: $me.e2location)
                            TextField("Start Month & Year", text: $me.e2start)
                            TextField("End Month & Year", text: $me.e2end)
                            TextField("Details 1", text: $me.e2detail1)
                            TextField("Details 2", text: $me.e2detail2)
                            TextField("Details 3", text: $me.e2detail3)
                        }

                        Section(header:Text("WORK EXPERIENCE 3") .font(.custom("Arimo-SemiBold", size: 16))){

                            TextField("Job Title", text: $me.e3title)
                            TextField("Company", text: $me.e3company)
                            TextField("Location", text: $me.e3location)
                            TextField("Start Month & Year", text: $me.e3start)
                            TextField("End Month & Year", text: $me.e3end)
                            TextField("Details 1", text: $me.e3detail1)
                            TextField("Details 2", text: $me.e3detail2)
                            TextField("Details 3", text: $me.e3detail3)
                        }
                        
                        //PROJECT EXPERIENCE
                        Section(header:Text("PROJECT 1")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Project Name", text: $me.p1name)
                            TextField("Responsibilty Title", text: $me.p1title)
                            TextField("Details 1", text: $me.p1detail1)
                            TextField("Details 2", text: $me.p1detail2)
                            TextField("Details 3", text: $me.p1detail3)
                        }
                        
                        Section(header:Text("PROJECT 2")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            TextField("Project Name", text: $me.p2name)
                            TextField("Responsibilty Title", text: $me.p2title)
                            TextField("Details 1", text: $me.p2detail1)
                            TextField("Details 2", text: $me.p2detail2)
                            TextField("Details 3", text: $me.p2detail3)
                        }
                        
                        Section(header:Text("PROJECT 3")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            TextField("Project Name", text: $me.p3name)
                            TextField("Responsibilty Title", text: $me.p3title)
                            TextField("Details 1", text: $me.p3detail1)
                            TextField("Details 2", text: $me.p3detail2)
                            TextField("Details 3", text: $me.p3detail3)
                        }
                        
                        //SKILLS
                        Section(header:Text("SKILLS")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            TextField("Skill 1", text: $me.skill1)
                            TextField("Skill 2", text: $me.skill2)
                            TextField("Skill 3", text: $me.skill3)
                            TextField("Skill 4", text: $me.skill4)
                            TextField("Skill 5", text: $me.skill5)
                        }
                        
                        //COURSEWORK
                        Section(header:Text("COURSEWORK")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Coursework 1", text: $me.course1)
                            TextField("Coursework 2", text: $me.course2)
                            TextField("Coursework 3", text: $me.course3)
                            TextField("Coursework 4", text: $me.course4)
                            TextField("Coursework 5", text: $me.course5)
                        }
                    }
                    Spacer()
                }.tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Info")}
            
                
            } // end tab view bracket
        } //end navigation view bracket
    } // end var: body
} // end content view


//NAVIGATION VIEWS BELOW FOR EACH TEMPLATE:
// //////////////////////
//Jane Template View ////
// //////////////////////
struct JaneView: View {
    @EnvironmentObject var me: myInfo
    var body: some View {
        Text("JANE! \(me.name) \(me.location)\(me.email)\(me.phone)\(me.linkedIn)")
        Text("\(me.skill1)")
        Text("\(me.p1title)")
        //**** TODO: create template view
    }
}


// ///////////////////////
//Jeffrey Template View //
// //////////////////////
struct JeffreyView: View {
    @EnvironmentObject var me: myInfo
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Spacer()
                    
                    Text(" \(me.name) ")
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text(" \(me.phone)  ")
                                .font(.caption)
                        }
                        
                        Text(" \(me.email)  ")
                            .font(.caption)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Text("  EDUCATION ")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                HStack {
                    Text("       \(me.school) ")
                    Spacer()
                }
                
                HStack {
                    Text("       Relevant Coursework: \(me.course1), \(me.course2), \(me.course3)")
                    Spacer()
                }
            }
            
            Spacer()
            
            Group {
                HStack {
                    Text("  EXPERIENCE ")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                
                HStack {
                    Text("      \(me.e1title) ")
                        .bold()
                    Spacer()
                    Text(" \(me.e1company)    ")
                        .bold()
                }
                
                HStack {
                    Text("      From \(me.e1start) - \(me.e1end)")
                    Spacer()
                }
                
                HStack {
                    Text("          -  \(me.e1detail1) ")
                    Spacer()
                }
                
                HStack {
                    Text("          -  \(me.e1detail2) ")
                    Spacer()
                }
                
                HStack {
                    Text("          -  \(me.e1detail3) ")
                    Spacer()
                }
            }
            
            Group {
                HStack {
                    Text("      \(me.e2title) ")
                        .bold()
                    Spacer()
                    Text(" \(me.e2company)    ")
                        .bold()
                }
                
                HStack {
                    Text("      From \(me.e2start) - \(me.e2end)")
                    Spacer()
                }
                
                HStack {
                    Text("          -  \(me.e2detail1) ")
                    Spacer()
                }
                
                HStack {
                    Text("          -  \(me.e2detail2) ")
                    Spacer()
                }
                
                HStack {
                    Text("          -  \(me.e2detail3) ")
                    Spacer()
                }
            }
            
            Spacer()
            
            HStack {
                Text("  PROJECTS ")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            
            
            Group {
                HStack {
                    Text("      \(me.p1name) ")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("      \(me.p1title) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p1detail1) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p1detail2) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p1detail3) ")
                    Spacer()
                }
            }
            
            Group {
                HStack {
                    Text("      \(me.p2name) ")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("      \(me.p2title) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p2detail1) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p2detail2) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p2detail3) ")
                    Spacer()
                }
            }
            Spacer()
        }
    }
    
//    var body: some View {
//
//        VStack {
//            realView
//            Button("Save to image") {
//                let image = realView.snapshot()
//                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//            }
//        }
//    }
}
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}


// //////////////////////
//Vibha Template View ///
// //////////////////////
struct VibhaView: View {
    @EnvironmentObject var me: myInfo
    var body: some View {
        VStack {
            Group {
                HStack {
                    Spacer()
                    
                    Text(" \(me.name) ")
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text(" \(me.phone)  ")
                                .font(.caption)
                        }
                        
                        Text(" \(me.email)  ")
                            .font(.caption)
                        
                        Text(" \(me.linkedIn) ")
                            .font(.caption)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Text("  Education ")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                HStack {
                    Text("       \(me.school) | \(me.startSchool) - \(me.endSchool ) | GPA: \(me.gpa)")
                    Spacer()
                }
                
                HStack {
                    Text("       Major: \(me.major)")
                    Spacer()
                }
            }
            
            Spacer()
            
            Group {
                HStack {
                    Text("  Experience ")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                
                HStack {
                    Text("      \(me.e2title)   |   \(me.e2company)")
                        .bold()
                    Spacer()
                }
                
                HStack {
                    Text("      \(me.e2start) - \(me.e2end)")
                    Spacer()
                }
                
                HStack {
                    Text("          •  \(me.e2detail1) ")
                    Spacer()
                }
                
                HStack {
                    Text("          •  \(me.e2detail2) ")
                    Spacer()
                }
            
            }
            
            Spacer()
            
            HStack {
                Text("  Projects ")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            
            
            Group {
                HStack {
                    Text("      \(me.p1name) ")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("          •  Link: \(me.p1detail1) ")
                    Spacer()
                }
                HStack {
                    Text("          •  \(me.p1detail2) ")
                    Spacer()
                }
                HStack {
                    Text("          •  \(me.p1detail3) ")
                    Spacer()
                }

            }
            
            Group {
                HStack {
                    Text("      \(me.p2name) ")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("          •  Link: \(me.p2detail1) ")
                    Spacer()
                }
                HStack {
                    Text("          •  \(me.p2detail2) ")
                    Spacer()
                }
                HStack {
                    Text("          •  \(me.p2detail3) ")
                    Spacer()
                }
            }
            Spacer()
        }
        
        Group {
            HStack {
                Text("  Skills ")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            HStack {
                Text("  \(me.skill1) | \(me.skill2) | \(me.skill3) | \(me.skill4) | \(me.skill4)")
                Spacer()
            }
        }
    }
    
}


// //////////////////////
//Vivian Template View //
// //////////////////////
struct VivianView: View {
    @EnvironmentObject var me: myInfo
    
    //private let items: [String] = ["A", "B"]
    //private let columnCount: Int  = 3
    
    //let theWords = ["EDUCATION", "ABOUT ME"]
        
    //let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    /*private var twoColumnGrid = [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    ScrollView {
        LazyVGrid(columns: twoColumnGrid) {
            // Display the item
        }
    }*/

    var body: some View {
        Text(" \(me.name) ")
            .bold()
            .font(.title)
        //**** TODO: create template view
        // use me.<variable name> from the variables above in class myInfo to capture what the user put in profile
        //ScrollView(.vertical) {
            
            
            /*let count = self.items.count
            let rowCount = (Double(count) / Double(self.columnCount)).rounded(.up)
            ForEach(0...<Int(rowCount)) { row in
                Spacer(minLength: 0)
                HStack(spacing: 8) {
                    ForEach(0...<self.columnCount) { column in
                        let index = row * columnCount + column
                        if index < count {
                            Text(self.items[index]).frame(maxWidth: .infinity)
                        } else {
                            Spacer().frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        } .frame(maxWidth: .infinity)*/
            
        /*LazyVGrid(columns: columns) {
            ForEach(theWords, id: \.self) { word in
                Text(word)
            }
        }*/
        
        /*var lineView = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        myInfo.addSubview(lineView)*/
        
        /*let line = UIView()
        view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        line.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 20).isActive = true
        line.backgroundColor = .gray*/
        
        /*UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(x, y, 320, 1)];
        separator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        [self.view addSubview:separator];
        [separator release];*/
            
        
       
        
        VStack {
            Divider().background(Color.black).frame(width: 350)
        }
        
        HStack {
            Text("  ABOUT ME ")
                .bold()
                .font(.title2)
            Spacer()
        }
        
        VStack {
            Group {
                HStack {
                    Spacer()
                    
                    Text(" \(me.linkedIn) ")
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text(" \(me.email)  ")
                                .font(.caption)
                        }
                        
                        Text(" \(me.website)  ")
                            .font(.caption)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Text("  EDUCATION ")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                HStack {
                    Text("       \(me.school) ")
                    Spacer()
                }
                
                HStack {
                    Text("       Expected Graduation: \(me.startSchool), \(me.endSchool)")
                    Spacer()
                }
                
                HStack {
                    Text("       Major: \(me.major)")
                    Spacer()
                }
                
                HStack {
                    Text("       GPA: \(me.gpa)")
                    Spacer()
                }
                
                HStack {
                    Text("       Extracurriculars/Awards: \(me.clubs), \(me.awards)")
                    Spacer()
                }
            }
            
            Spacer()
            
            Group {
                HStack {
                    Text("  SKILLS ")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                
                HStack {
                    Text("          •  \(me.skill1) ")
                        .bold()
                    Spacer()
         
                }
                

                
                HStack {
                    Text("          •  \(me.skill2) ")
                    Spacer()
                }
                
                HStack {
                    Text("          •  \(me.skill3) ")
                    Spacer()
                }
                
                HStack {
                    Text("          •  \(me.skill4) ")
                    Spacer()
                }
                
                HStack {
                    Text("          •  \(me.skill5) ")
                    Spacer()
                }
            }
            
            
            Spacer()
            
            HStack {
                Text("  PROJECTS ")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            
            
            Group {
                HStack {
                    Text("      \(me.p1name) ")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("      \(me.p1title) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p1detail1) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p1detail2) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p1detail3) ")
                    Spacer()
                }
            }
            
        
            HStack {
                Text("  WORK EXPERIENCE ")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            
            Group {
                HStack {
                    Text("      \(me.p2name) ")
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("      \(me.p2title) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p2detail1) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p2detail2) ")
                    Spacer()
                }
                HStack {
                    Text("          -  \(me.p2detail3) ")
                    Spacer()
                }
            }
        }
        
        Spacer()
    }
}
