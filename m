From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 30 Jun 2003 10:03:50 +0000
Subject: Re: Realtek ALC650E support in 2.[45]?
Message-Id: <marc-linux-sound-105696780216880@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-105696297412952@msgid-missing>
In-Reply-To: <marc-linux-sound-105696297412952@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At Mon, 30 Jun 2003 18:49:43 +1000,
CaT wrote:
> 
> Trying to get an upgrade and have a choice between two MBs. Both have
> onboard sound and one has the ALC650 audio support and the other has
> ALC650E audio support. I believe the former is s/w and the latter is
> h/w. I'd like to get the ALC650E but I can't find any clear info if
> there's support for it in either the 2.4 or 2.5 linux kernels. I found
> mention of the ALC650 in the source but not the ALC650E. Searching
> the web did not yeild much clarity either (and neither did the ALSA
> website :/) but I may have missed something though.
> 
> Anyways, does it support it? I'd prefer fully OS driver support and 
> don't mind using patches but prefer to be able to compile the driver
> into the kernel as I like the lack of messyness that comes with
> monolithic kernels.

ALC650(E) is the AC97 codec chip.  There must be an audio core in
addition, most likely Intel ICH chips or VIA 82xx chips.  Both are
supported by ALSA, snd-intel8x0 and snd-via8xx drivers, respectively.
On OSS, they are i810_audio and via82cxxx_audio drivers.

ALC650E is a revision E of ALC650, which has some minor extensions
(like S/PDIF support) but mostly identical with ALC650. 
So both should work.

-- 
Takashi Iwai <tiwai@suse.de>		SuSE Linux AG - www.suse.de
ALSA Developer				ALSA Project - www.alsa-project.org
