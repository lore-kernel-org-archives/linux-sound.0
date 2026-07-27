Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6F3BFE5B
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143196; cv=none; b=WpSoedw4T878RnvxUD7mDqVpes1Amq5FUwc6K5bU2zClf/X6JrJ/Rusn+vG4hQrmsdXJzwun4hbDklHF6qmznjIqRDd2kIVYmh+XYMrFt//KqQ2LtlBnodu2/NHE6r/xF1ZSk+t+W71Ta9+hzHgqlSjA7wiXdpcHa6tR1NW/m1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143196; c=relaxed/simple;
	bh=uKTi0I84lzFUl/lmRkrVnGeLZroDvU+ZEm8r7W0X1N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzT7hrRdTIFh8uLOwWoshEO56p66zaKBekble3ruO7BJWeBVd5UkUxyKzqWG/IHLib6L1IMQB3kXufnZLnot2ISJTJKUQKJRwSnfzGP+d5y7i9HYutifSofGcmRPLpeaoakDVnUNASy4IlBs1AQPk6fhNBYUFVKAgZPwPJxZDYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fz82rXOj; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fz82rXOj"
Message-ID: <18763b90-1ae2-4c6d-a787-b39cccbee0ea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785143190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apKAFmPJTpgSBScIjklW7z6GbFZ04hHcvsKfool2oSI=;
	b=fz82rXOjWFTpIaEWAJ+fHN+hS1j3zgMHnnX34FW9aaQGefeRPZ1ZiW55pZ6OegpUEu3Qe/
	BnxHVTosr6hweXaSLVDJPWeOLquCCoeq+snp2nUP0T0CnEaPRckR5B+lCPXgegkM43ZtZu
	Ktkny6u0KjkTo4vvXism6LFlFYW9nRA=
Date: Mon, 27 Jul 2026 11:06:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: tas2783-sdw: drop stale regcache on uninitialized
 re-attach
To: Andrey Golovko <andrey.golovko@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Antoine Monnet <antoine@montane.tech>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <bb5064629ada99fa5163621f72fbd27f@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <bb5064629ada99fa5163621f72fbd27f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/27/26 10:35, Andrey Golovko wrote:
> When the peripheral re-attaches after the SoundWire controller was
> power-gated during system suspend (s2idle reaching S0i3 on AMD ACP), the
> amplifier has lost all of its register and DSP state. tas_update_status()
> handles that by re-running tas_io_init(), which soft-resets the device
> and re-downloads the firmware, but before doing so it syncs back a
> register cache that still holds the pre-suspend values.
> 
> That sync is useless, since the soft reset immediately wipes whatever it
> wrote, and it leaves the cache claiming that the amplifier is already
> powered up and unmuted. Subsequent read-modify-write updates - DAPM
> amplifier power-up, SDCA PDE transitions at stream start - then see "no
> change" and skip the hardware write. Playback runs without a single
> error while the speakers stay silent. Unbinding and rebinding the driver
> restores audio, since probe starts from a fresh cache.
> 
> Drop the cache instead of syncing it when an uninitialized device
> attaches, so that later accesses see the real hardware state.
> regcache_mark_dirty() + regcache_sync() is not an option here: the cache
> can also hold registers outside the SDCA MBQ map, written during the
> init sequence, which the MBQ backend refuses to write back. The sync
> then fails with -EINVAL and takes initialization down with it.
> 
> Cached user settings fall back to hardware defaults across such a power
> loss, which seems clearly preferable to a silent amplifier - the device
> is being reset and its firmware reloaded at this point anyway.
> 
> Tested on an ASUS ProArt PX13 HN7306EAC (AMD Strix Halo, ACP7.0, two
> TAS2783 amplifiers plus RT721 on SoundWire link 1): the speakers work
> after an s2idle resume with ~51 s of S0i3 residency, where previously
> they stayed silent despite a complete firmware re-download.
> 
> Fixes: 4cc9bd8d7b32 ("ASoc: tas2783A: Add soundwire based codec driver")
> Reported-by: Antoine Monnet <antoine@montane.tech>
> Closes: https://lore.kernel.org/all/c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech/
> Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
> ---
> Based on broonie/sound for-next (asoc-next), i.e. on top of
> 0d6b2d6f93a6 ("ASoC: codecs: tas2783-sdw: Propagate regcache_sync()
> errors"), which touches the same call site.
> 
> Tested on 7.2-rc4 plus the ACP MSI-on-resume fix 5893013efabb, which is
> a prerequisite for the peripherals to re-attach at all on this board:
> https://lore.kernel.org/all/466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech/
> 
>  sound/soc/codecs/tas2783-sdw.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
> index db58c50e8a83..e62470671951 100644
> --- a/sound/soc/codecs/tas2783-sdw.c
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -1216,7 +1216,6 @@ static s32 tas_update_status(struct sdw_slave *slave,
>  {
>  	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
>  	struct device *dev = &slave->dev;
> -	int ret;
>  
>  	dev_dbg(dev, "Peripheral status = %s",
>  		status == SDW_SLAVE_UNATTACHED ? "unattached" :
> @@ -1232,14 +1231,23 @@ static s32 tas_update_status(struct sdw_slave *slave,
>  	if (tas_dev->hw_init || tas_dev->status != SDW_SLAVE_ATTACHED)
>  		return 0;
>  
> -	/* updated the cache data to device */
>  	regcache_cache_only(tas_dev->regmap, false);
> -	ret = regcache_sync(tas_dev->regmap);
> -	if (ret) {
> -		regcache_cache_only(tas_dev->regmap, true);
> -		regcache_mark_dirty(tas_dev->regmap);
> -		return ret;
> -	}

Agree that this sequence didn't make sense, but you have a set of
comments below that could be clearer.

> +
> +	/*
> +	 * The device is attaching uninitialized: either this is the first
> +	 * attach, or it lost power (and with it all register and DSP state)
> +	 * while the controller was power-gated during system suspend. The
> +	 * cache still holds the pre-suspend values, and tas_io_init() below
> +	 * soft-resets the device anyway, so syncing it back is both useless

you may want to clarify what 'soft-reset' means. This isn't a SoundWire
term, all forms of reset defined in the standard will require
re-enumeration. Some devices from Cirrus Logic perform a 'device reset'
and a second enumeration, if that was the case here then you could
end-up in a boot loop.

> +	 * and harmful: later read-modify-write updates would compare against
> +	 * stale data and skip the hardware write.
> +	 *
> +	 * Drop the cache instead, so that subsequent accesses see the real
> +	 * hardware state. regcache_mark_dirty() + regcache_sync() cannot be
> +	 * used here: the cache may hold registers outside the SDCA MBQ map,
> +	 * which the MBQ backend refuses to write back.

Not following this comment, there's a single cache with specific
registers tagged as requiring the MBQ-specific sequence with multiple
ordered read/writes. it doesn't matter whether the registers are in the
MBQ area and I don't know what the 'MBQ backend' refers to.

> +	 */
> +	regcache_drop_region(tas_dev->regmap, 0, UINT_MAX);
>  
>  	/* perform I/O transfers required for Slave initialization */
>  	return tas_io_init(&slave->dev, slave);

