From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 28 Jul 2006 11:33:10 +0000
Subject: Re: Sound problems with snd_hda on x86_64
Message-Id: <s5hmzaunevd.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <200607281216.25214.vda.linux@googlemail.com>
	<s5hr706nhtr.wl%tiwai@suse.de>
	<200607281247.11986.vda.linux@googlemail.com>
In-Reply-To: <200607281247.11986.vda.linux@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Vlasenko <vda.linux@googlemail.com>
Cc: Andi Kleen <ak@suse.de>, PeiSen Hou <pshou@realtek.com.tw>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

At Fri, 28 Jul 2006 12:47:11 +0200,
Denis Vlasenko wrote:
> 
> On Friday 28 July 2006 12:29, Takashi Iwai wrote:
> > > Which is, in turn, is caused by this code:
> > > 
> > > --- linux-2.6.17.6.org/sound/core/pcm_compat.c	2006-07-15 21:00:43.000000000 +0200
> > > +++ linux-2.6.17.6.src/sound/core/pcm_compat.c	2006-07-28 00:35:10.000000000 +0200
> > > @@ -478,6 +478,8 @@ static long snd_pcm_ioctl_compat(struct 
> > >  	 * mmap of PCM status/control records because of the size
> > >  	 * incompatibility.
> > >  	 */
> > > +printk("substream->no_mmap_ctrl = 1 in %s:%s line %d\n", __FILE__, __FUNCTION__, __LINE__);
> > > +dump_stack();
> > >  	substream->no_mmap_ctrl = 1;
> > >  
> > >  	switch (cmd) {
> > > 
> > > It's puzzling. Even a 486 processor, can do 64-bit operations (using cmpxchg8)
> > > on memory-mapped areas, why does code disallows mmap for 64-bit CPUs but allows
> > > for 32-bit ones?
> > 
> > On the contrary, the driver disallows mmap for 32bit task on 64bit
> > architecture.  This is because the size of the mapped record is
> > different between 32bit and 64bit architectures, so it cannot be
> > shared.
> 
> Why artsd attempts mmap at all then?

The app must try mmap.  From the application side, you can't know
whether you're 32bit-emulation mode or it's really on 32bit
architecture.  And, mmap is usually done automatically via alsa-lib
plugin for optimization or soft-mixing purpose.

> Why it thinks that
> /dev/snd/pcmC0D0p is mmap-able when it is not?

Dunno.  pcm_compat.c is only for 32bit context on 64bit architecture.
The 64bit program will never go there.


Takashi
