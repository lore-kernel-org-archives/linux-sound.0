From: Abe Smith <abe@execpc.com>
Date: Thu, 03 Jun 1999 20:38:30 +0000
Subject: SB16 problems..
Message-Id: <marc-linux-sound-92846322523845@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I run RH5.2 and have an old SB16 (_not_ PNP)
I've been having some interesting problems and am not sure wether they
are software or hardware induced, or both...

1. If the sound card is installed, the machine hangs indefinately if
I /sbin/reboot (ie, ctrl-alt-del), this does NOT happen if I boot
cold (ie shutdown, cut power, boot again)

2.  I can play pretty much everything (real-audio, .au, .wav, .mp3 etc)
except MIDI, but to the best of my knowledge, all the necessary
configurations and such are okay.

3.  If I play mp3 files with x11amp from a cdrom, it will hang the machine
somehwere around half-way through the first track...  I suspected some
DMA, IRQ or other such conflict, but according to all the
documentation and setting I could find, there are no conflicts..

any hints?  or should I just find a 32 or 64 somewhere?
I wouldn't care so much about it, but since I'm getting interested in
composition, I really need some sort of midi support, whether TiMidity
with the 16 or something more, uhh, "real" 


-- 
Abraham D. Smith  <abesmith@execpc.com>   Wisconsin, USA
--------------------------------------------------------
