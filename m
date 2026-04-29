Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2EA33F59E
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432291; cv=none; b=DFhzALTyAmo2fhBhnYWDpE6134IgA0Sfbu0Ooi/nFT3yUwAndRQ59/hRp8QhvqKFBnFKfGhwpdySzDEC0T3U1dKO4Cph/PmlW31egRssHbaW7gAHRg4Zs55q/9lxiulXw3sCrYggBNzlUZi5MKqgcfK8taxt2Sgst8LXPihvC4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432291; c=relaxed/simple;
	bh=R0RT5BudhmrI8eGI91Vu5+RO1GtIP27et4c/aLQbjPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPDOsVGWrvNDuK2YgiAR0MVV37LiD2Vuf70MPdCJld8l04loPVCy9iJE3yuLW6HULOFVjp5xR55wpa5T7nnyUSmVB089EOOrA6vx/UuLMbGOWgsbc4kOyynXTjpuY7MTbBbFedx8RBlKponMrZDVn/a8TdF9YPEjzLzp4cJ7D0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1pcGQlj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1pcGQlj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c79467f128cso4550460a12.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777432289; x=1778037089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bDYfcj76Nr80y55FIaIDI9diKj6yFZhFoo5wVmqGbE=;
        b=J1pcGQljnmoEBI5REaynE343aYnvY7e4N9O8S5FMolVAUnREYCsHpP819aMT9hkcMA
         JS95udIz3kCU97crr95SNdeHmpzVU4ChOqbLfRE9kH1rS8Mvrtv9UeIdEmpH4HvBDcDZ
         eUFcB+I5ll4bYfeLKav0Iq/Rq5knYJ6+4kRht1IXJsCwHjruemXIGeN7LhXogJQAGWaP
         wmL6mw6Yk8swf43aJT3FTK45lIIETdnyzq5dIkVQn6BeeW1oDbF892f65iWr26arCRno
         i13B/lrj49a9/7DqwA6txmsTpyDDEhbDOiBmm4xVUt2Egz10vRwIKIiW9/O+QGl7gfsO
         1Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777432289; x=1778037089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bDYfcj76Nr80y55FIaIDI9diKj6yFZhFoo5wVmqGbE=;
        b=SlgasQvyCwLIRtczBdSf0MHecpHPQsr5IC1seDKIGomyCIY3Bm/fXDEY3afHDwsX7n
         bNzS65XQoyqPi/neCmFJRpcmTZfL7Gue8MlMSO1od57DB0dVARW0zj/e6RaccJJR4hIL
         rb+mO39R92ZVI7otCN1Ja92rexuX3X4vSxaDU+s7KCw3zcnbjbR8mBjus0M4QsrJkVeU
         CMT0/kiM4J80JeGhrXgSG8svUzVaaJdkrxvRskvn/Kr0hjBj+MfsyfANvGjOzvAzfZeE
         0BV8J8CL53G+8/2vfvbgS8dldPz7WXTnyoBrIeG7/JcBoxyS5rIY3elNfy9oXTSKZ20Q
         RZTA==
X-Forwarded-Encrypted: i=1; AFNElJ/IUrHXqpmOZ8Ak+9bfR5A/uwTwm8oCQt8WAINR+DEF4ZiLZRhtBC9UAqGc6D8mIgWmaEUxEBqgN6BIhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tC6T7w6VjlY7l2Isi8Dfdsvg855e6LYJVkMjYErusOAfrNRW
	EWB08oQ2Ud6O9N7QVCsEdjtsUj0o6YAd7mMS+932AwCNhdz7C6XNF4XtCi1nsmxA
X-Gm-Gg: AeBDietE9rr3xuRPJf+NuJnzbP8RjURr7lzk5nAFPu6mk3dIofMvLIGEbKO1U6RMPOp
	84aJMFl96oXEuIrIMQGFrdjUHufWPshAY7JOVIeULYOo3XaNmAFxREI8tl3rEM26k6GJ+3rV+Wz
	AaGxgKEduuvUoWRJYbeZ1oX3K7gmqPTODZMwloH1LCQ4TDRreUJKWTvXg+EPREcY0YJsIYv2mOR
	T5qapD+8LQmgFpL6HratcSyeNJl/89McbWCsGo/3ILYNCJ/O/Z0gSP2JjsP6YwVINILgO7Pxozp
	tx4HZwxzcr6ZlbGejhZqvcpZ+G6PJxygv2MQrlvxzUPODH3tPrYE634B3KwiJI1AQZyJmMYZGg+
	ZKFTszSZCrt+WlQVZklNktBVTvnrxkeZDUASR7KAr4jOxpM6ACXVLUH6nScjRrS8jicnQpjOco8
	y4I+bkakeyrdpzaSRTEMut+GmwWuY07nnUcu1rctkEgovRs6pc4qfcBDEgZ7LU0k8WNKFf
X-Received: by 2002:a05:6a20:2443:b0:3a0:aee6:acc3 with SMTP id adf61e73a8af0-3a3af660d37mr2332904637.38.1777432289396;
        Tue, 28 Apr 2026 20:11:29 -0700 (PDT)
