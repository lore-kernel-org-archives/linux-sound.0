From: Olivier Galibert <galibert@pobox.com>
Date: Fri, 06 Jan 2006 14:57:23 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060106145723.GA73361@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20060103215654.GH3831@stusta.de> <9a8748490601031411p17d4417fyffbfee00ca85ac82@mail.gmail.com> <s5hpsn8md1j.wl%tiwai@suse.de> <Pine.LNX.4.61.0601041545580.5750@yvahk01.tjqt.qr> <F082489C-B664-472C-8215-BE05875EAF7D@dalecki.de> <Pine.LNX.4.61.0601051154500.21555@yvahk01.tjqt.qr> <0D76E9E1-7FB0-41FD-8FAC-E4B3C6E9C902@dalecki.de> <1136486021.31583.26.camel@mindpipe> <E09E5A76-7743-4E0E-9DF6-6FB4045AA3CF@dalecki.de> <20060106034026.c37c1ed9.diegocg@gmail.com>
In-Reply-To: <20060106034026.c37c1ed9.diegocg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diego Calleja <diegocg@gmail.com>
Cc: Marcin Dalecki <martin@dalecki.de>, rlrevell@joe-job.com, jengelh@linux01.gwdg.de, tiwai@suse.de, jesper.juhl@gmail.com, bunk@stusta.de, zdzichu@irc.pl, s0348365@sms.ed.ac.uk, ak@suse.de, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, linux@thorsten-knabe.de, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Fri, Jan 06, 2006 at 03:40:26AM +0100, Diego Calleja wrote:
> Amazing - even windows is getting sound mixing out of the kernel
> in windows vista because they've learnt (the hard way) that it's
> the Right Thing and linux people is trying to get it in?

You misread.  Most people just want to have things work like they
should have for years.  Technical people, at least Marcin and I, want
a documented kernel interface with optional libraries over it (think
libX11 vs. the X Protocol, or glibc/klibc/uclibc/libc5 vs. the system
calls), and then behind that have the kernel route the data to
userspace demon(s) or the hardware depending on root-level setup and
configuration.

ALSA does not have a documented kernel interface nor an optional
library but a mandatory library.  A highly complex, ipc-using library
with no security audit that I could find with google.  A library for
which people do not seem to care about compatibility with previous or
future kernel versions, which means it _has_ to be shared.  And shared
libraries are just unacceptable in some contexts, like distributing
binaries outside of a specific linux distribution[1].

At least OSS, with all its flaws, is a documented kernel interface.
You can static link a oss-using program, whether it uses it directly
or through interfaces like sdl-audio, and it will just work.

  OG.

[1] And that does not necessarily means commercial and/or proprietary.
"Just recompile" does not always work either, think missing libraries,
headers, and version drift (snd_pcm_hw_params_set_rate_near anybody?).
