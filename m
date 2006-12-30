From: "Michael S. Tsirkin" <mst@mellanox.co.il>
Date: Sat, 30 Dec 2006 20:45:27 +0000
Subject: Re: No sound in KDE with intel hda since 2.6.20-rc1
Message-Id: <20061230204527.GB4338@mellanox.co.il>
List-Id: <linux-sound.vger.kernel.org>
References: <200612302227.48097.ismail@pardus.org.tr>
In-Reply-To: <200612302227.48097.ismail@pardus.org.tr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ismail =?iso-8859-1?Q?D=F6nmez?= <ismail@pardus.org.tr>
Cc: Alistair John Strachan <s0348365@sms.ed.ac.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, PeiSen Hou <pshou@realtek.com.tw>

> > > > > Virtual MIDI Card 1
> > > >
> > > > Compile this feature out, I bet things start working again.
> > >
> > > Yes, this helped, thanks.
> > > BTW, is this expected?
> >
> > It's a severe "misfeature" in my opinion that caused me problems years ago.
> > The first soundcard becomes "default", which can probably be overridden in
> > many different ways.
> >
> > However, I really think a hack should be put in to prevent "virtual MIDI"
> > from ever being in the first slot, it's just a bug asking to happen.
> 
> So should we enable Virtual MIDI in kernel config? Since I have it off and 
> aRts have no sound with ALSA backend.

Try updating to latest git - I have 7479b1ce5ea41a828002c60739cff37f47b62913
with Virtual MIDI off and ALSA seems to work.

BTW, Amarok has an Engine dialog where you can easily switch between backends
which is good for testing.

-- 
2 + 2 = 5 for very large values of 2

-- 
MST
