From: Jonathan Oppenheim <jono@Phys.UAlberta.CA>
Date: Tue, 04 Apr 2000 00:03:04 +0000
Subject: Recording with anything?
Message-Id: <marc-linux-sound-95480718509450@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

i cannot record anything, although no trouble
hearing sound through both the mike and line in.

no program seems to want to bother even trying to record.

for example, SLAB, just sits there, with the counter stopped
at 0 after pushing the REC PAUSE and then the PLAY button.
I can hear myself play, but it makes no attempt to record any sound.

Likewise, using kvoice, i push record, in the new greeting dialogue
box, and the new greeting message window just disappears, and that's it.

i also try typing "dd bs=8k cound=4 </dev/audio > sample.au"

this creates the file sample.au but the file is empty
(at least, i see nothing when i type "more sample.au" or "kedit
sample.au", but it must have something in it, because it is 32768 bytes
long)

i have a soundblaster live! card, under mandrake 7.0
when i configured the card (using sndconfig) it found
the card without any problem.

perhaps an interupt problem??

any help would be appreciated.

thanks,
jonathan
