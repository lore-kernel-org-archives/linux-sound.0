From: Paul Barton-Davis <pbd@Op.Net>
Date: Sun, 29 Aug 1999 07:34:41 +0000
Subject: Re: [alsa-devel] Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults
Message-Id: <marc-linux-sound-93591224029231@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Linus wrote:

>Guys, if anybody thinks we're competing with BeOS, then wake up. BeOS is a

last i heard, we weren't "competing" with anyone. we were trying to
write a really really good OS. 

BeOS is unique in that its the first vaguely stable OS to be designed
with multimedia in mind from the ground up. there are those of us who
see computing technology as either currently or very soon delivering
the power to do things with audio and video that have been hard to do
without special purpose hardware as little as two years ago. right
now, linux is not the right platform for doing this, and BeOS is, and
I don't like that.

there is persistent denial on l-k and elsewhere that an OS designed to
effectively support "traditional" computer usage (compilation, number
crunching, data serving) has any fundamental differences from one
based around, say, real-time audio generation & manipulation.

i doubt that this is true, but burying our heads in the sand won't
change the answer one way or another. i personally suspect that the
only reason BeOS has a niche *at all* is (1) because its true that there
is a difference and (2) because there are companies out there who
would like to develop for something better than Win/Mac and are scared
to do the linux^H^H^H^H^Hright thing.

it would be very nice to be able to compile linux with options that
say, in essence: "this is a mostly single-user box with little or no
network use, not much disk I/O that really benefits from a smart
filesystem, and regular use of soft-real-time tasks that want to take
over the machine if at all possible."

this is a profile that has a very different emphasis from many of the
things that kernel folks are working on supporting. to dismiss this
kind of system as a "niche" is to potentially miss a broad wave in
computing usage over the next decade or so. IMHO.

>niche OS that isn't worth competing against, and at most we can try to
>find out what it's good at and see if we can emulate some of it. But 25%

"emulate" ? i'd rather we copy it and/or do it better.

>disk IO decrease is definitely not something we want to even consider.

oh come on linus - nobody has gotten close to suggesting that its an
acceptable change! benno was merely observing the current status of
things. i strongly suspect that victor's "tunable parameter"
suggestion could solve quite a bit of the difference.

--p
