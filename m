From: Lee Revell <rlrevell@joe-job.com>
Date: Thu, 05 Jan 2006 19:29:07 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <1136489348.31583.47.camel@mindpipe>
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
	 <20060104113726.3bd7a649@mango.fruits.de> <s5hsls398uv.wl%tiwai@suse.de>
	 <20060104191750.798af1da@mango.fruits.de>
	 <1136445063.24475.11.camel@mindpipe>
	 <20060105200911.5aa4e705.froese@gmx.de>
In-Reply-To: <20060105200911.5aa4e705.froese@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edgar Toernig <froese@gmx.de>
Cc: Florian Schmidt <tapas@affenbande.org>, Takashi Iwai <tiwai@suse.de>, Adrian Bunk <bunk@stusta.de>, Jesper Juhl <jesper.juhl@gmail.com>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Thu, 2006-01-05 at 20:09 +0100, Edgar Toernig wrote:
> Lee Revell wrote:
> >
> > All of this was solved with the switch in ALSA 1.0.9 to use dmix by
> > default.  If it does not Just Work it's a bug and we need to hear about
> > it.
> 
> So then:  xawtv4 (dvb-app) works with hw:0 but not with 1.0.9's dmix default.
> It works with /dev/dsp1 (usb-speakers) but not with /dev/dsp0 (atiixp ac'97).
> vdr's softdevice (another dvb-app) works with dmix-default but not with hw:0.
> And that's my experience with most audio apps - you have to try all configur-
> ations until you find one that works.  Sure, maybe badly written apps but
> there must be something wrong if so many developers have problems with
> Alsa.  I've even resigned to grok the config files :-(
> 
> Ciao, ET.
> 

Come on, this is LKML, you should know that "it doesn't work" is not a
useful bug report.

> And btw, with 2.6.15 the usb-speakers only produce noise most of the time.
> 

Known regression, this is being worked on.  It was known and posted to
LKML before the 2.6.15 release, unfortunately 2.6.15 was released with
this bug anyway.

Lee

