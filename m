From: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Date: Mon, 25 Jul 2005 10:29:35 +0000
Subject: snd_ac97_update_bits called with spinlock held
Message-Id: <20050725102935.GB9854@dmt.cnet>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi folks,

I'm using RH's 2.6.11-1.14_FC3 on my laptop and encountered this issue  
after removing/adding snd modules.                                      

snd_ac97_update_bits tries to grab a semaphore while
snd_pcm_action_single is holding a couple of spinlocks. It seems that 
the erratic callpath is also possible with v2.6 mainline.

Debug: sleeping function called from invalid context at include/asm/semaphore.h:107
in_atomic():0, irqs_disabled():1
 [<c011cfbe>] __might_sleep+0x9c/0xa4
 [<e09e02d3>] snd_ac97_update_bits+0x31/0x61 [snd_ac97_codec]
 [<e094aa7b>] snd_intel8x0m_pcm_trigger+0x5b/0x74 [snd_intel8x0m]
 [<e09b2ccd>] snd_pcm_do_stop+0x35/0x39 [snd_pcm]
 [<e09b2571>] snd_pcm_action_single+0x1d/0x4c [snd_pcm]
 [<e09b26a4>] snd_pcm_action+0x104/0x19a [snd_pcm]
 [<c018c8a2>] do_select+0x33b/0x440
 [<e09b3d88>] snd_pcm_drop+0xad/0x222 [snd_pcm]
 [<e09b5c5b>] snd_pcm_hwsync+0xfd/0x1b6 [snd_pcm]
 [<e09b64b2>] snd_pcm_playback_ioctl1+0x3a/0x413 [snd_pcm]
 [<e09b6b1f>] snd_pcm_playback_ioctl+0x0/0x26 [snd_pcm]
 [<c018bb99>] do_ioctl+0x39/0x52
 [<c018bd47>] vfs_ioctl+0x57/0x195
 [<c018bee4>] sys_ioctl+0x5f/0x6f
 [<c0103903>] syscall_call+0x7/0xb
codec_semaphore: semaphore is not ready [0x1][0x700300]
codec_write 1: semaphore is not ready for register 0x54


snd_intel8x0m          18565  1
snd_ac97_codec         71097  1 snd_intel8x0m
snd_pcm                99657  3 snd_intel8x0m,snd_ac97_codec
snd_timer              33093  1 snd_pcm
snd                    56741  5 snd_intel8x0m,snd_ac97_codec,snd_pcm,snd_timer
soundcore              10785  1 snd
snd_page_alloc          9669  2 snd_intel8x0m,snd_pcm

