From: Florian Schmidt <mista.tapas@gmx.net>
Date: Fri, 06 Jan 2006 11:34:40 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20060106123440.7359e430@mango.fruits.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	<20060103193736.GG3831@stusta.de>
	<Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
	<mailman.1136368805.14661.linux-kernel2news@redhat.com>
	<20060104030034.6b780485.zaitcev@redhat.com>
	<Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
	<Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
	<Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
	<Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
	<s5hmziaird8.wl%tiwai@suse.de>
	<Pine.LNX.4.61.0601060028310.27932@zeus.compusonic.fi>
	<20060106041421.31579e69.froese@gmx.de>
	<Pine.LNX.4.61.0601060519450.29362@zeus.compusonic.fi>
In-Reply-To: <Pine.LNX.4.61.0601060519450.29362@zeus.compusonic.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannu Savolainen <hannu@opensound.com>
Cc: Edgar Toernig <froese@gmx.de>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 6 Jan 2006 05:33:43 +0200 (EET)
Hannu Savolainen <hannu@opensound.com> wrote:

> Then this is in no way an API issue. Many OSS drivers (including envy24) 
> create separete device files for each input/output channel (or device pair). 
> Applications can chose to open the first device file in for all the 
> channels or any combination of the devices in mono/stereo/n-channel mode.
> 
> All this depends only on the driver implementation. There is nothing API 
> related. Any app can open the devices as usual without paying any 
> attention on the channel allocation (which is done automatically by the 
> driver). xmms (or whatever else consumer app) can open the device and ask 
> for stereo access. Equally well a DAB application can open the device and 
> ask for full 10 output channels (or anything between 1 and 10). No special 
> API features are needed for this.

Hi,

i would find it helpful if you always made it crystal  clear about what
version of OSS you are talking about:

- your proprietary version

- or the free one in the kernel

Mixing these isn't helping the discussion.

Flo

-- 
Palimm Palimm!
http://tapas.affenbande.org
