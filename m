From: Stephen Landamore <stephenl@arcam.co.uk>
Date: Tue, 08 Jun 1999 14:18:38 +0000
Subject: Call for help - finishing sound card driver
Message-Id: <marc-linux-sound-92885065001468@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings,

Over the past few months we have been working on a GPL'd linux device
driver for a professional soundcard (with cooperation from the
manufacturers). We are now at the stage where we have some very alpha
code, which we have used to successfully record and playback audio.

The card in question is an emagic audiowerk8; it is a PCI card based
on a Philips SAA7146 multimedia chipset. It has: 2 analogue (mono)
inputs; 8 analogue (mono) outputs; S/PDIF in and out, with
programmable sample rate. It does not have: MIDI; synthesizer; mixer
or game port.


At this stage, we are specifically looking at how to best integrate
with the rest of the linux sound system. In particular, how to assign
/dev entries (/dev/audio1 /dev/audio2 etc), bearing in mind the large
number of channels the card supports! (also, multiple cards can be
daisy-chained to give lots more - synchronised - channels).

Are there any other cards (with linux drivers) which support such a
large number of channels? How does the device 'numbering' scheme work
with such cards? The underlying hardware actually splits the 8+2
channels into three DMA channels - one DMA for input and two DMAs for
output, with the channels being multiplexed.


From postings to linux-kernel I hear talk of the OSS code being
replaced with ALSA code. In what way will this impact the work we are
doing? (So far we have not specifically coded for any sound subsystem,
simply concentrating on getting the driver functional)

At this stage, we have been developing for the 2.2.x series; is it
advisable to switch to 2.3.x for future development? (We would prefer
to stick to 2.2.x for the immediate future!)

And finally, I guess we'd like some of you sound gurus out there to
take a look, and peer review what we've done so far!


Comments, advice and feedback are welcomed...

thanks in advance,
stephen
