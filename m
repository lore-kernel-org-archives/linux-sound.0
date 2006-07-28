From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 28 Jul 2006 10:29:20 +0000
Subject: Re: Sound problems with snd_hda on x86_64
Message-Id: <s5hr706nhtr.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <200607281216.25214.vda.linux@googlemail.com>
In-Reply-To: <200607281216.25214.vda.linux@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Vlasenko <vda.linux@googlemail.com>
Cc: Andi Kleen <ak@suse.de>, PeiSen Hou <pshou@realtek.com.tw>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

At Fri, 28 Jul 2006 12:16:25 +0200,
Denis Vlasenko wrote:
> 
> Hello,
> 
> I just built my very first 64-bit kernel for Athlon64
> and it boots and works. Thank you Andi for all your work
> on x86_64.
> 
> The only trouble so far that KDE's artsd and mplayer
> have trouble playing sound.
> 
> Strace of artsd on 32 bits:
> 
> 1762  open("/dev/snd/pcmC0D0p", O_RDWR|O_NONBLOCK) = 9
> 1762  close(8)                          = 0
> 1762  ioctl(9, AGPIOC_ACQUIRE or APM_IOC_STANDBY <unfinished ...>
> 1762  <... ioctl resumed> , 0x77c58280) = 0
> 1762  fcntl64(9, F_GETFL)               = 0x802 (flags O_RDWR|O_NONBLOCK)
> 1762  ioctl(9, AGPIOC_INFO, 0x77c5827c) = 0
> 1762  ioctl(9, AGPIOC_RELEASE or APM_IOC_SUSPEND, 0x77c58278) = 0
> 1762  mmap2(NULL, 4096, PROT_READ, MAP_SHARED, 9, 0x80000) = 0x6f85c000
> 1762  mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 9, 0x81000) = 0x6f85b000
> 
> On 64 bits:
> 
> 2203  open("/dev/snd/pcmC0D0p", O_RDWR|O_NONBLOCK) = 9
> 2203  close(8)                          = 0
> 2203  ioctl(9, AGPIOC_ACQUIRE or APM_IOC_STANDBY <unfinished ...>
> 2203  <... ioctl resumed> , 0xffa9eda0) = 0
> 2203  fcntl64(9, F_GETFL)               = 0x802 (flags O_RDWR|O_NONBLOCK)
> 2203  ioctl(9, AGPIOC_INFO, 0xffa9ed9c) = 0
> 2203  ioctl(9, AGPIOC_RELEASE or APM_IOC_SUSPEND, 0xffa9ed98) = 0
> 2203  mmap2(NULL, 4096, PROT_READ, MAP_SHARED, 9, 0x80000) = -1 ENXIO (No such device or address)
> 2203  write(2, "ALSA lib ../../../src/pcm/pcm_hw"..., 64) = 64
> 2203  write(2, "status mmap failed", 18) = 18
> 2203  write(2, ": No such device or address", 27) = 27
> 2203  write(2, "\n", 1)                 = 1
> 
> -ENXIO seems to be the thing which gives trouble.
> I think it comes from here:
> 
> --- linux-2.6.17.6.org/sound/core/pcm_native.c	2006-07-15 21:00:43.000000000 +0200
> +++ linux-2.6.17.6.src/sound/core/pcm_native.c	2006-07-27 22:27:24.000000000 +0200
> @@ -34,7 +34,7 @@
>  #include <sound/timer.h>
>  #include <sound/minors.h>
>  #include <asm/io.h>
> -
> +#define ret_ENXIO printk("return -ENXIO in %s:%s line %d\n", __FILE__, __FUNCTION__, __LINE__)
>  /*
>   *  Compatibility
>   */
> @@ -3220,17 +3220,17 @@ static int snd_pcm_mmap(struct file *fil
>  	
>  	pcm_file = file->private_data;
>  	substream = pcm_file->substream;
> -	snd_assert(substream != NULL, return -ENXIO);
> +	snd_assert(substream != NULL, ret_ENXIO; return -ENXIO);
>  
>  	offset = area->vm_pgoff << PAGE_SHIFT;
>  	switch (offset) {
>  	case SNDRV_PCM_MMAP_OFFSET_STATUS:
>  		if (substream->no_mmap_ctrl)
> -			return -ENXIO;
> +			{ret_ENXIO; return -ENXIO;} // vda: returns here
>  		return snd_pcm_mmap_status(substream, file, area);
>  	case SNDRV_PCM_MMAP_OFFSET_CONTROL:
>  		if (substream->no_mmap_ctrl)
> -			return -ENXIO;
> +			{ret_ENXIO; return -ENXIO;}
>  		return snd_pcm_mmap_control(substream, file, area);
>  	default:
>  		return snd_pcm_mmap_data(substream, file, area);
> 
> Which is, in turn, is caused by this code:
> 
> --- linux-2.6.17.6.org/sound/core/pcm_compat.c	2006-07-15 21:00:43.000000000 +0200
> +++ linux-2.6.17.6.src/sound/core/pcm_compat.c	2006-07-28 00:35:10.000000000 +0200
> @@ -478,6 +478,8 @@ static long snd_pcm_ioctl_compat(struct 
>  	 * mmap of PCM status/control records because of the size
>  	 * incompatibility.
>  	 */
> +printk("substream->no_mmap_ctrl = 1 in %s:%s line %d\n", __FILE__, __FUNCTION__, __LINE__);
> +dump_stack();
>  	substream->no_mmap_ctrl = 1;
>  
>  	switch (cmd) {
> 
> It's puzzling. Even a 486 processor, can do 64-bit operations (using cmpxchg8)
> on memory-mapped areas, why does code disallows mmap for 64-bit CPUs but allows
> for 32-bit ones?

On the contrary, the driver disallows mmap for 32bit task on 64bit
architecture.  This is because the size of the mapped record is
different between 32bit and 64bit architectures, so it cannot be
shared.


BTW, with the recent version of alsa-lib, you no longer need artsd
unless you want a network transparent.  Disable it on kde control
center.


Takashi
