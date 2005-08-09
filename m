From: Lee Revell <rlrevell@joe-job.com>
Date: Tue, 09 Aug 2005 17:54:48 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal (version
Message-Id: <1123610089.8210.7.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <20050729153226.GE3563@stusta.de>
	 <1123607633.5601.7.camel@mindpipe>  <20050809174906.GA4006@stusta.de>
In-Reply-To: <20050809174906.GA4006@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: gregkh@suse.de, NAGANO Daisuke <breeze.nagano@nifty.ne.jp>, alan@lxorguk.ukuu.org.uk, sailer@ife.ee.ethz.ch, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zaitcev@yahoo.com, Christoph Eckert <ce@christeck.de>, linux-usb-devel@lists.sourceforge.net

On Tue, 2005-08-09 at 19:49 +0200, Adrian Bunk wrote:
> I'd deprecate them without moving them.
> 

OK, I think that will still be slightly confusing becuase it comes
before Sound in the kernel config, but maybe the deprecated part will
make people think twice.

I think we should at least label these clearly as part of OSS.  Users at
least seem to know that mixing OSS and ALSA modules is bad.

> I'll send a patch unless someone tells that any functionality of these
> drivers is lacking in ALSA. 

OK.  I'm almost positive there is no functionality missing, there have
not been any reports of people needing to use the OSS driver on any of
the ALSA lists.

Lee 