Received: from [172.20.10.2] (42-79-67-210.emome-ip.hinet.net. [42.79.67.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506f0csm483483a12.27.2026.04.28.20.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:11:28 -0700 (PDT)
Message-ID: <8449eb0e-0e16-bf3e-0dc8-0b2869d75753@gmail.com>
Date: Wed, 29 Apr 2026 11:11:24 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260424033953.280520-1-YLCHANG2@nuvoton.com>
 <20260424033953.280520-3-YLCHANG2@nuvoton.com>
 <a76fe4d7-5726-41a9-b569-e676ad94f353@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <a76fe4d7-5726-41a9-b569-e676ad94f353@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/24/26 23:56, Mark Brown wrote:
> On Fri, Apr 24, 2026 at 11:39:53AM +0800, Neo Chang wrote:
>
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);
>> +	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
>> +	int i, ret, reg = nau8360_peq_regaddr(kcontrol->id.name);
>> +	__be16 *data;
>> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_TEST,
>> +		NAU8360_HW1_MEM_TEST);
>> +	for (i = 0; i < params->max / sizeof(u16); i++)
>> +		snd_soc_component_write(cp, reg + i, be16_to_cpu(*(data + i)));
>> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_TEST, 0);
>> +
>> +	kfree(data);
>> +
>> +	return 0;
> This should return 1 if the value was changed to generate notifications.
I will modify this and returns 1 when the value actually changes in v2..
>
>> +/**
>> + * nau8360_set_tdm_slot - configure DAI TDM.
>> + * @tx_mask: 4-bits value representing each active TX slots. Range: 0 (skip), 1~8. Ex.
>> + *	bit 0-3 for left AEC output channel selection
>> + *	bit 4-7 for right AEC output channel selection
>> + *	bit 8-11 for left Isense output channel selection
>> + *	bit 12-15 for right Isense output channel selection
>> + *	bit 16-19 for left Vsense output channel selection
>> + *	bit 20-23 for right Vsense output channel selection
>> + *	bit 24-27 for Junction Temperature (Tj) data output channel selection
>> + *	bit 28-31 for VBAT measured data output channel selection
>> + * @rx_mask: Bitmask representing active RX slots. Ex.
>> + *	bit 0-7 for left DAC channel source selection
>> + *	bit 8-15 for right DAC channel source selection
>> + *	bit 16-23 for left ANC channel source selection
>> + *	bit 24-31 for right ANC channel source selection
>> + *
>> + * Configures a DAI for TDM operation. Only support 8 slots TDM.
>> + */
>> +static int nau8360_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
>> +	unsigned int rx_mask, int slots, int slot_width)
> That's not the way the API is supposed to work, the mask should be which
> slots are active as a bitmask.  It looks like what you want here is a
> series of muxes which control the routing to some AIF widgets
> representing the TDM slots.
Got it. I will rework set_tdm_slot() so tx_mask and rx_mask are used 
only as active slot bitmasks.
The default routing will be TX slots for AEC and RX slots for DAC.
Slot-to-function assignment will be handled through ALSA kcontrols instead.
>
>> +static const struct regmap_config nau8360_regmap_config = {
>> +	.reg_bits = NAU8360_REG_ADDR_LEN,
>> +	.val_bits = NAU8360_REG_DATA_LEN,
>> +
>> +	.max_register = NAU8360_REG_MAX,
>> +	.readable_reg = nau8360_readable_reg,
>> +	.writeable_reg = nau8360_writeable_reg,
>> +	.volatile_reg = nau8360_volatile_reg,
>> +	.reg_read = nau8360_reg_read,
>> +	.reg_write = nau8360_reg_write,
>> +
>> +	.cache_type = REGCACHE_RBTREE,
> Use REGCACHE_MAPLE unless you've got a particular reason to use
> something else, it's a more modern data structure than _RBTREE and makes
> choices more suited to current hardware.
I will change this to REGCACHE_MAPLE in v2.
>
>> +	/* DAC gain setting 0dB by changing current cell current. */
>> +	regmap_update_bits(regmap, NAU8360_R6E_DAC_CFG0, NAU8360_DAC_CUR_MASK,
>> +		NAU8360_DAC_CUR_0DB);
> Things like gains should normally be user visible and left at the chip
> defaults, that way we're not making use case specific decisions.
Agreed. I will remove this setting and leave it at the default in v2.
>
>> +static void nau8360_read_device_properties(struct nau8360 *nau8360)
>> +{
>> +	nau8360->pbtl_enable = device_property_read_bool(dev, "nuvoton,pbtl-enable");
> This is missing from the binding documentation.
I double-checked the patch, and it seems this property is already 
documented in the YAML file.
>
>> +static int nau8360_i2c_probe(struct i2c_client *i2c)
>> +{
>> +	return snd_soc_register_component(dev, &soc_comp_dev_nau8360, &nau8360_dai, 1);
>> +}
> Nothing unregisters this, you should use devm_snd_soc_register_component()
Got it. I will switch to devm_snd_soc_register_component() in v2.
