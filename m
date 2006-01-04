From: Olivier Galibert <galibert@pobox.com>
Date: Wed, 04 Jan 2006 22:25:17 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060104222517.GA55316@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20060103170316.GA12249@dspnet.fr.eu.org> <s5h1wzpnjrx.wl%tiwai@suse.de> <20060103203732.GF5262@irc.pl> <s5hvex1m472.wl%tiwai@suse.de> <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com> <20060103215654.GH3831@stusta.de> <9a8748490601031411p17d4417fyffbfee00ca85ac82@mail.gmail.com> <s5hpsn8md1j.wl%tiwai@suse.de> <Pine.LNX.4.61.0601041545580.5750@yvahk01.tjqt.qr> <27043632-7EA6-4468-A5D9-7E90725373F3@mac.com>
In-Reply-To: <27043632-7EA6-4468-A5D9-7E90725373F3@mac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyle Moffett <mrmacman_g4@mac.com>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Takashi Iwai <tiwai@suse.de>, Jesper Juhl <jesper.juhl@gmail.com>, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Wed, Jan 04, 2006 at 03:12:33PM -0500, Kyle Moffett wrote:
> Software mixing in the kernel probably _IS_ FPU ops in the kernel.   
> We already do video mixing (think X) in userspace, I see no reason  
> why audio should be different.

Bad comparison.  X as it is is so good that if you want something
remotely looking like performance you end up with a proprietary kernel
module the size of Cleveland.

Software mixing in practice could be in the kernel, it's for instance
way less complex than say the network stack.  I mean, even with an
helper thread, it fits in 20-30 lines of kernel code or so.  But what
happens is that you quickly want much more than that.  To give you
some examples:

- resampling (with a wide array of algorithms with a different cpu
  usage/result quality mix), especially since a number of chips are
  48KHz only.

- AC3/DTS encoding for multichannel output on spdif.

- spatialisation (virtual or real, depending on the hardware
  available).

- dynamic range compression.

So as soon as you build some decent infrastructure to allow for that
in userspace, having software mixing specifically in the kernel does
not make much sense.

I have 3 main problems with ALSA, but using userspace for flexibility
is definitively not one of them.

  OG.

