From: kbob@jogger-egg.engr.sgi.com (Bob Miller)
Date: Wed, 17 Mar 1999 14:33:42 +0000
Subject: Re: Driver Writer's Questions
Message-Id: <marc-linux-sound-92169806011237@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92163226831993@msgid-missing>
In-Reply-To: <marc-linux-sound-92163226831993@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I asked:

> > 1. (the big question) This device requires a single DMA buffer of up
> >    to 8 Kb in main memory.  It reads/writes the buffer circularly.  It
> >    can't chain buffers.  Can I use the OSS DMA routines to set that
> >    up somehow (how?), or do I have to write a non-OSS driver?

Thomas Sailer replied:

> If the device is not ISA, I wouldn't bother fitting it into the
> OSS framework, a stand alone driver (like I did for some
> PCI cards) is easier to do and more maitainable.

Thanks a lot for answering!

> > 2. This device is capable of telling how many samples it has
> >    read/written, with an accuracy of 1 sample.  I'd like to export
> >    that via the SNDCTL_DSP_GET{I,O}PTR, ioctls, but I can't see how
> >    my driver can get control on those ioctls.

> Take a look at eg. the es1370 driver

Is the es1370 driver non-OSS, then?  Would it be a good model for
how to structure a non-OSS driver?  My device also has no synth...

					K<bob>
