From: Paul Barton-Davis <pbd@Op.Net>
Date: Thu, 28 Oct 1999 15:59:44 +0000
Subject: Re: [linux-audio-dev] Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94113791209316@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


>Of course I agree, that you are not forced to run the audio server
>all the time.  Do you remember the discussion some time ago ?  "the
>client can access the device directly or use the audio server" "the
>client can do his own plugin hosting, or delegate the hosting to the
>audio server"
>
>In the case of the timer I'd opt for a similar solution.
>
>( note that in my case the rtcd is a subsystem of the audio (or better
>multimedia) engine )

thats my problem. the services offered by Eric's proposed rtcd are at
a level *below* those offered by the system we've talked about. that
is, the functionality derived from using the RTC is something that
might be used by a multimedia server (which, BTW, is very importantly
NOT the same thing as an engine) *and* an application which doesn't
use the server at all. simultaneously.

take a system in which, say, Quasimodo was running through the server
or was the server and SoftWerk ran along side it. SoftWerk doesn't
talk to the audio h/w at all, but it wants timing from the RTC. the
server might want timing from the RTC. a 3rd program runs and wants to
to use the RTC for something completely non-audio related.

in these kinds of situations, you don't want to have merged RTC
service into an "multimedia server" - someone who wants to use the RTC
for something completely different is going to be unhappy at being
forced to connect to the multimedia server if the server is running
(and thus owns the RTC).

that's why I think that the RTC *must* be considered a standalone
system utilized either by a single (greedy) application, or by a
server *that does nothing else* but distribute timing info to clients.

>IMHO the advantage to integrate the rtcd into the multimedia engine
>(which of course works on machines without soundcards) , is that 
>the system can optimize things when multiple timer sources are available.

you can still do this: rtcd is, in your words, just another timer source.

>We could even provide a way where the client "hosts" the timer in his own
>thread, (like by your SIGIO notification), or by simply providing an RTC
>wrapper, but with an uniform API.
>That means if you run your Softwerk sequencer standalone (using the MIDI
>device / timers  directly  (in this case the timer is managed though the
>wrapper) ) ,

yuck. just have everyone use the daemon or the device itself if there
is no daemon, and we have an even more flexible situation. surely ?

--p
