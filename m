From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 16 Jan 2008 13:57:17 +0000
Subject: Re: [PATCH 5/5] sound: fix caiaq section mismatches
Message-Id: <s5hir1tvpoi.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20080115132546.b96de6a2.randy.dunlap@oracle.com>
In-Reply-To: <20080115132546.b96de6a2.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, perex@perex.cz, akpm <akpm@linux-foundation.org>, samr <sam@ravnborg.org>

At Tue, 15 Jan 2008 13:25:46 -0800,
Randy Dunlap wrote:
> 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix section mismatch in caiaq: these __devinit functions can be
> called at any time so they should not be __devinit.
> 
> WARNING: vmlinux.o(.text+0x10a8dae): Section mismatch: reference to .init.text:snd_usb_caiaq_audio_init (between 'setup_card' and 'create_card')
> WARNING: vmlinux.o(.text+0x10a8dd6): Section mismatch: reference to .init.text:snd_usb_caiaq_midi_init (between 'setup_card' and 'create_card')
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, applied all 5 patches to ALSA tree now.


Takashi
