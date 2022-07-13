import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                MeetingFooterView(speakers:DailyScrum.sampleData[0].attendees.speakers , skipAction:{})
               
            }
        }
        .onAppear{
            scrumTimer.reset(lengthInMinutes:scrum.lengthInMinutes, attendees: scrum.attendees)
            scrum.timer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
