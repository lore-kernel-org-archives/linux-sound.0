From: yodaiken@chelm.cs.nmt.edu
Date: Sun, 29 Aug 1999 16:01:21 +0000
Subject: Re: [alsa-devel] Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults
Message-Id: <marc-linux-sound-93594564914404@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93591224029231@msgid-missing>
In-Reply-To: <marc-linux-sound-93591224029231@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, Aug 29, 1999 at 03:34:41AM -0400, Paul Barton-Davis wrote:
> BeOS is unique in that its the first vaguely stable OS to be designed
> with multimedia in mind from the ground up. there are those of us who

What does that really mean? MacOS is pretty good for multimedia
if that is all you want to do and you have simple multimedia.
Can you drive a robotic system, sampling sensors, driving a display,
operating a feedback control loop, and pulling data from a large
scale data base using Beos?  I doubt it. Beos offers low latency for
simple tasks, but DOS does that too.

> see computing technology as either currently or very soon delivering
> the power to do things with audio and video that have been hard to do
> without special purpose hardware as little as two years ago. right
> now, linux is not the right platform for doing this, and BeOS is, and

I never see any published data on BeOS benchmarks so it's hard to evaluate.
But there are some obvious problems with the OS in terms of 
(A) hard rt response (none) (B) high speed networking (not) (C) high
bandwidth disk io ...

> there is persistent denial on l-k and elsewhere that an OS designed to
> effectively support "traditional" computer usage (compilation, number
> crunching, data serving) has any fundamental differences from one
> based around, say, real-time audio generation & manipulation.


Specifics would be useful. We need a
multimedia component of lmbench.
