From: Paul Barton-Davis <pbd@Op.Net>
Date: Mon, 30 Aug 1999 02:24:10 +0000
Subject: Re: [alsa-devel] Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults
Message-Id: <marc-linux-sound-93597903902462@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93591224029231@msgid-missing>
In-Reply-To: <marc-linux-sound-93591224029231@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Victor "Not Really A Curmudgeon" Yodaiken writes:

>What does that really mean? MacOS is pretty good for multimedia
>if that is all you want to do and you have simple multimedia.
>Can you drive a robotic system, sampling sensors, driving a display,
>operating a feedback control loop, and pulling data from a large
>scale data base using Beos?  I doubt it. Beos offers low latency for
>simple tasks, but DOS does that too.

absolutely. and DOS is a pretty reasonable platform for developing the
kind of audio applications i am interested in these days, except that
it lacks 90% of the desired environment as the price of letting me
take over the machine when i need to. but yeah, DOS is great: its just
an extended interrupt handling mechanism, and as such, rarely, if
ever, gets in the way when its not supposed to.

>I never see any published data on BeOS benchmarks so it's hard to evaluate.
>But there are some obvious problems with the OS in terms of 
>(A) hard rt response (none) (B) high speed networking (not) (C) high
>bandwidth disk io ...

(A) mostly irrelevant for real-time audio generation/processing if soft rt
    response is good
(B) irrelevant for RT-AG/P
(C) not needed (low bandwith is adequate) for RT-AG/P

>> there is persistent denial on l-k and elsewhere that an OS designed to
>> effectively support "traditional" computer usage (compilation, number
>> crunching, data serving) has any fundamental differences from one
>> based around, say, real-time audio generation & manipulation.

>Specifics would be useful. We need a
>multimedia component of lmbench.

i don't know what kind of specifics you want, but i'd like to be able
to write a program that, despite running on a multitasking, multiuser
OS like Linux, can plan on basically having access to the same
hardware performance characteristics as if it were running without an
OS. 

That is, if I have an loop that wants to do this:

     generate 32 samples
     read 32 samples from an A/D converter
     do some math with the 32 read samples
     mix the generated and read samples together
     send them to a D/A converter
     sleep for 0.5ms

then i'd like it to work under Linux without worrying that:

     (1) the 32 samples will take more than 32*1/sampling-rate secs to
         generate (assuming that this is theoretically possible given
         the nature of the computation involved and the CPU speed).
     (2) that reading 32 samples from the A/D converter will take
         longer than the actual transfer time.
     (3) that writing 32 samples to the D/A converter will take
         longer than the actual transfer time
     (4) that i might sleep for too long

The above numbers are reasonable, but not necessarily the ones to
use. 

Why do I want to use Linux (or any OS) ? Because no application that
does this runs all the time; because developing this application has
taken me 6-7 man-months already and that time involves a continual
cycling between development and running of the current result; because
i don't want to have write my own window system, file system, etc. etc.

--p
