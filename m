From: Lee Revell <rlrevell@joe-job.com>
Date: Thu, 05 Jan 2006 07:16:35 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <1136445395.24475.17.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <s5h1wzpnjrx.wl%tiwai@suse.de> <20060103203732.GF5262@irc.pl>
	 <s5hvex1m472.wl%tiwai@suse.de>
	 <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com>
	 <20060103215654.GH3831@stusta.de> <20060103221314.GB23175@irc.pl>
	 <20060103231009.GI3831@stusta.de>
	 <Pine.BSO.4.63.0601040048010.29027@rudy.mif.pg.gda.pl>
	 <20060104000344.GJ3831@stusta.de>
	 <Pine.BSO.4.63.0601040113340.29027@rudy.mif.pg.gda.pl>
	 <20060104010123.GK3831@stusta.de>
	 <Pine.BSO.4.63.0601040242190.29027@rudy.mif.pg.gda.pl>
	 <20060104113726.3bd7a649@mango.fruits.de>
In-Reply-To: <20060104113726.3bd7a649@mango.fruits.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mista.tapas@gmx.net
Cc: Tomasz =?ISO-8859-1?Q?K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>, Adrian Bunk <bunk@stusta.de>, Jesper Juhl <jesper.juhl@gmail.com>, Takashi Iwai <tiwai@suse.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Wed, 2006-01-04 at 11:37 +0100, tapas wrote:
> ALSA's kernel level OSS emulation (as opposed to aoss) cannot provide
> software mixing. As aoss cannot provide OSS emulation to all OSS apps

Why not?

> ,
> the kernel level OSS emu must be fixed. 

Wrong, if an app doesn't work with aoss it's a bug and we need to hear
about it.  I mentioned this previously in the thread and apparently no
one cares about it enough to file a useful bug report (we got one report
that the *kernel level* emulation didn't work which is a different
issue).

By far the most common bug report is "Skype does not work with aoss".
We would LOVE to see a reproducible test case using an *open source* app
(kiax might be a good place to start).

Lee

