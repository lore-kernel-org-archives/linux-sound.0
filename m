From: David Olofson <audiality@swipnet.se>
Date: Fri, 17 Sep 1999 17:37:32 +0000
Subject: Re: [alsa-user] Re: latencytests results on a Pentium133, again EXCELLENT, 2.1ms.:-)
Message-Id: <marc-linux-sound-93759408726325@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93756643831266@msgid-missing>
In-Reply-To: <marc-linux-sound-93756643831266@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Fri, 17 Sep 1999, Maarten de Boer wrote:
[...]
> > while(1)
> > {
> >     read(&buffer); // btw I'll be using alsa not oss
> >     Process(buffer);
> >     write(&buffer);
> > }
> Works fine. Make sure you do=20
> (I quote Benno:)
> [blocking read/write] write 4 fragments of silence to the output, at this=
=20
> point both audio input and audio output will start (or alternatively you =

> could trigger the start via ioctl() after the write).

You may also block on the read(), and just "preload" the DAC by writing a
suitable number of samples to it before you start the loop. This way you can
easily change the input-output latency on the fly, as you don't have to cha=
nge
the number of fragments in the buffers. Just make sure there are enough
fragments for the biggest latency you may want to use.

Of course, the rules are the same; apart from the single buffer delay you g=
et
in an empty read()/write() loop (doesn't work in real life!), you need some
extra samples of buffering to handle the scheduling jitter, and some more
samples to cover the maximum Process() execution time.

Same performance; just another way of doing it.

(I'm not sure whether there could be any strange side effects on Linux +
Mingo's patch, but it works just fine with RTL + DPI. That is, same driver
code, same semantics, but true preemptive hard real time scheduling.)


<offtopic level=3D"slightly">

Weekend. :-) I'd really like to start playing with the RTL DPI (Driver
Programming Interface) again (measuring actual analog->analog latency with =
36
bytes of buffering and some other things), but I think I should get my plug=
-in
API event system proposal together first... Time to ask the guys at
linux-audio-dev what happened while I was away!

And then there's RTLinux beta 15 (I think) to check out... And people are
discussing an NMT RTL + RTAI merger, or at least sharing the RTAI interrupt
abstraction layer, which would clean things up quite a bit - a Linux kernel
with a very tiny patch (that's clean, and usable for other purposes as well=
) can
get RTL performance by just loading a module - RTL or RTAI, or some new har=
d RT
kernel, if someone decides to hack a cleaner/better/<whatever> alternative.
That is, standard Linux kernels could be hard RT capable without having the=
 RTK
built in.

So... What interesting Linux related developments have I missed?

Oh, this incredible tempo! :-)

</offtopic>


//David


 =B7A=B7U=B7D=B7I=B7A=B7L=B7I=B7T=B7Y=B7   P r o f e s s i o n a l   L i n =
u x   A u d i o
-  - ------------------------------------------------------------- -  -
    =B7Rock Solid                                      David Olofson:
    =B7Low Latency    www.angelfire.com/or/audiality   =B7Audio Hacker
    =B7Plug-Ins            audiality@swipnet.se        =B7Linux Advocate
    =B7Open Source                                     =B7Singer/Composer
