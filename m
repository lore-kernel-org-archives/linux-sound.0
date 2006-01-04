From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 04 Jan 2006 08:50:34 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <1136364634.22598.70.camel@localhost.localdomain>
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
In-Reply-To: <Pine.BSO.4.63.0601040242190.29027@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Tomasz =?iso-8859-2?Q?K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Adrian Bunk <bunk@stusta.de>, Jesper Juhl <jesper.juhl@gmail.com>, Takashi Iwai <tiwai@suse.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Mer, 2006-01-04 at 03:51 +0100, Tomasz K=C5=82oczko wrote:
> Be compliant with OSS specyfication allow save many time on applications =

> development level by consume (in good sense) time spend on this=20
> applications by *BSD, Solaris and other systems developers (even on not=20
> open source applications).

Both Solaris and FreeBSD contain Linux emulation code so in that sense
they admitted 'defeat' long ago.

> valuable functionalities in usable/simpler form for joe-like users ..=20
> remember: sound support in Linux isn't for data centers/big-ass-machines =
:)

And distributions nowdays ship with ALSA by default, which is giving
users far better audio timing behaviour, mixing they want, digital and
analogue 5.1 outputs. OSS really isn't ideal for serious "end user"
applications like video playback

Alan

