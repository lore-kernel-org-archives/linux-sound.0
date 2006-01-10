From: David Lang <dlang@digitalinsight.com>
Date: Tue, 10 Jan 2006 00:29:45 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.62.0601091628340.4005@qynat.qvtvafvgr.pbz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601091405.23939.rene@exactcode.de>
 <Pine.LNX.4.61.0601091637570.21552@zeus.compusonic.fi> <200601091812.55943.rene@exactcode.de>
 <Pine.LNX.4.62.0601091355541.4005@qynat.qvtvafvgr.pbz>
 <20060109232043.GA5013@localhost.localdomain> <Pine.LNX.4.62.0601091515570.4005@qynat.qvtvafvgr.pbz>
 <20060110001617.GA5154@localhost.localdomain>
In-Reply-To: <20060110001617.GA5154@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Rigg <ad@sound-man.co.uk>
Cc: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactcode.de>, Hannu Savolainen <hannu@opensound.com>, Jaroslav Kysela <perex@suse.cz>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, 10 Jan 2006, John Rigg wrote:

>> does the CPU touch the data for these, or do you DMA directly from
>> userspace (i.e. "zero-copy")?
>
> The cards I mentioned use DMA. RME actually advertises that some of their
> cards can handle 52 channels with zero CPU load. Their onboard DSPs can
> also do routing and mixing, again without touching the CPU.

I was under the (apparently mistaken) impression that you couldn't DMA 
from userspace (something to do with the possibility that the userspace 
memory pages could be swapped out in the middle of the DMA)

David Lang

-- 
There are two ways of constructing a software design. One way is to make it so simple that there are obviously no deficiencies. And the other way is to make it so complicated that there are no obvious deficiencies.
  -- C.A.R. Hoare

