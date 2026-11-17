Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887130;
	b=X80XA05XnW4lru0Ea/OL5GylXi3pGJeWfiV5dIqxbRvdx6DfXDX7aRpUp1qh58GCtGrq
	 ouCLmCDNdwTx8fyhUbHYSMA2gbBdCfU+wTnVrgCSjwsyUaii33z9AWprgSuLpfh1XLOCx
	 yjOYXMy0+75TjbkN+LDTr0e/F0fDepGL6xDC0pE8maKaZnJxFZ29x71jIWGktrpCAkF31
	 sTk8sp6g0j4uRgL+gG/9dF2lgLJVlf2fIlfjg+0bQ5b8Z/JvHWFvSoSUItTl1EKfiYAL6
	 N7NrFhsb6U5dZVgbFeZlumjAE/k3e44ymTgAosCzAsONmWMjyK7XxkUVB+iw9q37Emw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SAKEG6F3NngM39Nhk+BCauWEhF43gL0skdjARbMmqnM=;
	b=bKX5UtlSgn3xel64mZpDvCyH9it6GAD2f/DoBRW5ejm4lMryHvj8+9qiAhVpVbcKNa1g
	 GEBn30Cpr0S3Dkh+YyBjv8TUFf6KArPWGimCSDMeCDkkb1EcUQlyyH0IunbdTsXk0SOdC
	 +/Oj3XW8wMiqDWNu+yWWEh/Nb3dUhrw6kb6FG5aqltXIdP6aamJmgDQd0drBVEicb11rf
	 S6K8UXFC+8kUHBkk4KLTUMPz7n7Dd17RSuaotG2BhUKM2eQtR88Yz62IiGOiBoPgUqPVU
	 IgpSpo4fs3MubrbVsJKRfflZbrWuLZXZjhO/HN8g7nGHXk5hzoT+f1fAbF0GLPyRfeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MzvUyXkq;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98821606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98821606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MzvUyXkq
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso2433378a91.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 19:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887130; x=1795491930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAKEG6F3NngM39Nhk+BCauWEhF43gL0skdjARbMmqnM=;
        b=MzvUyXkq05fkt8ykpm9WoQVUTyL6RfN2TDa73jPz7H57Exgqcjjn/82HqgGoNYDEFK
         mY3ekp/BlJj7OTnU2AYCujxSO/7q5xcvDUdhYh1kr73SWdpavltfu3y+O4GRmpGn6mCW
         pn8PdQNU0GglIcY22AltsHTwz46lz2BTVhJUdcmIFBLq3aOMiFSkV0JPAA49lJV1FUcT
         gh5xASqyQOwUyrTbXdi6DosethO70grh//Iqgkx1dJ7p8LgE924Zo/dAOYHiFxzfZ88G
         7uinx7IN4YIZH4OnDdINQH9gJtMdNEJhlKLGBJlfrjSoU1M6ILcN+z9EkMB9rnNLtzWY
         Z9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887130; x=1795491930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAKEG6F3NngM39Nhk+BCauWEhF43gL0skdjARbMmqnM=;
        b=Ip5bLhDlWcKEbpHFC9/vFeE3JRm4Hz30eBe6WBAedFlbB54c1y6HcPwfs01gxxTNRx
         SIZ6MilM6sf12cwNLxt7cqflhf/kyaJGwjg97k5+s4yFb9vap814FucG9MlduFqSiX82
         pIQF3Y5aaNiTRAkGa3czFHidsnyQs28LXFhbvncKtioaUGyJE4ffwo7b0TZCRCsDOl94
         2Q8HOgWI5RLov2IjqlBNCiiDI9+RcAoz6XPBjGHaLMuhUYBpG3A3hPzBOM5/X8Iv/zyH
         OX6/7riJyR42M5feeYwFzhOWRS84S4iVb4kJJlSQILK5yfbocr7678kMjwkTS/YrB0Gy
         YeJA==
X-Forwarded-Encrypted: i=1; AL+hErFnUJ/VyQVNdwigMqqduCZJ/G2v49ue+7W5+kKqDkiMx3SBD6GAudyYSgpmm0kBlCID6GU8NzctJxuODA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zuA1mX97RXj8yLu91aqKWspMPFquRWQuMuGQ2Uz1c3sI/xr++
	vre369R3uAVDW9q4xwuS1SepQcBfpWF7et12k+VVg/4Iiqg9tpBDyf1U
X-Gm-Gg: AZFdTZcokt6OqGutTmOFycWorVCPAfKyX2FbGEnoPbVRUMy3mLL+xjA+Jzs0yTRkiIW
	HUy5SkswEqo8uIl2lUCqLL/MrvZcttSRNyBx6fJD9AancLGjVm0WwMJt1iBxTmEw3bgRvH8ZXKW
	vQ/ATMNU0FjFDp/bt7tKHMflZeEc5hZlNQaa15dx/Abh3ZYU47GourtTA3C8BgOfja/0AWTxkls
	w6jphqDe2UpRlpUFGGrnsd7f2pHmZgHUIxaI16AbprYXG0Bt3lsVdOlmzmBhN324vmUHrY3BmC0
	vy5pE0f2i3XvJCoywe7r4Dmqi89utLSGkggEnrWGfmCZh7BK0JoUjrD792l1rS4U2iJWHzny84O
	2KdawrdGZZKg3wxpSV14dp22161W2+7M//63HC4MnH8fJQSrsdGBsA0qdi95nX+jWvBbBcaYmTA
	cK8W6HsW6YQqxqCY6iq+VR8/kygZapvjoWmXNpT4MPjoV/AjvbNM6n67XyBeTUKSBa115ocgflx
	6BzigFYP7SZZ8d3MHSvWj8PjrjYwKGvE+ydgjQiDUh56xOxQZ2ML/5JE6LG3jHy1MvDbLb8bT/F
	c545wf4EA0yGR/wXTGdOOnIdApuISAQ9vikoe5z0P71pYbpjeUpMoTvr1uek
