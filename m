From: Kevin Page <krp@ecs.soton.ac.uk>
Date: Thu, 14 Jun 2001 21:49:36 +0000
Subject: es1371 microphone volume problems
Message-Id: <marc-linux-sound-99255566711868@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi,

I've done a bit of trawling around, and it seems quite a few people
have had problems with 'no sound' with the es1371 (in this case a SB
PCI128), but I couldn't find a solution.

I'm running linux 2.4.2 with redhat mods (i.e. stock RH7.1). The sound
input is fine under windows.
At first I thought there was no sound input through the microphone at
all, but then I found if I tapped the mic (prety hard) then that got
picked up - but certainly nothing if I were speaking.

Then I played around with the mixer, and if I put the mic level, IGain
and then main volume (for playback) up to their maximum values I could
just make out recorded speech from the mic - but it was still pretty
quiet.

Do I have any chance of getting this to work properly? (The main
volume's a bit high for everyday use ;)
I saw that the es1370 had a micgain option, but the es1371 doesn't -
could it be the same sort of problem?

Regards,

kev

-- 
Kevin Page                         Intelligence, Agents, Multimedia
+44 (0) 23 80594490                Electronics and Computer Science
krp@ecs.soton.ac.uk                   University of Southampton, UK

-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
