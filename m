From: Brian Sanderson <brian@ccat.co.uk>
Date: Thu, 06 Jan 2000 10:52:15 +0000
Subject: Genius SoundMaker
Message-Id: <marc-linux-sound-94715559206285@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Help!

I have recently installed Red Hat 6.0 (kernel version 2.2.5-22) as a duel
boot system alongside Windoze 95 on an Intel PC.

I can get everything working except the soundcard (which works perfectly
well under 95).

The card is a 'Genius SoundMaker', the drivers supplied for Windoze are
'Yamaha OPL3-SAx Sound System' which seems to work quite nicely.

When I try to use sndconfig it probes for the card then reports,

+--------------PnP Probe Results-------------+
| A PnP sound card was found in your   |
| system. The details are:                     |
|      Model: OPL3-SAX Sound Board     |
+-------------------------------------------------------+

When I first ran sndconfig, the next step tried to play a sound but nothing
came out of the speakers.
When I told sndconfig that I had not heard the sound it allowed me to change
values and try again, however the values looked correct (as far as I could
see) and no matter what I tried to change nothing made any difference.

However, now when I attempt to run sndconfig when I press OK to dismiss the
PnP Probe Results box shown above sndconfig locks up. I cannot do anything
to stop it, I can switch to another virtual terminal but cannot type
anything into it. The only way I can get out of it is to reset the PC.

My questions are,

1) How can I remove the settings already saved so I can start from a clean
sheet, what files do I need to edit/remove?

2) Has anyone heard of or had any experience with this kind of card before?

Any help will be greatly appreciated.

Brian Sanderson.
