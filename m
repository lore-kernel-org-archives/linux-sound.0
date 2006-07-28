From: Denis Vlasenko <vda.linux@googlemail.com>
Date: Fri, 28 Jul 2006 13:14:13 +0000
Subject: Re: Sound problems with snd_hda on x86_64
Message-Id: <200607281514.14085.vda.linux@googlemail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <200607281216.25214.vda.linux@googlemail.com> <200607281247.11986.vda.linux@googlemail.com> <s5hmzaunevd.wl%tiwai@suse.de>
In-Reply-To: <s5hmzaunevd.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Andi Kleen <ak@suse.de>, PeiSen Hou <pshou@realtek.com.tw>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Friday 28 July 2006 13:33, Takashi Iwai wrote:
> > Why artsd attempts mmap at all then?
> 
> The app must try mmap.  From the application side, you can't know
> whether you're 32bit-emulation mode or it's really on 32bit
> architecture.  And, mmap is usually done automatically via alsa-lib
> plugin for optimization or soft-mixing purpose.

Well, alsa seems to have info about mmap-ability here:

static struct snd_pcm_hardware azx_pcm_hw = {
        .info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
                                 SNDRV_PCM_INFO_BLOCK_TRANSFER |
                                 SNDRV_PCM_INFO_MMAP_VALID |
                                 SNDRV_PCM_INFO_PAUSE /*|*/
                                 /*SNDRV_PCM_INFO_RESUME*/),
...
};

but it is not split into "can mmap data", "can mmap control/status".
When this one triggers:

snd_pcm_ioctl_compat()
...
        /*
         * When PCM is used on 32bit mode, we need to disable
         * mmap of PCM status/control records because of the size
         * incompatibility.
         */
        substream->no_mmap_ctrl = 1;

It does not clear any such flags. If there will be separate bits
for data and "status/control", should they be cleared here too?

What will happen if fd is opened in 64-bit process and then
process will exec a 32-bit one, _after_ doing ioctl
but _before_ mmap?! substream->no_mmap_ctrl will remain cleared.
Looks disastrous.

And still _now_ there is only one bit. Does it mean
"mmap works on data and status/control" or 
"mmap works on data and _maybe_ on status/control"?

Another matter. IIRC this mmap is not to the hardware
(hardware memory-mapped structures won't change layout when one
replaces 32bit kernel by 64bit one) but to some software alsa
structure. Can it be made more clever in this case, like
using 32bit structure for 32bit tasks? Or allowing 32bit tasks
to detect that structure is 64bit and they should use it?
Second one sounds saner.

Looks like real mess to me.
--
vda
