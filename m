Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649F31F9B3
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247356; cv=none; b=YY2Wn6ATC0jKpOoJpMX/eTV6segDTs+rP/XkHu4NZ2dchvueDsA5nJNuXAXTwFB9zJzqskGSQnJpLpJ5btsTKdCyllyouQHwSoLlMwCCUQOAUN4q/GUJycntx+U8XUgmGB7bgGM+MEflXAtXw2LzasFYrSr5AW/KcGPR2cI1334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247356; c=relaxed/simple;
	bh=ei3iX3ty2QTKGrneUh1zGDNiz5REpPaYbzRa82q2ktU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOI7S30nJmuMlzyNNrHeJQuEuE5uMZHYVfWuOtFZFlUzyDzVEf0Hvb/aPloIkshTNwGtKrM8q0qVkn+sLvCkKLaCZ3AFBmIfdglfyV620blV3vM9sgVfj6RJAp2uQPidCwyrinwJhXmZiGuB/K4VJNhQjgKExFRma0ywrXVps78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4j6okT6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4j6okT6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba6485d219so30849455ad.3
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779247354; x=1779852154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gOzexMH2hKgTQUFcH3tXXCOgRhXYCHTHpvXFLrrJNg=;
        b=n4j6okT6iZrxG5PxQSFIqhsUA+Zyt87M+xftp/4pjUAMRU2jotFvkq5d3DShCuBeyB
         jZHm7iU6cYjMPepH12ygqLjsdlT6RLFLae67iu/xdb5u6PmaCsvR71nhoy35xcEz67u8
         Nolgqd3cra4R8tqzJPsyC6U67AmVv339AENSq97jWrdhlSmC2gvX0qVgSRLBG8UKyYTs
         YFuhBClk7stFmz3AQImMx3K98t9ivx1a9GCOJvZi1c8Va0jRdPfd7y3j+AYcP56ZIbU/
         JAR3Uu0THvGiWjfYVoW2GFGENzRXrUJol47yZDWvbHkP15yLZkcSmgnKDZLyGB5hL8A3
         i1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779247354; x=1779852154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gOzexMH2hKgTQUFcH3tXXCOgRhXYCHTHpvXFLrrJNg=;
        b=IZNEPyecFwtvQ2/xf1OMEBqRAGFLPSJucMTXQMMvYRfFRTf8WiVcBWP7wh6NGhdTh+
         bLGdjdBmGnUwZ4eLWKJcOZNkVd5mANWokGk9s/84fYZVxpNt/3KHT3G+p133R4YuI9Qi
         clmHp+U3uPqho0IbDUE3XoTUwiokVRFutej4DaU1eSms6B389zwGWGZ8vhDtTmLIgwL8
         mOqNxOCLC7WAqZtgi8Jy71aHEXSPz2rY137q8d118qZxqNyVH+/ufGZaAhjLVynNPXMn
         eaLoaY4xuRRfLp8RoTqjktMINByapzOlCxorWDIIbRaeLP5g9gmKRHeps944+wZ8m+zV
         5D0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9nVdL+vPM+blYGMlOJsonLbXVAunPZukc5T4Lnj9dK24wn3EqE8yfKKwKv3TU+MNLwzYVH/Azly0As5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUwuQmlSKF4GcPZD4TryLjz0ZVVqqLOkmJnnlqRCGL8ZwrPfJ
	cFeWwT1i7cX6tV/TB1ioc9hdYMeUZOPMyK/233XGBNHBTtNlQixwarQc
X-Gm-Gg: Acq92OFkFXUotFZs/iGmdJbQljHxvGeI0RKiLV9Vl7F6jzNDWIhu8jSeVZ6Te912gpB
	fxmJh3C7NJR07wSVuTrn+sLfnUL+CmVQrVHrMYGEp7VMYxK06RuXjbX03kYKdRFk4KiXPUc0T5g
	E2SEjKyl3j1iQrFpJpFxJ5LlGWbfrCM632OHGEhw05hTDnrO3l459XcDUk04qNBufI8ZyHazeox
	bn8L86YQD/S7ronzSfZqIbDB0kmj6LYlWang0xYt7OrT+NiR8keBodr9KGC2vYA7LC7Nr8F3kv+
	/FkxCoP+JjgaftktH5P5reVhrLEyouCea04yxQawWHceuPa3By9u2iPmnhlbowG9MS7hZtW82pJ
	XaMj+2zBxirZBrMVVhyzPvon3NwzBm3we8nQ+1mTY0J9ofCV7G+kt8yyhg1obz6Fri+uSOuuXfe
	4MfqnNF4XVgGGtWj5W2tgOfy4akt8H3hv429NSufgcBF+9gHpx9Qk67gln84OOr1iu6h26SsjEX
	Q==
X-Received: by 2002:a17:902:d4c4:b0:2bd:93b0:2c18 with SMTP id d9443c01a7336-2bd93b02e88mr213130625ad.9.1779247354150;
        Tue, 19 May 2026 20:22:34 -0700 (PDT)
