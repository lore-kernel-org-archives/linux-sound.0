Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596258;
	b=K6AHDaSc8sarZz8Y2hTK9Ce2Rx9jBNJ8liDp/LIU0ivhxtdFAL3ZGU64V1Q9oB7LMQXx
	 O/VkGTmkpkPZ/QfKg9BbLvNXJvTXOpl1Tp8A1gsX6rLa6t1lqxTgOF1gMRKLSYqHn86/U
	 KpkmCwvPWAbDyOCqIZ2GwFL6fNO109hFuYN0xX471EZYWPe+CQl4Q+YZMmM/X6anDENvV
	 TQXf3N6V6OKlV+S81vJ0wV/JCxUvhOxZor7Y1lVX7ZbkPj4qUfDOuzIOQrmd+GH8T6FUz
	 4cJO3xeKAqHfk4JJVD0Hnq71CWqACfTkOHYKwzUJh1XONiV/yQpsQuVQO+BULFMI+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596258;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9txiQhFsAc5lpXqjWnDI1Of79JesrNWnjgnER07Il5g=;
	b=FVDfhCFW4OdycAqP6YMKcXCWQBNQoE+1cf70vQHKU0+Dyo5/DsDtao5iy8mJpfpS/MHx
	 +E/zVB24cSbTYt3aTjLYgDEi/t0G4GvFdnHnVaspyK/LCTAfOPYoBPLMtngrP/M3GdZEo
	 00wAc9/KFI3lX10LUlOgging+fjaFIP6E5hjdI3mxri2M1QeO9pp2g603u59JFF70R7cX
	 2f1RIhxlKN5P82QjjrlKqtX5SOtSmp7VDp+Uv7fPgextkDu1Wid9i2fvKVMu+11XFoA94
	 CfjgfkhifKZ7an/ttxDRCebXLzKWis5CMXhWjwjENUFJmZJ/qEEycsW0JRYIb9qGa9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hh+9sNWc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D5606A322
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hh+9sNWc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC191F000C1;
	Wed, 21 Oct 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792596257;
	bh=9txiQhFsAc5lpXqjWnDI1Of79JesrNWnjgnER07Il5g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hh+9sNWcMQRTwZEjerDW6abMjq6TQ5hRNtjJzbqxmctDdtkz0ZlaY1mxC+2YhSpiG
	 6ukdDDCTjQVrdn7URMSmJTUclm8d47fOX5CU1tRhC4FgTLTpGZdB8oYCMejCtzzK/P
	 iXDXD2n0VHNCfkMG28oHJrHyYOpJyECi1hIAxQnynuHm2pZ0QujpeprgK57wchmT5l
	 oA5OYjUseq+dI4mQUR2wDyWgOwK3U7nfyD5uZ7gBYOrANCGTCH5nx3NV+W51di4y40
	 +Qb4Dz6vSDLh7B3CompOcKsfYRaGlqTKOWhXdm1zpzsWJ9ITxWkYqtqFXA2rWx7pXm
	 naNirimeGg03g==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] ASoC: wm8994: fix MCLK gating for AIF clocks
 sourced from MCLK2
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>, 
 Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261021101750.3297770-2-m.szyprowski@samsung.com>
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
 <CGME20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225@eucas1p1.samsung.com>
 <20261021101750.3297770-2-m.szyprowski@samsung.com>
Date: Wed, 21 Oct 2026 16:24:09 +0100
Message-Id: <179259624950.3850049.8779907786890839069.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3685; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TJvc8wcix9vnn60tMxYRSSZ4eqoyJC8r3SYpYfr0cuw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJu3JRd7lJZ/PjrBs4PRVlLQh6sUVEsv/I372qJVqaHm
 vWFy/NEOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRUilGhucRQUqp6xc7sO17
 uE9R+bWz8WbvP56f9jY08WYElh/ju8jwP6sz8Ii+Q1KgTNIbJ+FKJeevlVw3Wc7c2VRozdfUsfw
 pKwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> aif_mclk_set() masks the AIFnCLK_SRC field of the AIFn clocking
> register, but compares the result with unshifted field values. The
> MCLK2 source (0x08) therefore never matches, so MCLK2 is never enabled
> for an AIF clocked from it, and the AIF relies on other users of that
> clock to keep it running.
> 
> On the Exynos4412 Trats2 board, AIF1 and SYSCLK run from MCLK2, the
> 32768Hz PMIC clock, while the codec is idle. That clock is shared with
> the WLAN and Bluetooth chips, which enable it only once their drivers
> are loaded. Until then the codec runs from a stopped clock: FLL1 fails
> to lock when configured from that state, and the codec floods the
> kernel log with FIFO error interrupts once a digital path is powered
> up:
> 
>  wm8994-codec wm8994-codec: Timed out waiting for FLL lock
>  wm8994-codec wm8994-codec: FIFO error
> 
> Booting with clk_ignore_unused, which keeps that clock running from
> the bootloader, makes both issues disappear.
> 
> Fixing just the comparison is not enough. The AIF clock source can
> be changed while the AIF clock is running, for example the Midas
> machine driver switches AIF1 between MCLK2 and FLL1 while AIF1CLK is
> kept enabled for jack detection. Looking up the clock again on disable
> can then release a different MCLK than the one enabled, leaking the
> enable count of one clock and underflowing the other.
> 
> Shift the field value before decoding it, and remember which MCLK has
> been enabled for each AIF, so that the same clock is released on
> disable. While at it, report the MCLK number 1-based in the error
> message.
> 
> Fixes: 001b83d395ab ("ASoC: wm8994: Add support for MCLKn clock gating")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 28 ++++++++++++++++++----------
>  sound/soc/codecs/wm8994.h |  1 +
>  2 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index c65a7769a9d25..e21adcaf34770 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -1059,13 +1059,24 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
>  	unsigned int offset, val, clk_idx;
>  	int ret;
>  
> +	/*
> +	 * The AIF clock source may be changed while the AIF clock is
> +	 * running, so release the MCLK which has been enabled for it
> +	 * instead of the one currently selected.
> +	 */
> +	if (!enable) {
> +		clk_disable_unprepare(wm8994->aif_mclk[aif]);
> +		wm8994->aif_mclk[aif] = NULL;
> +		return 0;
> +	}
> +
>  	if (aif)
>  		offset = 4;
>  	else
>  		offset = 0;
>  
>  	val = snd_soc_component_read(component, WM8994_AIF1_CLOCKING_1 + offset);
> -	val &= WM8994_AIF1CLK_SRC_MASK;
> +	val = (val & WM8994_AIF1CLK_SRC_MASK) >> WM8994_AIF1CLK_SRC_SHIFT;
>  
>  	switch (val) {
>  	case 0:
> @@ -1078,16 +1089,13 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
>  		return 0;
>  	}
>  
> -	if (enable) {
> -		ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
> -		if (ret < 0) {
> -			dev_err(component->dev,	"Failed to enable MCLK%d\n",
> -				clk_idx);
> -			return ret;
> -		}
> -	} else {
> -		clk_disable_unprepare(wm8994->mclk[clk_idx].clk);
> +	ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
> +	if (ret < 0) {
> +		dev_err(component->dev,	"Failed to enable MCLK%d\n",
> +			clk_idx + 1);
> +		return ret;
>  	}
> +	wm8994->aif_mclk[aif] = wm8994->mclk[clk_idx].clk;

We could also have changes from configure_aif_clock() while the clock is
up.

-- 
Mark Brown <broonie@kernel.org>
