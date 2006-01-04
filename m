From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Wed, 04 Jan 2006 14:46:43 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.LNX.4.61.0601041545580.5750@yvahk01.tjqt.qr>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031522.06898.s0348365@sms.ed.ac.uk>
 <20060103160502.GB5262@irc.pl> <200601031629.21765.s0348365@sms.ed.ac.uk>
 <20060103170316.GA12249@dspnet.fr.eu.org> <s5h1wzpnjrx.wl%tiwai@suse.de>
 <20060103203732.GF5262@irc.pl> <s5hvex1m472.wl%tiwai@suse.de>
 <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com>
 <20060103215654.GH3831@stusta.de> <9a8748490601031411p17d4417fyffbfee00ca85ac82@mail.gmail.com>
 <s5hpsn8md1j.wl%tiwai@suse.de>
In-Reply-To: <s5hpsn8md1j.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

>> Still would be nice if users of ALSA who have the OSS backwards compat
>> enabled would thus also get transparent software mixing for all apps
>> using the OSS API.
>> not crucial, that's not what I'm saying, just nice if it would be possible.
>
>Technicall it's trivial to implement the soft-mixing in the kernel.
>The question is whether it's the right implementation.
>We have a user-space softmix for ALSA, and aoss wrapper for OSS using
>it.  (I know aoss still has some problems that should be fixed,
>though.)
>
Software mixing in the kernel is like FPU ops in the kernel...



Jan Engelhardt
-- 
