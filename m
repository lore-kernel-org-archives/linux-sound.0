From: Jaroslav Kysela <perex@suse.cz>
Date: Tue, 26 Jul 2005 11:41:17 +0000
Subject: Re: snd_ac97_update_bits called with spinlock held
Message-Id: <Pine.LNX.4.61.0507261339480.8190@tm8103-a.perex-int.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050725102935.GB9854@dmt.cnet>
In-Reply-To: <20050725102935.GB9854@dmt.cnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 25 Jul 2005, Marcelo Tosatti wrote:

> Hi folks,
> 
> I'm using RH's 2.6.11-1.14_FC3 on my laptop and encountered this issue  
> after removing/adding snd modules.                                      
> 
> snd_ac97_update_bits tries to grab a semaphore while
> snd_pcm_action_single is holding a couple of spinlocks. It seems that 
> the erratic callpath is also possible with v2.6 mainline.
> 
> Debug: sleeping function called from invalid context at include/asm/semaphore.h:107
> in_atomic():0, irqs_disabled():1
>  [<c011cfbe>] __might_sleep+0x9c/0xa4
>  [<e09e02d3>] snd_ac97_update_bits+0x31/0x61 [snd_ac97_codec]
>  [<e094aa7b>] snd_intel8x0m_pcm_trigger+0x5b/0x74 [snd_intel8x0m]

This snd_ac97_update_bits() call was removed from the trigger callback in 
our recent code. This setup is available using a control element from user 
space now.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
Linux Kernel Sound Maintainer
ALSA Project, SUSE Labs
