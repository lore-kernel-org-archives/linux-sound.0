Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012226AD9
	for <linux-sound@vger.kernel.org>; Fri,  8 Aug 2025 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754669800; cv=none; b=azdzH3KY3PiYHI+DL37TYm//wW5QLgwEr59V8wE1epFCy17rHftAh3OsQvSds+5WZbtilVVNnPMKtxi8Vfd7Gpk90UbWZgwzbrdBHrsCYyjtvfck+x1XbEBYv+KNDigDFfvw9xKfvMFBkJ1dnUq+fuLLdEQ+LgWj0O4+E7MOvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754669800; c=relaxed/simple;
	bh=MA6l3h9duMda/gjY/m2A1KtQ9yrELgoJti4codSZP3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMhDCOHbHyulQgQstNJBK7JIGAW4su+EThP7S5Pjce5AMEt7bnqOTbMKQKzJXsSkO6UtfuVIsc53EKMedrbx6UOfpbIzyeihQSXQwL9m6G2xaQZF1VIko3fT2F+Jw0vbS6IIkcIHmg4Yo2bAfbCg108CXpxNoYgE5fEuKbh9tYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=pFmj1vpm; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="pFmj1vpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1754669249; bh=MA6l3h9duMda/gjY/m2A1KtQ9yrELgoJti4codSZP3Q=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=pFmj1vpmq1mu7Bhl9RXs2EmI+KaI7WpeEbAYgNQh4hltHIOlD8FuqNiMvEOmxckYv
	 G8vjpacmfa11xsS5hI6dvRxTd6vDuKKLlXiqblQAkodX6KTLKaHSriIMp+b9U/3cH9
	 Rt6Kz86ivLChYQwSoQFCrBLXZpWf3J7A0mQMKoXU=
Date: Fri, 8 Aug 2025 18:07:29 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: merge snd_soc_unregister_component() and
 snd_soc_unregister_component_by_driver()
Message-ID: <arxpwzu6nzgjxvsndct65ww2wz4aezb5gjdzlgr24gfx7xvyih@natjg6dg2pj6>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <87h61qy2vn.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h61qy2vn.wl-kuninori.morimoto.gx@renesas.com>

Hello,

On Mon, May 12, 2025 at 02:33:16AM +0000, Kuninori Morimoto wrote:
> We have below 2 functions, but these are very similar
> 
> (A)	snd_soc_unregister_component_by_driver()
> (B)	snd_soc_unregister_component()
> 
> (A)	void snd_soc_unregister_component_by_driver(...)
> 	{
> 		...
> 
> (a)		mutex_lock(&client_mutex);
>  ^ (X)		component = snd_soc_lookup_component_nolocked(dev, component_driver->name);
>  |		if (!component)					   ^^^^^^^^^^^^^^^^^^^^^^
>  |			goto out;
> (b)
>  |		snd_soc_del_component_unlocked(component);
>  v
> 	out:
> (c)		mutex_unlock(&client_mutex);
> 	}
> 
> (B)	void snd_soc_unregister_component_by_driver(...)
> 	{
> (a)		mutex_lock(&client_mutex);
>  ^		while (1) {
>  | (X)			struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, NULL);
>  |												     ^^^^
> (b)			if (!component)
>  |				break;
>  |
>  |			snd_soc_del_component_unlocked(component);
>  v		}
> (c)		mutex_unlock(&client_mutex);
> 	}
> 
> Both are calling lock (a), find component and remove it (b), and
> unlock (c). The big diff is whether use driver name for lookup() or
> not (X).
> 
> Merge these into snd_soc_unregister_component_by_driver() (B), and
> snd_soc_unregister_component_by_driver() (A) can be macro.

This patch creates a boot failure on Orange Pi PC / Allwinner H3 based board.
Reverting it fixes the boot failure.

