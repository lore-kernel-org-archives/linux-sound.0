From: Paul Barton-Davis <pbd@Op.Net>
Date: Tue, 26 Oct 1999 17:11:35 +0000
Subject: Re: [linux-audio-dev] External MIDI Sync using OSS/Free
Message-Id: <marc-linux-sound-94095789529102@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>  My sequencer (http://www.div8.net/ttrk) mainly runs off of external MIDI
>sync, and drives a mess of synths and stuff.  I use /dev/sequencer for
>MIDI input and output.

advice #1: do not use /dev/sequencer

two reasons. it doesn't exist in ALSA, which will (soon-ish) be the
default sound driver system for Linux. but more importantly, its a
horrible system. i won't list the problems with it here, but there are
many. 

instead, just let the user specify the MIDI device files to use, and
then use them as "raw" read(2)/write(2) files. this works with OSS,
ALSA, Solaris and a number of other systems. then do most of your
timing stuff at user level. i don't know what your resolution needs to
be, but my "analog MIDI sequencer" program SoftWerk does all its
timing in user space (it has too - it doesn't know what to send to the
MIDI interface until its actually time to send it) and is accurate
down to about 20ms without any special priviledges. it can get a lot
more accurate than that if it needs to. OTOH, SoftWerk is an "old
school" sequencer, from back before the days of the first digital
sequencers. it has a fixed number of event steps per fixed number of
event steps, which is not what most people these days mean by "sequencer".

advice #2: if you really have external MIDI sync (do you mean MIDI clock,
or other stuff ?), then just use that to provide timing for your
application. if you have sensible hardware for your MIDI interface,
then your application will be woken up very rapidly (at least if it
runs SCHED_FIFO) after the MIDI clock byte (or any other MIDI message)
is ready to read.

if you don't have external clock, then you'd be better off using the
real time clock for timing. 

advice 3: install ALSA, and use the ALSA sequencer. its a vastly more
evolved kernel sequencer system, though its still going through some
beta-testing. we would welcome your involvement in that process.

>  Is there a way that I could do this more efficiently?  Since my app
>might not get swapped in until late after the start arrived, and then I
>have to call the ioctl.  This error then remains for the entire duration
>of the song.

use SCHED_FIFO if you can. the only downside is that it does require
that either your program, or a "helper/starter" program run setuid
root. this will reduce to the delay between your program being "ready
to run because MIDI data is available" and "running" to a virtually
insignificant time.

--p
