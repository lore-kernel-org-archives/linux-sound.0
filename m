From: "'Terra NovA' B. Loeding" <bloeding@u.washington.edu>
Date: Tue, 20 Oct 1998 08:29:50 +0000
Subject: soundcard confusion
Message-Id: <marc-linux-sound-90887944325515@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Ok. First question. I've got a SB Awe64PCI.
What is the difference between the es1370 driver
and the es1371 driver?

Well, I compiled the es1370 driver into my kernel
and I have sound... kind of. I can play audio CD's
fine but the volume is so low I can barely hear it.
The same goes for sound samples but I also find a
large drop in sound quality too.

In the es1370.c file it says the only supported devices
are /dev/dsp, /dev/dsp1, /dev/mixer, and /dev/midi.
But I get zero output from /dev/dsp. Its only under
/dev/dsp1 that I get any sound, which is the lineout I
believe.

So I'll just start throwing out questions:
What's the difference between /dev/audio and /dev/dsp?
Why do most command line sound programs want to output
to /dev/audio by default?
Why I'm I not getting any sound from /dev/dsp?
Why is the lineout channel (dsp1) so low on volume?
How do I tell the es1370 driver to have the joystick port
ON by default?
How do I use /dev/midi? Nothing seems to work.

Thanx.