At first glance the crash is because the logic in snd_soc_lookup_component_nolocked()

	found_component = NULL;
	for_each_component(component) {
		if ((dev == component->dev) &&
		    (!driver_name ||
		     (driver_name == component->driver->name) ||
		     (strcmp(component->driver->name, driver_name) == 0))) {
			found_component = component;
			break;
		}
	}

Is now called with driver_name != NULL, and this results in crashes when
component->driver->name is NULL, which it is for a lot of drivers.

I guess maybe the issue is in snd_soc_lookup_component_nolocked() which is
just revealed by this patch, and that's that it does not deal with a common
case of component->driver->name being NULL?

Not sure what the fix would be... skip the component if it does not have
driver->name?

Any ideas?

Kind regards,
	o.


Part of kernel log:

sun8i-ce 1c15000.crypto: Register ecb(des3_ede)
sun8i-ce 1c15000.crypto: CryptoEngine Die ID 1
hid: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
cedrus 1c0e000.video-codec: Device registered as /dev/video0
hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 (8000000f) counters available
gnss: GNSS driver registered with major 240
usbcore: registered new interface driver snd-usb-audio
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
[00000000] *pgd=80000040004003, *pmd=00000000
Internal error: Oops: 206 [#1] SMP ARM
Modules linked in:
CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-00522-ge8999fdab5a6 #9 NONE 
Hardware name: Allwinner sun8i Family
PC is at strcmp+0x0/0x34
LR is at snd_soc_lookup_component_nolocked+0x64/0xa4
pc : [<c1168ae0>]    lr : [<c0d286ec>]    psr: 00000013
sp : f0821df8  ip : 00000000  fp : c187928c
r10: 00000006  r9 : c1862d54  r8 : 0000001b
r7 : c155fd34  r6 : c20f8410  r5 : c1ae3994  r4 : c3477140
r3 : c130de1c  r2 : 0000006e  r1 : c155fd34  r0 : 00000000
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 30c5387d  Table: 40003000  DAC: 91f70c0b
Register r0 information: NULL pointer
Register r1 information: non-slab/vmalloc memory
Register r2 information: non-paged memory
Register r3 information: non-slab/vmalloc memory
Register r4 information: slab kmalloc-256 start c3477100 pointer offset 64 size 256
Register r5 information: non-slab/vmalloc memory
Register r6 information: slab kmalloc-1k start c20f8400 pointer offset 16 size 1024
Register r7 information: non-slab/vmalloc memory
Register r8 information: non-paged memory
Register r9 information: non-slab/vmalloc memory
Register r10 information: non-paged memory
Register r11 information: non-slab/vmalloc memory
Register r12 information: NULL pointer
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xf0821df8 to 0xf0822000)
1de0:                                                       c155fd34 c20f8410
1e00: c20f8410 f0821e30 0000001b c0d2a578 c347730c c3477300 c20f8410 c0d3d958
1e20: c3476d00 c3476d80 c20f8410 c0a0081c c2151e40 c3477400 c20f8410 00000205
1e40: c1ae42a4 00000000 c34764b8 c09faee0 c20f8410 c09fb660 c20f8410 c1ae42a4
1e60: c20f8410 00000000 c34764b8 c09fb794 60000013 c1862d54 c1b6069c c1ae42a4
1e80: c20f8410 00000000 c34764b8 c09fb974 c20f8410 c1ae42a4 c20f8454 c2012c00
1ea0: c34764b8 c09fbbec 00000000 c1ae42a4 c09fbb5c c09f981c c2012c58 c2287fb4
1ec0: c2012c00 c1ae42a4 c3476480 00000000 c2012c00 c09fa8d8 c156060c c1836dec
1ee0: c1ae42a4 c2263300 c1836dec c20b0000 00000000 c09fc658 c1af9000 c2263300
1f00: c1836dec c02111ec c02a2dfc c15f1f7c 00000800 c2263372 00000000 00000000
1f20: 00000000 c0259b7c f0821f30 000001b7 c1522350 00000000 00000006 00000006
1f40: c2263372 c2263378 0000001e 000001b7 c2263300 000001b7 c2263300 c1862d34
1f60: c1af9000 c157ebf0 c1862d54 c1801708 00000006 00000006 00000000 c18004d4
1f80: c1174088 c1a06500 c1174088 00000000 00000000 00000000 00000000 00000000
1fa0: 00000000 c11740a0 00000000 c020015c 00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
Call trace: 
 strcmp from snd_soc_lookup_component_nolocked+0x64/0xa4
 snd_soc_lookup_component_nolocked from snd_soc_unregister_component_by_driver+0x2c/0x44
 snd_soc_unregister_component_by_driver from snd_dmaengine_pcm_unregister+0x2c/0x64
 snd_dmaengine_pcm_unregister from devres_release_all+0x88/0xe0
 devres_release_all from device_unbind_cleanup+0xc/0x60
 device_unbind_cleanup from really_probe+0x220/0x2cc
 really_probe from __driver_probe_device+0x88/0x19c
 __driver_probe_device from driver_probe_device+0x30/0x110
 driver_probe_device from __driver_attach+0x90/0x178
 __driver_attach from bus_for_each_dev+0x60/0x94
 bus_for_each_dev from bus_add_driver+0xcc/0x1ec
 bus_add_driver from driver_register+0x80/0x11c
 driver_register from do_one_initcall+0x38/0x204
 do_one_initcall from kernel_init_freeable+0x244/0x2a0
 kernel_init_freeable from kernel_init+0x18/0x138
 kernel_init from ret_from_fork+0x14/0x38
