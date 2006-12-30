From: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Date: Sat, 30 Dec 2006 19:19:06 +0000
Subject: Re: No sound in KDE with intel hda since 2.6.20-rc1
Message-Id: <200612301919.06949.s0348365@sms.ed.ac.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <200612301844.02413.s0348365@sms.ed.ac.uk> <20061230191123.GA4352@mellanox.co.il>
In-Reply-To: <20061230191123.GA4352@mellanox.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@mellanox.co.il>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, PeiSen Hou <pshou@realtek.com.tw>

On Saturday 30 December 2006 19:11, Michael S. Tsirkin wrote:
> > On Friday 29 December 2006 06:25, Michael S. Tsirkin wrote:
> > > Virtual MIDI Card 1
> >
> > Compile this feature out, I bet things start working again.
>
> Yes, this helped, thanks.
> BTW, is this expected?

It's a severe "misfeature" in my opinion that caused me problems years ago. 
The first soundcard becomes "default", which can probably be overridden in 
many different ways.

However, I really think a hack should be put in to prevent "virtual MIDI" from 
ever being in the first slot, it's just a bug asking to happen.

-- 
Cheers,
Alistair.

Final year Computer Science undergraduate.
1F2 55 South Clerk Street, Edinburgh, UK.
