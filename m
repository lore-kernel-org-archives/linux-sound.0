From: Paul Barton-Davis <pbd@Op.Net>
Date: Mon, 01 May 2000 00:48:59 +0000
Subject: Re: [alsa-devel] Re: midi controllers + laptop
Message-Id: <marc-linux-sound-95714255003960@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95714240903878@msgid-missing>
In-Reply-To: <marc-linux-sound-95714240903878@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>/dev/midi00 behaves like a std serial device except athat it runs 
>always at 31250bps.

not true. /dev/midiNN does not support any (or certainly not most) of
the serial-specific ioctl's that can be used to configure a real
serial port. i've seen some amazing code that attempt to set the
VBREAK character for the MIDI port :) duh ...

also, the buffering of the OSS /dev/midi device is completely
different from that done by the serial driver. its also not very good :)

as ever: use ALSA.

--p
