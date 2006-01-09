From: Hannu Savolainen <hannu@opensound.com>
Date: Mon, 09 Jan 2006 00:30:30 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601090145110.32511@zeus.compusonic.fi>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de>
 <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de>
 <20060108020335.GA26114@dspnet.fr.eu.org> <Pine.LNX.4.61.0601081039520.9470@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081039520.9470@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Olivier Galibert <galibert@pobox.com>, Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 8 Jan 2006, Jaroslav Kysela wrote:

> On Sun, 8 Jan 2006, Olivier Galibert wrote:
> 
> > Once again no.  Nothing prevents the kernel to forward the data to
> > userland daemons depending on a userspace-uploaded configuration.
> 
> But it's quite ineffecient. The kernel must switch tasks at least twice
> or more. 
Actually there is just one extra context switch. When the application 
using the API interface has finished it's current buffer it goes to sleep 
(sooner or later). With no OSS kernel task then the context is 
switched to the next process in the ready list. With the OSS task there is 
one extra context switch to the task before the inevitable switch to 
some other task in the system.

In CPU usage perspective this is nothing significant. This kind of 
approach makes only sense if the extra task is going to do some 
significant processing. So even if there is one context switch (and 
possibly some data copying) related with this mechanism the load caused to 
it is microscopic when compared to the actual processing. There is no real 
difference when compared to a pure library solution.

What is problem is that context switching delays make it necessary to use 
slightly larger buffers. This causes increased latencies which may or may 
not cause problems with some timing critical applications. OTOH with OSS 
API the application can disable this kind of extra stuff if it needs 
"traditional" access directly to the device.

> It's the major problem with the current OSS API.
I don't see there any problem. In particular it's in no way an API 
issue. Everything that has been found to be necessary for applications is 
included in OSS API and all it has been implemented in kernel space. 

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
OH2GLH QTH: Karkkila, Finland LOC: KP20CM
