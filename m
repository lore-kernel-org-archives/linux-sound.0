From: Britton <fsblk@aurora.uaf.edu>
Date: Sun, 30 Apr 2000 08:21:47 +0000
Subject: Re: Getting good sound input
Message-Id: <marc-linux-sound-95708312907404@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95703433918558@msgid-missing>
In-Reply-To: <marc-linux-sound-95703433918558@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 29 Apr 2000, Joe T. wrote:

> Hello
> Im currently using an ESS1869 soundcard on Slackware7
> with the OSS kernel modules.
> Im trying to get some input from a cassette to wav,
> but i'm having a lot of difficulty.
> 
> I've tried using sox, kwave, sound-recorder and
> cat /dev/audio or /dev/dsp > blah.au.

I don't know about kwave, but the little play and record things that come
with sox have aweful quality.  I don't know for sure why but I'd guess
poor real time coding, as both bplay/brec and my own concoction
rawrec/rawplay (which I will be releasing for alpha test shortly) get much
better quality.  sound-recorder has, according to it's own documentation,
poor quality due to bad buffering.  'cat'ing from /dev/audio will probably
suffer from the same problem.

> When i record from the input port, i get nothing.

Make sure your mixer settings are reasonable.

> When i record from the mic port, it sounds horrid.

The mic is probably going to sound awful without careful setting of the
input gain, and pretty terrible even then.  PC mics are incredibly cheezy,
and they typically sit beside the computer and suck in all kinds of fan
noise.  This should be partly fixable with a simple ADALINE, it may well
be that sound studio is doing something like that for mic recording and
not bothering to tell you.

> Does anyone know what the problem could be and how to
> solve it?  Are there any special modules in the kernel
> I have to enable to get good input sound?

The problem is almost certainly not the kernel drivers.

> I used this card with freebsd and the commercial OSS
> drivers. Using Sound Studio, I was able to get perfect sound..
> 
> ==> Joe Topjian
> auximini@yahoo.com
> http://auximini.cjb.net
> 
> Even a stopped clock gives the right time twice a day
> 
> __________________________________________________
> Do You Yahoo!?
> Talk to your friends online and get email alerts with Yahoo! Messenger.
> http://im.yahoo.com/

Britton Kerin
