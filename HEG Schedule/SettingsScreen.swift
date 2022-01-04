//
//  SetupScreen.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 01.01.22.
//

import SwiftUI

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var displayName: String {getInfo("CFBundleDisplayName")}
    public var language: String {getInfo("CFBundleDevelopmentRegion")}
    public var identifier: String {getInfo("CFBundleIdentifier")}
    public var copyright: String {getInfo("NSHumanReadableCopyright").replacingOccurrences(of: "\\\\n", with: "\n")}
    
    
    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    public var appVersionShort: String { getInfo("CFBundleShortVersion") }
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
}

struct SettingsScreen: View {
    // MARK: following Code gets the Userdefaults from UserSettings.swift
    @ObservedObject var userSettings = UserSettings()
    

    // About section variables -> 'ÜBER DIE APP'
    let appversion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
    
    var body: some View {
        VStack {
                   Form {
                       Section(header: Text("NUTZERPROFIL")) {
                           TextField("Benutzername", text: $userSettings.username)
                           Picker(selection: $userSettings.course, label: Text("Klasse")) {
                               ForEach(userSettings.courses, id: \.self) { course in
                                       Text(course)
                                   }
                               }
                       }
                       Section(header: Text("ÜBER DIE APP")) {
                           HStack {
                               Text("Version")
                               Spacer()
                               Text(Bundle.main.appVersionLong)
                           }
                           HStack {
                               Text(Bundle.main.copyright)
                                       .font(.system(size: 10, weight: .thin))
                                       .multilineTextAlignment(.center)
                           }
                       }
                   }
               }.navigationTitle("Einstellungen")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
