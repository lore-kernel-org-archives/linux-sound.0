From: Paul Barton-Davis <pbd@Op.Net>
Date: Mon, 01 May 2000 00:46:14 +0000
Subject: Re: [alsa-devel] Re: midi controllers + laptop
Message-Id: <marc-linux-sound-95714240903878@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>ALSA folks, would it be possible to redirect the ALSA sequencer
>output to a serial MIDI device ? If yes what are the right
>steps to do this ?

best way: write a kernel module that sets itself up as a client of the
sequencer. The module is simple: it just forwards the data (post
transformation from sequencer events to actual MIDI) on to the real
serial driver for the serial MIDI interface. Its not obvious how to do
this at first sight, but I recall find examples of other "pseudo
drivers" in the kernel that do such forwarding.

easiest way: write a user-space app that registers as a client of the
sequencer and forwards all data (post-transformation from sequencer
events to actual MIDI) to an open file descriptor that results from
opening the serial MIDI device.

'nuff said ?

--p
