From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 01 Jul 2003 09:18:50 +0000
Subject: Re: Realtek ALC650E support in 2.[45]?
Message-Id: <marc-linux-sound-105705131930053@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-105696297412952@msgid-missing>
In-Reply-To: <marc-linux-sound-105696297412952@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At Mon, 30 Jun 2003 21:52:19 +1000,
CaT wrote:
> 
> On Mon, Jun 30, 2003 at 12:03:50PM +0200, Takashi Iwai wrote:
> > At Mon, 30 Jun 2003 18:49:43 +1000,
> > CaT wrote:
> > > Anyways, does it support it? I'd prefer fully OS driver support and 
> > > don't mind using patches but prefer to be able to compile the driver
> > > into the kernel as I like the lack of messyness that comes with
> > > monolithic kernels.
> > 
> > ALC650(E) is the AC97 codec chip.  There must be an audio core in
> > addition, most likely Intel ICH chips or VIA 82xx chips.  Both are
> > supported by ALSA, snd-intel8x0 and snd-via8xx drivers, respectively.
> > On OSS, they are i810_audio and via82cxxx_audio drivers.
> > 
> > ALC650E is a revision E of ALC650, which has some minor extensions
> > (like S/PDIF support) but mostly identical with ALC650. 
> > So both should work.
> 
> Aha. Ok. What about with an Nvidia2 backend (MCP-T) to all this?

it's (almost) compatible with Intel ICH and works with the recent
intel driver above.


Takashi
