From: Paul Barton-Davis <pbd@Op.Net>
Date: Mon, 30 Aug 1999 18:34:44 +0000
Subject: Re: [alsa-devel] Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults
Message-Id: <marc-linux-sound-93603885621594@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93591224029231@msgid-missing>
In-Reply-To: <marc-linux-sound-93591224029231@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>Ok. So why don't you like RTLinux again?

Because its not Linux, and I don't want to write code for people that
comes with the proviso: you must run RTLinux, not Linux.

I freely admit that its not a very good reason, and if David Olofson's
work on a driver interface for RTLinux works out, I will most likely
change my mind, since it will make all kinds of things possible.

>So you  don't want to control tape drives, sample mics, and do other
>audio that requires precise timing?

they don't require the kind of timing that depends on the OS. the
timing comes from the DAC clock (or in some good cases, from an
external word clock source), and the point is to be able to sync
to that reliably, without the OS interfering. I don't want the OS
trying to do microsecond timing control of another piece of hardware.
its a nightmare. its bad enough that the DAC clock itself suffers from
jitter - introducing the OS as another source of this would be nasty.

when you control a tape drive you tell it where to go to, and it goes
there. when you control a sample mic, you typically collect more
information than you need, and edit it non-real-time. when you control
other hardware, you typically issue it with commands and/or a clock source.

>> (B) irrelevant for RT-AG/P
>No networked audio systems? Plan ahead.

Nope. For the kinds of applications that interest me, the latency for
any network will be unacceptable for a long, long time. Not the
bandwidth, just the latency. Can you show me any network hardware that
has 0.02ms (1 sample at 48KHz sampling) latency for "first packet in a
while" ?

>> (C) not needed (low bandwith is adequate) for RT-AG/P
>
>Streaming video. Or capture of high speed data acquisition.

I know. Thats why I said "for RT-AG/P"

>> Why do I want to use Linux (or any OS) ? Because no application that
>> does this runs all the time; because developing this application has
>> taken me 6-7 man-months already and that time involves a continual
>> cycling between development and running of the current result; because
>> i don't want to have write my own window system, file system, etc. etc.
>
>Exactly. But you also want to rule out the working solution and want to 

I don't want to rule out RTLinux. I just don't want a solution
(RTLinux or BeOS) that isn't the fastest growing, best supported and
always improving OS available.

>believe that BEOS will be a working solution. In my humble opinion, BeOS

I could care less about BeOS, which I don't really want to use. All I
care about are the performance characteristics it is aiming for.

>design is more suited to 1980s Mac applications than to 2000+ mutlimedia
>which will need to connect multimedia to big fast databases, complex
>networks, and sophisticated i/o systems.

Yes, and those kinds of multimedia applications will be (very?)
well-served by Linux.

However, real-time audio generation (*not* playback, generation) and
processing isn't going down that pathway, not until we get another
order of magnitude speed up from basic I/O subsystems and probably
CPU's as well, not to mention huge improvements in network
latency. The idea of pulling samples from an Oracle database because
someone just sent MIDI NoteOn messages to us, and then sending it over
the a network to another machine: no, I don't think so.

--p