Exception stack(0xf0821fb0 to 0xf0821ff8)
1fa0:                                     00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e5e32001 e3520000 1afffffb e12fff1e (e4d03001) 
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Rebooting in 3 seconds..



> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h  |  2 +-
>  sound/soc/soc-core.c | 30 +++++-------------------------
>  2 files changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 8d113ee8c2bc8..1fffef311c413 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -444,7 +444,7 @@ int snd_soc_register_component(struct device *dev,
>  int devm_snd_soc_register_component(struct device *dev,
>  			 const struct snd_soc_component_driver *component_driver,
>  			 struct snd_soc_dai_driver *dai_drv, int num_dai);
> -void snd_soc_unregister_component(struct device *dev);
> +#define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
>  void snd_soc_unregister_component_by_driver(struct device *dev,
>  			 const struct snd_soc_component_driver *component_driver);
>  struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 39ecf0123a444..cfafdabcdc888 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2931,34 +2931,14 @@ EXPORT_SYMBOL_GPL(snd_soc_register_component);
>  void snd_soc_unregister_component_by_driver(struct device *dev,
>  					    const struct snd_soc_component_driver *component_driver)
>  {
> -	struct snd_soc_component *component;
> +	const char *driver_name = NULL;
>  
> -	if (!component_driver)
> -		return;
> +	if (component_driver)
> +		driver_name = component_driver->name;
>  
> -	mutex_lock(&client_mutex);
> -	component = snd_soc_lookup_component_nolocked(dev, component_driver->name);
> -	if (!component)
> -		goto out;
> -
> -	snd_soc_del_component_unlocked(component);
> -
> -out:
> -	mutex_unlock(&client_mutex);
> -}
> -EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
> -
> -/**
> - * snd_soc_unregister_component - Unregister all related component
> - * from the ASoC core
> - *
> - * @dev: The device to unregister
> - */
> -void snd_soc_unregister_component(struct device *dev)
> -{
>  	mutex_lock(&client_mutex);
>  	while (1) {
> -		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, NULL);
> +		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
>  
>  		if (!component)
>  			break;
> @@ -2967,7 +2947,7 @@ void snd_soc_unregister_component(struct device *dev)
>  	}
>  	mutex_unlock(&client_mutex);
>  }
> -EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
> +EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
>  
>  /* Retrieve a card's name from device tree */
>  int snd_soc_of_parse_card_name(struct snd_soc_card *card,
> -- 
> 2.43.0
> 
