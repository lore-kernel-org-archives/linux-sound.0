From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Wed, 17 Mar 1999 10:38:48 +0000
Subject: Re: Driver Writer's Questions
Message-Id: <marc-linux-sound-92169374607374@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92163226831993@msgid-missing>
In-Reply-To: <marc-linux-sound-92163226831993@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Bob Miller wrote:
> 1. (the big question) This device requires a single DMA buffer of up
>    to 8 Kb in main memory.  It reads/writes the buffer circularly.  It
>    can't chain buffers.  Can I use the OSS DMA routines to set that
>    up somehow (how?), or do I have to write a non-OSS driver?

If the device is not ISA, I wouldn't bother fitting it into the
OSS framework, a stand alone driver (like I did for some
PCI cards) is easier to do and more maitainable.

>    What does this imply for mmap?

That the DMA buffer mappable is 8k max. The mmap interface is
deprecated anyway. I've tried once to emulate the mmap interface
on top of read/write, but it never worked well, if you don't want
huge latencies.

> 2. This device is capable of telling how many samples it has
>    read/written, with an accuracy of 1 sample.  I'd like to export
>    that via the SNDCTL_DSP_GET{I,O}PTR, ioctls, but I can't see how
>    my driver can get control on those ioctls.

Take a look at eg. the es1370 driver

> 4. The mixer doesn't have a capability that corresponds to
>    SOUND_MIXER_VOLUME.  If I don't implement SOUND_MIXER_VOLUME, will
>    I be incompatible with 99% of the apps?  If I have to, I can fake

Unlikely

Tom
