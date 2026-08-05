Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E123F3277
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920729; cv=none; b=cRY/2CTNmnBOpIBzZTTScEBVKmC4LdoHcYDAOWqgYoLvJQkhpetnrYDv8jTSReN9tAH7CTg6n4/HDBXw6ugQMJ1vKomGH9DROTbk67KaplQWBS7QydvZgyU+hWdIvKjPLm+CH7S+KtWZo9QYfKVc0K/XHgz8a3ck5dPsJzT7FCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920729; c=relaxed/simple;
	bh=04zhSZ670lYOcIV4KZHkxxs+lNy0FvVzAb9cYGTI2PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKdayl3YsGwmFWv+LRGAewTbOV4SH8qpp3BCKrGsiFd5OmD3To08yyVd6e4+qxPyUfeftEBRYUtW+XTdnOIn6OnECW95EvW1m480ooCvkRVRclt4reJOiwH27LSPnRq1FR6Jy+k87QtCjjQyeM4Rl1TJcB+mkfgFBUo3mSFTPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUYWByuC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUYWByuC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3900e39d935so699307a91.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785920718; x=1786525518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpmaDgjr0urIee4VasgeTATeKfxoGE87IfxMDoS57nE=;
        b=FUYWByuCfYiQPLcAOaas+w7OYldeLeURcJmQLJuV6I3oFCjJVttVSfkmNu97TXZlEF
         N0uQ1MYs24vYQt4b/OnNSQikJm4At3ihR+ZmIhbQEou3VY6DVz05EgZ8t2EmEcQHnT7F
         rTqs+PqEY5B2KVqQZKchk05TSdmMqDQ2DI78fY1yUj7PxmpT1HYHT+SQ9EgqugkUMz/S
         h0zHqNgydsqLPAZvikOJtyrmmPs0YqlLdIrPWuXU/xcnT+7xp8rDcFT4xIYVv655uMZ+
         Vhi9gk+AZk2qToLE6c6RFEqX4whr6DOPKcpDP4yWo9MawBofj6VQTJ4UXtawoOsOy2Tw
         flvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920718; x=1786525518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpmaDgjr0urIee4VasgeTATeKfxoGE87IfxMDoS57nE=;
        b=HGALo+6e0U/qbv0eI0b0wPoiNp0m0vhf0KcLXmgwtFLsiP6ibsXGpYLpKR6ahq9rWe
         aR+Ms5lw0pzJWV1rG2EynwMFN/FMkO6bgortBIgtwGBbi7I/T/nhioEEfqq2OyoyoScY
         YPT/Mk1rT0Z9X5qA8spieN3qDWc6ecLs84BMwl+k+h2OxrHyF7BupSlo1BzyBU4tdvHc
         oO/uykjJxEt5hxw03bX4EgEwf++20KvAhOhMcQzl42Q8/fmQEyGgvUTlkgF516K5MaT9
         A6xZ9dx9CgmUmv4Rj3CYn9Wvn2yGfrlM6kSZFiSeM/w0Cf3AenPCaIDQReBVzqZB9obB
         nA9A==
X-Forwarded-Encrypted: i=1; AHgh+RpAI09zmRv6gcPlwvbgypGRcQFivWXnOpICdMDDwfA2eweoSGoQdtgQUn+xR5djPZnyPWGxS3Nk0YdD0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRaMMys8UQP3pzMZHT3qs4dYth2gxHyUFG3xAYdW1oXLUmple/
	vn2evEKg8xY2csOuHvlFtHBhOXEHI0OwC6TgKlCcALzcBCfOzknKwgvN
X-Gm-Gg: AR+sD11bKM+7ASs+p4m+Ibfn17y/C06ApAjCFZDpnuuYz/BNnTpdhgnY9yT7gYhm+Wd
	vgBI/I4+JV4xWpj6w72R83jeqi5Ei/MwMPjxfoLOYiYcqEHyQLkFtgNMPbOBiyBNSzAV878xch3
	0Gn036/eCF+Er6ABZqT+v6wbiuv3WRE6E8wHmvRolDX/vnGzNOc2oejQCQp703fPHD5tWIEyQ2O
	G3CyHocnUYJjMeRowirvYLk85Og57Sou3vv7mrr6qYLU5hI/kVyzIGYkvihv4Yp697Vny3t4qew
	E902leW4em7Q9OqsjjkrWS6JerQkPTiANli13cKHfcgHUUjoK0U2ydLKsb8yx/SYAtixB0Hg2Xy
	OK0EytKo0t6+HLRSohONd+Bfb8qHbvOyzgi04JsPC148u4YAzp+/F1vf8PUuD9JlSY3kAMW/7Z/
	g2l2IJ6wf2SataptvCg9mJUtCY3B2gmP81+uzLLTJw7HxHPPayjewAI9iuwHGy4WMHDfgsdsCB9
	zvucYlIVTU4YZXoQ4d/uQcaB+5l
