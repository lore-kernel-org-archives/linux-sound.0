From: yodaiken@chelm.cs.nmt.edu
Date: Mon, 30 Aug 1999 05:17:11 +0000
Subject: Re: [alsa-devel] Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults
Message-Id: <marc-linux-sound-93599368910847@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93591224029231@msgid-missing>
In-Reply-To: <marc-linux-sound-93591224029231@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, Aug 29, 1999 at 10:24:10PM -0400, Paul Barton-Davis wrote:
> Victor "Not Really A Curmudgeon" Yodaiken writes:

What's this "not really"? 

> absolutely. and DOS is a pretty reasonable platform for developing the
> kind of audio applications i am interested in these days, except that
> it lacks 90% of the desired environment as the price of letting me
> take over the machine when i need to. but yeah, DOS is great: its just
> an extended interrupt handling mechanism, and as such, rarely, if
> ever, gets in the way when its not supposed to.

Ok. So why don't you like RTLinux again?

> >I never see any published data on BeOS benchmarks so it's hard to evaluate.
> >But there are some obvious problems with the OS in terms of 
> >(A) hard rt response (none) (B) high speed networking (not) (C) high
> >bandwidth disk io ...
> 
> (A) mostly irrelevant for real-time audio generation/processing if soft rt
>     response is good

So you  don't want to control tape drives, sample mics, and do other
audio that requires precise timing?

> (B) irrelevant for RT-AG/P
No networked audio systems? Plan ahead.


> (C) not needed (low bandwith is adequate) for RT-AG/P

Streaming video. Or capture of high speed data acquisition.

>      generate 32 samples
>      read 32 samples from an A/D converter
>      do some math with the 32 read samples
>      mix the generated and read samples together
>      send them to a D/A converter
>      sleep for 0.5ms
> 
> then i'd like it to work under Linux without worrying that:

Easy as pie in RTL.

> Why do I want to use Linux (or any OS) ? Because no application that
> does this runs all the time; because developing this application has
> taken me 6-7 man-months already and that time involves a continual
> cycling between development and running of the current result; because
> i don't want to have write my own window system, file system, etc. etc.

Exactly. But you also want to rule out the working solution and want to 
believe that BEOS will be a working solution. In my humble opinion, BeOS
will fail to deliver in the long term precisely because its kernel 
design is more suited to 1980s Mac applications than to 2000+ mutlimedia
which will need to connect multimedia to big fast databases, complex
networks, and sophisticated i/o systems.

> 
> --p