X-Received: by 2002:a17:90b:1b09:b0:3ac:a11a:7c84 with SMTP id 98e67ed59e1d1-3b1b0cccc43mr11659049a91.65.1794887129620;
        Mon, 16 Nov 2026 19:45:29 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm1720814a91.17.2026.11.16.19.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:45:29 -0800 (PST)
Message-ID: <6d7f4ecd-bac0-44d6-a704-57cdd2877729@gmail.com>
Date: Tue, 17 Nov 2026 11:38:20 +0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
 <20261109-myna-of-noble-downpour-e09d3e@quoll>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20261109-myna-of-noble-downpour-e09d3e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/9/26 21:15, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:12:51PM +0800, Neo Chang wrote:
>> +static void nau8310_init_regs(struct nau8310 *nau8310)
>> +{
>> +	struct regmap *regmap = nau8310->regmap;
>> +	unsigned int clk_det = 0, ana_ctrl = 0;
>> +
>> +	/* Latch IIC LSB value */
>> +	regmap_write(regmap, NAU8310_R02_I2C_ADDR, 0x0001);
>> +	/* Block MCLK */
>> +	regmap_update_bits(regmap, NAU8310_R04_ENA_CTRL,
>> +		NAU8310_MCLK_SEL_MASK, 0x7 << NAU8310_MCLK_SEL_SFT);
>> +	/* stall DSP */
>> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
>> +		NAU8310_DSP_RUNSTALL, NAU8310_DSP_RUNSTALL);
>> +	/* Default ADCI from slot1, ADCV from slot 0. */
>> +	regmap_update_bits(regmap, NAU8310_R0C_TDM_CTRL,
>> +		NAU8310_ADC_I_SEL_MASK | NAU8310_ADC_V_SEL_MASK,
>> +		(0x4 << NAU8310_ADC_I_SEL_SFT) | 0x4);
>> +	/* Set I-sense digital gain to +10.25dB */
>> +	regmap_update_bits(regmap, NAU8310_R14_ADC_VOL_CTRL,
>> +		NAU8310_ADC_GAIN_L_MASK | NAU8310_ADC_GAIN_R_MASK,
>> +		(0x1 << NAU8310_ADC_GAIN_L_SFT) | 0x62);
>> +	/* PGA in Class A Mode */
>> +	regmap_update_bits(regmap, NAU8310_R76_BOOST,
>> +		NAU8310_STG2_SEL_CLASSA, NAU8310_STG2_SEL_CLASSA);
>> +	/* Set I-sense PGA Bias Current to minimum,
>> +	 * Disable PGA Common Mode Lock.
>> +	 */
> Even netdev does not use that format of comments anymore. And this is
> not netdev in the first place.
Got it. I will change the multi-line comment to the standard kernel format:
/*
  * Set I-sense PGA Bias Current to minimum,
  * Disable PGA Common Mode Lock.
  */
>
> ...
>
>> +	nau8310 = devm_kzalloc(dev, sizeof(*nau8310), GFP_KERNEL);
>> +	if (!nau8310)
>> +		return -ENOMEM;
>> +
>> +	i2c_set_clientdata(i2c, nau8310);
>> +	mutex_init(&nau8310->lock);
>> +	INIT_WORK(&nau8310->load_fw_work, nau8310_load_fw_work);
>> +
>> +	nau8310->regmap = devm_regmap_init(dev, NULL, i2c, &nau8310_regmap_config);
>> +	if (IS_ERR(nau8310->regmap))
>> +		return PTR_ERR(nau8310->regmap);
>> +
>> +	nau8310->dev = dev;
>> +
>> +	nau8310_reset_chip(nau8310->regmap);
>> +	ret = regmap_read(nau8310->regmap, NAU8310_R46_I2C_DEVICE_ID, &value);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to read NAU8310/20 device id: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	nau8310->silicon_id = value & NAU8310_REG_SI_REV_MASK;
>> +	ret = nau8310_read_device_properties(nau8310);
>> +	if (ret)
>> +		return ret;
>> +
>> +	nau8310_print_device_properties(nau8310);
>> +	nau8310_init_regs(nau8310);
>> +
>> +	return devm_snd_soc_register_component(dev, &soc_comp_dev_nau8310,
>> +		&nau8310_dai, 1);
>> +}
>> +
>> +static void nau8310_i2c_remove(struct i2c_client *client)
>> +{
>> +	struct nau8310 *nau8310 = i2c_get_clientdata(client);
>> +
>> +	cancel_work_sync(&nau8310->load_fw_work);
> This looks safe, but still error-prone and discouraged. Use same order
> of cleanup as order of init/allocation in probe.
>
> See also include/linux/devm-helpers.h
Got it. I will use devm_work_autocancel() in probe instead of manual 
cancellation in remove().
>
>> +}
>> +
>> +static const struct i2c_device_id nau8310_i2c_ids[] = {
>> +	{ .name = "nau8310" },
>> +	{ .name = "nau8320" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, nau8310_i2c_ids);
>> +
>> +static const struct of_device_id nau8310_of_ids[] = {
>> +	{ .compatible = "nuvoton,nau8310" },
>> +	{ .compatible = "nuvoton,nau8320" },
> This suggests devices are compatible, but was not expressed in the
> binding (and then second entry is redundant).
I will add the actual silicon ID into the .data field of both 
i2c_device_id and of_device_id to validate it against the hardware ID in 
the probe stage.
>
> Best regards,
> Krzysztof
>
