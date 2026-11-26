Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=49.12.200.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732448;
	b=vxyt03u0HJmESZtejfJncaH88p++CSrsmzYevg3PUOo2ka3VdzwARzxtqom9qcDHImWh
	 OpmVFErDxeXA+/AMjp2k39/tj6AqgguLA+lCt/INDS52L5aKHE10GR+7MLFGZYCaZjWhS
	 G+I+A/tDRyDd7FLxCnjJzJ201ZfjAdlYgwDf5kMQmMs7hac9Qw0hU7+Tg5SjmP1BXoHg7
	 0LTO9cSIlfYttp/aIuoUsiPGfRorwEz8eMYc/ISPo8MlwoZzPjfIoUuCnn05VleVjuREJ
	 HoUD1c132+cSKaUKT22eqH8gAO/NGCCX2ylVJ+zHkIyZ5EcusIAwn2oeXi/3iTOw69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732448;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Bar;
	bh=11FD/p6QINVjHDRvHXvjog2NdwJ1xN/iIY+wHcZ1uIQ=;
	b=Zs5chvSYcNomCGs48qBhYhYZaNq/fgpZ2YSx8Hp/7efUGtCOLSsxXrT5bkIeuECups4S
	 QF5ezMu0tG05RA2P2T5gbYR9HxKk667FGKCUQsyP22nE487mmskyUxOkbCpOcy7JrnfcD
	 XFz5XIcF5RkT1nL0wC6ivqWAJLAFRFszNUB71LQE9W3sqnP91TdPfWe3E2kqa91FzbMTg
	 EdiqMHW4+nOHsiNiMI2Gi8L6Sz70XtY7rAq3OucaBiCVWsL3cfdrKzTE+1enXUHSYLVKU
	 Eg595/uPus0LzHbvK7HfDuVe0J7GWdN1UTfg0rRf1otm56OgjDlAXD4BHccTxKZKGOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rondom.de;
	spf=pass smtp.mailfrom=rondom.de;
	dkim=pass header.d=rondom.de header.i=@rondom.de header.a=rsa-sha256 header.s=dkim header.b=dGANsqts;
	arc=none smtp.remote-ip=49.12.200.44
Received: from non.nonmodosedetiam.net (non.nonmodosedetiam.net [49.12.200.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C973F606A68F;
	Thu, 26 Nov 2026 22:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C973F606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rondom.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rondom.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rondom.de header.i=@rondom.de header.a=rsa-sha256 header.s=dkim header.b=dGANsqts
Message-ID: <cd519b00-247e-4dab-8b0f-b339b1908859@rondom.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rondom.de; s=dkim;
	t=1795732433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11FD/p6QINVjHDRvHXvjog2NdwJ1xN/iIY+wHcZ1uIQ=;
	b=dGANsqtsaAhnqI7KAiZcKoyfyTtO1dYGp1kz2zALU+lkIpVkKyFUDdlxUvmdbiEIBspkrJ
	XzhfVx2CZPEfHQevIXqxBgXVRjF9+yZF02P2wFWAQ5MqXz/xZ5E+0KKm+Ya9yyLiXsI7qE
	zlJeM26O4PStQupQ4GMaJ/boPa73vKRkx4mz3dleLyHqLAw130jnL1epHH47ZxLiigBdN5
	FM8DCe1+ypCAB8YayY0+39tJ992RfVS2JPKR17i+iIx/5R/BYFE6Y35/mmSlXtI8mpgyfQ
	+xFD6hii6eEEHBfKCFTyNL0lwn74JE3TSCj/4pFfJZb1EnDaQDIpIVZTInug/Q==
Authentication-Results: non.nonmodosedetiam.net;
	auth=pass smtp.mailfrom=rondom@rondom.de
Date: Thu, 26 Nov 2026 23:33:51 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/2] ASoC: airoha: Add support for AN7581 PCM driver
To: Christian Marangi <ansuelsmth@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120234640.169279-1-ansuelsmth@gmail.com>
 <20261120234640.169279-3-ansuelsmth@gmail.com>
Content-Language: en-US
From: Andreas Gnau <rondom@rondom.de>
In-Reply-To: <20261120234640.169279-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: -

Hi Christian,

On 21/11/2026 00:46, Christian Marangi wrote:
> The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
> supporting playback and capture at sample rates of 8 kHz and 16 kHz.
> The driver configures the PCM bit clock to 2.048 KHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.
> 
> Add an ASoC platform driver for the AN7581 PCM controller configured for
> ZSI attached voice chip.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   MAINTAINERS                   |   7 +
>   sound/soc/Kconfig             |   1 +
>   sound/soc/Makefile            |   1 +
>   sound/soc/airoha/Kconfig      |  11 +
>   sound/soc/airoha/Makefile     |   3 +
>   sound/soc/airoha/an7581-pcm.c | 929 ++++++++++++++++++++++++++++++++++
>   6 files changed, 952 insertions(+)
>   create mode 100644 sound/soc/airoha/Kconfig
>   create mode 100644 sound/soc/airoha/Makefile
>   create mode 100644 sound/soc/airoha/an7581-pcm.c
> 

 > <snip>

> +	if ((unsigned long)rate * channels * bit_width > AN7581_PCM_DEFAULT_BCLK * HZ_PER_KHZ) {
> +		dev_err(rtd->card->dev,
> +			"%u channels at %u Hz and %d-bit exceed %u KHz BCLK\n",
> +			channels, rate, bit_width,
> +			AN7581_PCM_DEFAULT_BCLK);
> +		mutex_unlock(&priv->user_lock);
> +		return -EINVAL;
> +	}
> +
> +	if (priv->users <= 1) {
> +		/* one bit delay for ZSI */
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_ONE_BIT_DELAY);

Sorry for coming so late with this and maybe it is not a big issue and 
maybe you already thought about this:

ZSI (Zarlink Serial Interface) is a Microsemi/Microchip/Zarlink protocol 
that multiplexes the control channel of the SLIC over the PCM pins.
Assuming that a conventionally connected SLIC (i.e. control via SPI and 
voice via plain PCM) does not require this "one bit delay for ZSI", how 
would we add support for it, without introducing a regression for 
ZSI-attached SLICs? I mean, there is nothing in the device-tree telling 
the driver that there is a SLIC attached via ZSI and this code here 
suggests that the driver hardcodes some behaviour only desired when ZSI 
rather than plain PCM+SPI is used.

Best Regards,
Andreas Gnau
