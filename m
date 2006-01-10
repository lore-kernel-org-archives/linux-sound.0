From: Hannu Savolainen <hannu@opensound.com>
Date: Tue, 10 Jan 2006 13:50:15 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601101542500.24146@zeus.compusonic.fi>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
 <43BDA02F.5070103@folkwang-hochschule.de> <20060105234951.GA10167@dspnet.fr.eu.org>
 <43BDB858.5060500@folkwang-hochschule.de> <Pine.LNX.4.61.0601060348380.29362@zeus.compusonic.fi>
 <Pine.LNX.4.61.0601101048360.10330@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601101048360.10330@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Joern Nettingsmeier <nettings@folkwang-hochschule.de>, Olivier Galibert <galibert@pobox.com>, Tomasz K?oczko <kloczek@rudy.mif.pg.gda.pl>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

On Tue, 10 Jan 2006, Jaroslav Kysela wrote:

> On Fri, 6 Jan 2006, Hannu Savolainen wrote:
> 
> > The fact is that there is nothing the audio subsystem can do to recover 
> > the situation. For this very simple reason the OSS API lacks everything 
> > that would be necessary to cope with this kind of problems.
> 
> Applications should be notified that something is broken. If you have
> a professional environment, you really need to know, if the output 
> survived all scheduling peaks and the audio data are delivered from/to
> I/O in time.
This is exactly how OSS API works. The application can check if there were 
any errors so far. It can do it after finishing the playback or whenever 
it likes. It can then show a dialog box saying that playback/recording 
was not 100% error free. Alternatively it can show error counters on the 
status line. Or most applications just don't care.
 
Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
OH2GLH QTH: Karkkila, Finland LOC: KP20CM
