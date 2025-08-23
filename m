Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675041E51D
	for <linux-sound@vger.kernel.org>; Sat, 23 Aug 2025 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755989738; cv=none; b=BgkQ+x2ORrnMSWhjH49t/IrL8z+uW75SBUPTD6WmXeXBdMGcdrSKCUfk5vJlV/kT9mGbqgNhNfheExh5/NYx2FL7vyRaumrSJoLJBg18p9rdP+m9GdYTEwNjzDV33dg+9W3ELPS9WHUugUSQwj992eFVQUKZj1ZEa8l3SSgomT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755989738; c=relaxed/simple;
	bh=oF/qgJIRFblcc7lPXX3Y+rePhLdLTPq/hUDAN/ZBFSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWPCBABSY5N6NhRzwDLFhFUq/fom7P+NpbM3AgSWTDClxuzS7/gN/83v4DOuHqeBX54Xc2252OpPVl2uGAQFT3b+LaBaUMzuffqXNVwVJB9b9WTCdeFZHKZuKIVzpO9g6JILpAWvmzhJax0aSepGc8p/7rgcHJJcM1n52RvWbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=K64lOu0C; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="K64lOu0C"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DDDC0240103
	for <linux-sound@vger.kernel.org>; Sun, 24 Aug 2025 00:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1755989727; bh=5JFP2HLD0hLEKvD+av+Zu5GQkM6XdqXHZzyl3CQ0ER4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=K64lOu0CKY7CyZHrtc1zDlsTQHmFN2D4e+nASwRQJF0gzvswI1vUvd+BGu90XskCa
	 ijYYT4bARMmK6XaiuDLHjL/HfCRA8IAG+RqRXfY13E1lbS4wMGLOMoIrcCjJeL/P00
	 vq4NauxO4B1QCUkf++9rGnUCAASWTXTsztgYRhbfvuJc+rkxpi5PRgbV+JsVyrmpwm
	 byi6nUxWrJTCZuI0wOry2O86OvejwFEbZdGDdDzG7wpPUM+i6N852t7AkvBfthIYMY
	 2xy9PsB4UAZ5bKiS2c5QgsrWB93shlCflpj0KsKVPhjz2sUEqVDNiqhXwiwtaXU070
	 7MIj89kFIwoaw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4c8XTC1NSZz9rxN;
	Sun, 24 Aug 2025 00:55:27 +0200 (CEST)
Date: Sat, 23 Aug 2025 22:55:27 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: soc-core: care NULL dirver name on
 snd_soc_lookup_component_nolocked()
Message-ID: <aKpG3oy_uY3Z1Myl@probook>
References: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
 <87ect8ysv8.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ect8ysv8.wl-kuninori.morimoto.gx@renesas.com>

Hello,

On Tue, Aug 19, 2025 at 01:58:51AM +0000, Kuninori Morimoto wrote:
> soc-generic-dmaengine-pcm.c uses same dev for both CPU and Platform.
> In such case, CPU component driver might not have driver->name, then
> snd_soc_lookup_component_nolocked() will be NULL pointer access error.
> Care NULL driver name.
> 
> 	Call trace:
> 	 strcmp from snd_soc_lookup_component_nolocked+0x64/0xa4
> 	 snd_soc_lookup_component_nolocked from snd_soc_unregister_component_by_driver+0x2c/0x44
> 	 snd_soc_unregister_component_by_driver from snd_dmaengine_pcm_unregister+0x28/0x64
> 	 snd_dmaengine_pcm_unregister from devres_release_all+0x98/0xfc
> 	 devres_release_all from device_unbind_cleanup+0xc/0x60
> 	 device_unbind_cleanup from really_probe+0x220/0x2c8
> 	 really_probe from __driver_probe_device+0x88/0x1a0
> 	 __driver_probe_device from driver_probe_device+0x30/0x110
> 	driver_probe_device from __driver_attach+0x90/0x178
> 	__driver_attach from bus_for_each_dev+0x7c/0xcc
> 	bus_for_each_dev from bus_add_driver+0xcc/0x1ec
> 	bus_add_driver from driver_register+0x80/0x11c
> 	driver_register from do_one_initcall+0x58/0x23c
> 	do_one_initcall from kernel_init_freeable+0x198/0x1f4
> 	kernel_init_freeable from kernel_init+0x1c/0x12c
> 	kernel_init from ret_from_fork+0x14/0x28
> 
> Fixes: 144d6dfc7482 ("ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()")
> Reported-by: J. Neuschäfer <j.ne@posteo.net>
> Closes: https://lore.kernel.org/r/aJb311bMDc9x-dpW@probook
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

I can confirm that this patch (applied on top of v6.17-rc1) fixes the
NULL deref that I reported.

Tested-by: J. Neuschäfer <j.ne@posteo.net>

Thank you!


>  sound/soc/soc-core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 37bc5867f81d4..c1cf205e05569 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -375,8 +375,9 @@ struct snd_soc_component
>  	for_each_component(component) {
>  		if ((dev == component->dev) &&
>  		    (!driver_name ||
> -		     (driver_name == component->driver->name) ||
> -		     (strcmp(component->driver->name, driver_name) == 0))) {
> +		     (component->driver->name &&
> +		      ((component->driver->name == driver_name) ||
> +		       (strcmp(component->driver->name, driver_name) == 0))))) {
>  			found_component = component;
>  			break;
>  		}
> -- 
> 2.43.0
> 
