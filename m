From: Paul Barton-Davis <pbd@Op.Net>
Date: Sat, 18 Sep 1999 22:44:05 +0000
Subject: Re: [alsa-devel] Re: Bad MIDI performance : 10ms latency instead of the expected 1-1.5ms
Message-Id: <marc-linux-sound-93769443822861@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93571438020118@msgid-missing>
In-Reply-To: <marc-linux-sound-93571438020118@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>Im the only one that have problems with perfomance while receiving
>midi data ?  It is droping a lot of events. Oss don't drop so mush,
>but alsa is useless. Is it SMP problem ? Low irq responce times ? I
>have a SB PCI 128 and a hoontech and have the same problem with
>both. (The hoontech is only avalible with alsa driver)

I don't know if you're the only one, but certainly not all people with
the hoontech's have this problem, even with SMP systems. I have a
Hoontech 4D-NX and a Tropez+, and my MIDI response and functionality
is as good as any MIDI hardware makes possible. I lose no events, even
in the face of a lot of MIDI data transmission (e.g. a MIDI fader box
being actively manipulated at the same time as a MIDI h/w sequencer
and an external synth that sends active sense bytes every few msecs).

You may have a bigger potential problem right now in terms of quoting
irrelevant messages in their entirety and sending MIME-based mail to
various email lists which have a majority of members who don't like
it.

--p
