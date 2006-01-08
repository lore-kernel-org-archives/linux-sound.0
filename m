From: Marcin Dalecki <dalecki.marcin@neostrada.pl>
Date: Sun, 08 Jan 2006 13:38:56 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20198DF8-D632-412C-9FDA-DE0F3FC1D68B@neostrada.pl>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl> <mailman.1136368805.14661.linux-kernel2news@redhat.com> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl> <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de> <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de> <20060108020335.GA26114@dspnet.fr.eu.org> <Pine.LNX.4.61.0601081039520.9470@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081039520.9470@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Olivier Galibert <galibert@pobox.com>, Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


On 2006-01-08, at 10:42, Jaroslav Kysela wrote:
>>
>> Once again no.  Nothing prevents the kernel to forward the data to
>> userland daemons depending on a userspace-uploaded configuration.
>
> But it's quite ineffecient. The kernel must switch tasks at least  
> twice
> or more. It's the major problem with the current OSS API.

1. It was only presented as an opportunity. Not every data has to go  
this way.
2. Aren't you the person which was showing off X11 as a good example  
to draw guidelines from?
