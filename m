From: Paul Barton-Davis <pbd@Op.Net>
Date: Wed, 08 Sep 1999 15:18:36 +0000
Subject: Re: [alsa-devel] Re: MidiShare and ALSA sequencer
Message-Id: <marc-linux-sound-93680330520444@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93679717712022@msgid-missing>
In-Reply-To: <marc-linux-sound-93679717712022@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>> So if I understand correctly, patched Linux has good RT guarantees for
>> user-space interrupt latency (witnessed by Benno's blocking write()s);
>> the trouble for timer-driven tasks is that there's no interrupt coming
>> in at the desired time.
>> 
>> Then a select() has good timing when it wakes up on a fd, but not on
>> timeout?  So a software synthesizer, including one driven by MIDI,
>> ought to do well, but a sequencer loses.
>
>
>This seems rather inconsistent to me that one is able to get good
>timing by waking up on the soundcards interrupt, but not by setting
>precise timers. (greater than 10ms precison)

the soundcard interrupt *is* a precise timer. It can interrupt every
1/(fragmentsize*samplerate) secs, which can be as little as 0.6usecs
with a 32 sample fragment size @ 48KHz.

I am not sure what you mean by "inconsistent": there is no
inconsistency here - interval timing in any contemporary computer is
based on interrupts and/or a clock crystal+register. The system timer
interrupts every 1/HZsecs, and so you cannot get better interval
timing than 1/HZ intervals from anything that relies on the system
timer. If something else can generate interrupts at a faster rate,
then it can cause tasks to wake up more frequently.

>(One solution of an audio/MIDI sequencer could be to base the MIDI timing
>on the PCM audio interrupts (using short fragments to get msec precision)
>plus checking the TSC counter to get more accurate MIDI timing,
>but this is not as elegant as UTIME) 

not at all elegant: much of the time that I am using SoftWerk, I am
not using the PCM capabilities of a soundcard at all (I'm driving
external sound generation equipment) and so there would be no
interrupts. If SoftWerk opened the PCM device to activate the
interrupts, it has essentially stolen the capability to control that
device from another program, and since SoftWerk doesn't need any PCM
capabilities, this is really silly.

>The KURT people showed that UTIME has little overhead
>and the time-drift (over a day) is comparable to the standard-timer.
>
>Does anyone know the reasons because the UTIME patches
>can't be included in the kernel ?

Linus doesn't like their design. He is quite happy with the idea, but
felt that they messed up some aspects of the patch. This was the last
I read, anyway.

>With the low-latency patches + UTIME patches in the mainstream kernel , as a
>userspace RT programmer I would be very happy.

moi aussi.

--p
