From: Josh Estelle <jje7@cornell.edu>
Date: Wed, 03 May 2000 15:00:56 +0000
Subject: sndconfig.. and something chewing up resources
Message-Id: <marc-linux-sound-95736719011682@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I recently reinstalled my whole system, using RedHat 6.2.

In past installs I have always recompiled my kernel to gain sound card
support for my Crystal Audio card.  This time I had heard about this
until 'sndconfig' that came with RedHat so I decided to try it.  It
worked slickly and now I've got sound.  But it appears to be doing sound
using some daemons of sorts, ksoundaemon, esd?, kaudio, something like
those... and it seems when I run anythign else that is at all processor
intensive my sound playback gets coppy or drops out and does funny
stuff.  I figure I'm just going to recompile my kernel and do it the old
way and see if the problem persists.  Anyone have any ideas on what's
going on?

My machine is a Dell Optiplex, 400mhz, 128MB ram..

Josh


-- 

"You can be my Yoko Ono... You can follow me wherever I go..."

 - Barenaked Ladies
