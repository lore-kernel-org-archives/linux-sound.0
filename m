From: Billy Biggs <vektor@DIV8.NET>
Date: Tue, 26 Oct 1999 18:49:44 +0000
Subject: Re: [linux-audio-dev] External MIDI Sync using OSS/Free
Message-Id: <marc-linux-sound-94096626707777@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94095789529102@msgid-missing>
In-Reply-To: <marc-linux-sound-94095789529102@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Paul Barton-Davis wrote:

> advice #1: do not use /dev/sequencer
[ solution, use /dev/midi* ]

  This is pretty useless IMHO.  My sequencer started off writing out
/dev/midi, and it was consistently off-sync.  Badly off sync.  Up to half
a second off sync.  I don't know if you have a significantly better box
than I do, but mine just puked.

  Oh yeah, and I got flamed real bad by diz. :)

  Trying to up the priority on the process helped significantly, but a
simple switch to /dev/sequencer let my app stay usermode and still be
reasonably responsive.

  I wish there were a better way to sync audio though, specifically sync
of audio to MIDI.  /dev/dsp has a crappy interface to this.  Does ALSA
provide any reasonable mechanism of syncing different inferfaces?

  In OSS, the clock between outgoing and incomming MIDI aren't the same.
In ALSA, I'd hope that would be fixed.  Does audio and sequencer also have
the same clock?

  What about syncing multiple soundcards?  I've found this to be next to
impossible under thud using OSS.

> advice 3: install ALSA, and use the ALSA sequencer. its a vastly more
> evolved kernel sequencer system, though its still going through some
> beta-testing. we would welcome your involvement in that process.

  I know that I should definitely look into this.  Promise I will.
Honest.

--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