X-Received: by 2002:a17:90b:2745:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3903c535d84mr6018465a91.1.1785920717467;
        Wed, 05 Aug 2026 02:05:17 -0700 (PDT)
Received: from [172.20.10.2] (114-137-35-218.emome-ip.hinet.net. [114.137.35.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903927dddbsm2516074a91.9.2026.08.05.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:05:16 -0700 (PDT)
Message-ID: <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
Date: Wed, 5 Aug 2026 17:03:01 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/4/26 23:58, Mark Brown wrote:
> On Tue, Aug 04, 2026 at 11:29:51AM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +
>> +#include <linux/delay.h>
>> +#include <linux/firmware.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <sound/soc.h>
>> +
>> +#include "nau8360-dsp.h"
>> +#include "nau8360.h"
> You use bitfield.h so a direct include would be safer.
Got it. I will add #include <linux/bitfield.h>.
>
>> +static int nau8360_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>> +{
>> +		break;
>> +	case SND_SOC_DAIFMT_LEFT_J:
>> +		ctrl_val = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_LEFT;
>> +		ctrl1_val = NAU8360_TX_OFFSET_LEFT;
>> +		break;
>> +	case SND_SOC_DAIFMT_RIGHT_J:
>> +		ctrl_val = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_RIGHT;
>> +		ctrl1_val = NAU8360_TX_OFFSET_RIGHT;
>> +		break;
> NAU8360_RX_OFFSET_LEFT and NAU8360_RX_OFFSET_RIGHT are defined
> identically, presumably at least one of them is wrong and certainly one
> of the above cases is.

Thank you for pointing out the problem. There is indeed a mistake here.

The configuration missed the left/right justify settings. I will correct 
both the register definitions and the case logic in the v8 patch.

>
>> +static int nau8360_set_sysclk(struct snd_soc_component *cp,
>> +	int clk_id, int source, unsigned int freq, int dir)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	struct device *dev = nau8360->dev;
>> +	static const char * const idtab[] = { "DIG", "ANA", "Internal" };
>> +	static const char * const srctab[] = { "MCLK", "PLL", "HIRC48M", "BCLK" };
>> +	int ret;
>> +
>> +	if (dir == SND_SOC_CLOCK_OUT) {
>> +		dev_dbg(dev, "sysclk: freq %d (out)", freq);
>> +		return nau8360_set_sysclk_output(nau8360, freq);
>> +	}
>> +
>> +	switch (clk_id) {
>> +	case NAU8360_CLK_ID_INT:
> Usually we don't have a lot of fine grained control of the internal
> clock dividers of the device, things are a lot easier when the device
> just figures out what it needs based on it's input clocks.
Thanks for the feedback.

To make sure I understand: Should we remove the internal clock IDs from 
set_sysclk and handle clock configurations automatically inside the 
codec driver?

Does this mean we should avoid configuring them via the machine driver 
entirely? If so, what is the preferred way to handle clock fallback when 
playback stops or MCLK is absent

(e.g., via PCM shutdown hooks or DAPM events)?

>
>> +static int __maybe_unused nau8360_resume(struct snd_soc_component *component)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8360->regmap;
>> +	int ret;
>> +
>> +	/* disable Sense at standby */
>> +	snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
>> +	snd_soc_dapm_sync(nau8360->dapm);
>> +
>> +	ret = nau8360_dsp_setup(component);
>> +
>> +	regcache_cache_only(regmap, false);
> We start the DSP with the device in cache only mode - that seems odd?
Got it. I will fix this in the v8 patch by disabling cache-only mode 
before DSP setup.
>
>> +static struct snd_soc_dai_driver nau8360_dai = {
>> +	.name = NAU8360_CODEC_DAI,
>> +	.playback = {
>> +		.stream_name = "Playback",
>> +		.channels_min = 1,
>> +		.channels_max = 4,
>> +		.rates = NAU8360_RATES,
>> +		.formats = NAU8360_FORMATS,
>> +	},
>> +	.capture = {
>> +		.stream_name = "Capture",
>> +		.channels_min = 1,
>> +		.channels_max = 8,
>> +		.rates = NAU8360_RATES,
>> +		.formats = NAU8360_FORMATS,
>> +	},
>> +	.ops = &nau8360_dai_ops,
>> +};
> Do you need symmetric_rates, the hw_params looks to program the same
> registers for both direction?
  Yes. Since playback and capture share the same configuration 
registers, I will add symmetric_rates in the v8 version.
