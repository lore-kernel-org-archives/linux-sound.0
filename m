From: Marcin Dalecki <martin@dalecki.de>
Date: Wed, 04 Jan 2006 16:43:39 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <F082489C-B664-472C-8215-BE05875EAF7D@dalecki.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031522.06898.s0348365@sms.ed.ac.uk> <20060103160502.GB5262@irc.pl> <200601031629.21765.s0348365@sms.ed.ac.uk> <20060103170316.GA12249@dspnet.fr.eu.org> <s5h1wzpnjrx.wl%tiwai@suse.de> <20060103203732.GF5262@irc.pl> <s5hvex1m472.wl%tiwai@suse.de> <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com> <20060103215654.GH3831@stusta.de> <9a8748490601031411p17d4417fyffbfee00ca85ac82@mail.gmail.com> <s5hpsn8md1j.wl%tiwai@suse.de> <Pine.LNX.4.61.0601041545580.5750@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0601041545580.5750@yvahk01.tjqt.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Takashi Iwai <tiwai@suse.de>, Jesper Juhl <jesper.juhl@gmail.com>, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org


On 2006-01-04, at 15:46, Jan Engelhardt wrote:

>>> Still would be nice if users of ALSA who have the OSS backwards  
>>> compat
>>> enabled would thus also get transparent software mixing for all apps
>>> using the OSS API.
>>> not crucial, that's not what I'm saying, just nice if it would be  
>>> possible.
>>
>> Technicall it's trivial to implement the soft-mixing in the kernel.
>> The question is whether it's the right implementation.
>> We have a user-space softmix for ALSA, and aoss wrapper for OSS using
>> it.  (I know aoss still has some problems that should be fixed,
>> though.)
>>
> Software mixing in the kernel is like FPU ops in the kernel...

Could you please elaborate a tad bit more on the analogy? It doesn't  
appear to be stunningly obvious.
Are you aware of the reasons why floating point operations are  
avoided inside the kernel?
They are *not* principal - it's just engineering pragmatism.