Received: from [172.20.10.2] (114-137-66-169.emome-ip.hinet.net. [114.137.66.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f8efesm208043135ad.55.2026.05.19.20.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:22:33 -0700 (PDT)
Message-ID: <8ae73a03-fd23-307f-8e0b-7145f2090151@gmail.com>
Date: Wed, 20 May 2026 11:22:29 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-3-YLCHANG2@nuvoton.com>
 <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/18/26 19:35, Mark Brown wrote:
> On Mon, May 18, 2026 at 10:47:04AM +0800, Neo Chang wrote:
>
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> ---
>>   sound/soc/codecs/nau8360-dsp.c |  704 ++++++++++
>>   sound/soc/codecs/nau8360-dsp.h |  117 ++
>>   sound/soc/codecs/nau8360.c     | 2334 ++++++++++++++++++++++++++++++++
>>   sound/soc/codecs/nau8360.h     |  904 +++++++++++++
>>   4 files changed, 4059 insertions(+)
> There's no update to the build system, this can't have been tested.
Thanks for catching this. I will update the Kconfig and Makefile in v3.
>
>> --- /dev/null
>> +++ b/sound/soc/codecs/nau8360-dsp.c
>> @@ -0,0 +1,704 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * The NAU83G60 Stereo Class-D Amplifier with DSP and I/V-sense driver.
> Please make the entire comment a C++ one so things look more
> intentional.
Got it. I will change it in v3.
>
>> +static int nau8360_reply_from_dsp(struct snd_soc_component *component,
>> +	const struct nau8360_cmd_info *cmd_info, int data_size,
>> +	void *data, unsigned short dsp_addr)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct device *dev = component->dev;
>> +	unsigned int payload, *data_buf;
>> +	int i, j, ret, frag_len, frag_payload_len, data_count, len_pos, pad_len,
>> +		pad_len_exp;
>> +	frag_payload_len = frag_len - 1;
>> +	if (cmd_info->msg_param)
>> +		data_count = data_size;
> This is the only place where we initialise data_count.
Got it. I will initialize data_count to 0 here in v3.
>
>> +	/* check the reply length same as request */
>> +	if (data_count && (cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_RSLTS ||
>> +			cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_SETUP)) {
>> +		dev_warn(dev, "payload_len %d, expected %d",
>> +			data_size - data_count, data_size);
>> +	}
> but we use it unconditionally here.
>
>> +static bool nau8360_volatile_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case NAU8360_R00_SOFTWARE_RST ... NAU8360_R02_I2C_ADDR:
>> +	case NAU8360_R06_INT_CLR_STATUS:
>> +	case NAU8360_R21_VBAT_READOUT ... NAU8360_R22_TEMP_READOUT:
>> +	case NAU8360_R41_CLK_CTL2:
>> +	case NAU8360_R46_I2C_DEVICE_ID:
> Are the I2C addresss and device ID volatile or do they just not have
> defaults?
For NAU8360_R02_I2C_ADDR, it requires a write operation to latch the I2C 
device address.
For NAU8360_R46_I2C_DEVICE_ID, although it is read-only, its value is 
determined by the hardware configuration
of the GPIO1 and GPIO2 pins at boot (e.g., 0x1a, 0x1b, 0x4a, or 0x4b).
>
>> +static int nau8360_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
>> +	unsigned int rx_mask, int slots, int slot_width)
>> +{
>> +	struct snd_soc_component *cp = dai->component;
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	unsigned int tx_slot_used = 0, rx_slot_used = 0;
>> +	int i, func_slot;
>> +
>> +	if (!rx_mask)
>> +		return -EINVAL;
> Specifying no slots should really be accepted as disabling TDM.
Since our TDM and standard I2S share the same hardware enable/disable 
registers,
we cannot completely disable the interface here.
I will change this to bypass the TDM slot configuration and simply 
return 0 when rx_mask is 0.
>
>> +	if (source == NAU8360_CLK_SRC_MCLK)
>> +		value = NAU8360_MCLK_SEL_MCLK;
>> +	else if (source == NAU8360_CLK_SRC_PLL)
>> +		value = NAU8360_MCLK_SEL_PLL;
>> +	else
>> +		goto err;
> This should be a switch statement rather than a cascade of if
> statements.  Thre's a number of other examples of this.
Got it. I will fix it in v3.
>
>> +	/* defalut disable Sense signal after booting */
> Typo of default.
I will fix it in v3.
>
>> +	/* Set HW2 default volume */
>> +	regmap_write(regmap, NAU8360_R97_HW2_CTL7, 0xbf66);
>> +	regmap_write(regmap, NAU8360_R98_HW2_CTL8, 0xbf66);
> Most user visible controls like volumes should be left at the hardware
> defaults, that avoids encoding some specific use case into the driver.
The user volume is adjusted via the DSP firmware.
However, HW2 is a separate hardware gain stage that
we intentionally do not expose to user space as an ALSA control.
We have to write 0xbf66 here to set its required default value.
>
>> +	/* set GPIO3 MUX as Clock output */
>> +	regmap_write(regmap, NAU8360_R09_GP_CTRL1, 0x1e9e);
> This feels very platform specific and should be configured via DT or
> quirks.
This was only used for internal debugging of the codec chip. I will 
remove it in v3.
