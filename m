From: Yao Wang <ywangz@eecs.umich.edu>
Date: Wed, 19 Jan 2000 15:21:14 +0000
Subject: Re: sound blaster 16 config
Message-Id: <marc-linux-sound-94830032106499@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94826594212109@msgid-missing>
In-Reply-To: <marc-linux-sound-94826594212109@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



On Tue, 18 Jan 2000, Dave Mielke wrote:

> [quoted lines by Yao Wang on January 18, 2000, at 20:13]
> 
> Hi:
> 
> >I am running 2.2.5-22 from RH 6.0 with a sound blaster 16 card with 
> >base_addr=0x220, IRQ=5, 8-bit DMA=1 and 16-bit DMA=5 (uncommenting 
> >a few lines in the pnpdump output. 
> 
> Use RedHat's sndconfig utility to get isapnp.conf and conf.modules right.
thanks, i'll look into it.
> 
> Since I don't think that RedHat supplies 2.2.5-22, did you compile your own
> kernel? If so, did you select /dev/audio and /dev/dsp support?
this kernel is from the RedHat's update site. I recompiled it with
built-in SCSI support (I added a SCSI chain with some CD Burners). I have
specified sound as modules but I have not got them to work so far.

Thanks

yao
> 
> -- 
> Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
> Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
> EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
> 
> 
