From: Lee Revell <rlrevell@joe-job.com>
Date: Thu, 05 Jan 2006 07:19:00 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <1136445541.24475.21.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <200601031522.06898.s0348365@sms.ed.ac.uk>
	 <s5hvex1m472.wl%tiwai@suse.de>
	 <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com>
	 <20060103215654.GH3831@stusta.de> <20060103221314.GB23175@irc.pl>
	 <20060103231009.GI3831@stusta.de>
	 <Pine.BSO.4.63.0601040048010.29027@rudy.mif.pg.gda.pl>
	 <43BB16C0.3080308@stesmi.com>
	 <Pine.BSO.4.63.0601040146540.29027@rudy.mif.pg.gda.pl>
	 <43BB9A0B.3010209@stesmi.com>
	 <7e5f60720601041903s3462bf9bib9ada16fe70ef988@mail.gmail.com>
	 <Pine.LNX.4.61.0601050812040.10161@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0601050812040.10161@yvahk01.tjqt.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Peter Bortas <bortas@gmail.com>, Stefan Smietanowski <stesmi@stesmi.com>, Tomasz =?iso-8859-2?Q?K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>, Adrian Bunk <bunk@stusta.de>, Jesper Juhl <jesper.juhl@gmail.com>, Takashi Iwai <tiwai@suse.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Thu, 2006-01-05 at 08:13 +0100, Jan Engelhardt wrote:
> >No. Everything on Solaris uses the Solaris native sound API except for
> >possibly quick-hack ports of applications from Linux. Doing anything
> >else would as you say be insane and break things like device
> >redirection on Sunrays.
> >
> Device redirection is just "writing to a different /dev node" - on
> Solaris and Linux. IIRC, the API is the same.

This whole "OSS is cross platform" thing seems mostly like a cop out by
lazy developers who can't be bothered to grok ALSA.  None of the usual
offenders (Skype, Quake 3, Doom 3) run on any other Unix platform so why
not just use ALSA?

It does not help that the most problematic apps seem to be proprietary
(most likely they are abusing the OSS API in a way that no one
anticipated).

Lee

