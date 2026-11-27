Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757147;
	b=mWN1DZ0bs/Cgo2WgiyqHKKz7om6UKCge8punRcC7LSzB747Hr5P9E13LwOoY/ir0X5vr
	 RZJZYKffe9wh21wgB9bfRb1aUc0KJBBSN9yKfRaB7Y1g81KHdyidws8RvHYV15Fh+FtdG
	 Uqo/Hk2cZbYTMsyZxBUKxutmyGhYhTLQgAH9Ifttanm0udbnFyo450h7FM17qQOyAtIJZ
	 Szz5vZsksVayZHikVWaKuae5m/4tytP06uKquEt7ncgNT03iqari6TVspPIPQGNMN8jyR
	 NnoIxWplHcd+ReUaL0SqomCdUGrsuyZsK1Y+LgQ4Ri4olkxM0tLbPe0xzhSDgcEGFUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mA6QiuILmzYuZAEVobBo2J+8o+30ookoao4wSAO7N8E=;
	b=cyFQbdC/JAhkpHWEOM5cXyoASFX+KhM4r9EdETlGwVlM1eWKE3wYKShXGCjFhOmNM/Qe
	 2pS1u87Bw6YzuvPCh22FNo5GAHm0GM9xfUF3/pH3o4/wlVomBY4Xcl2MhzQoufjbiOaVC
	 1CmnsfwXz5X2e4hTwu8ZYg2jchX/D0+OewtDsiJwmVjLbr/AHA495+4lDN1uhmLygEb1q
	 cNr9M8F4j2923rZue3S4S83hhlttDObCP4ljbCOLURiBdAaxiHM+bI3DsEdGuJ/X+M/Ff
	 JaFQIYaAJ759fH/OsABVm8U6Vo7hSof5RVPw9N8mP4NtMjLYnwIfPJfVRx1dopRKY8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM8x5WjK;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0982F606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 05:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0982F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM8x5WjK
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04fab527eso58349555ad.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 21:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757146; x=1796361946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA6QiuILmzYuZAEVobBo2J+8o+30ookoao4wSAO7N8E=;
        b=JM8x5WjKEBMgLMs4j3PbFIYKP6179Sx9QiLdLKSsBKIxCvRNNjtOj3w3d4hMKnkuGK
         5z8fmxfq5hIVPDYhLB/kcMpZ6uo8QUo/CYsTVFLNwMlchR4qHXmpHJC4mYKiZJRi9wkA
         prQDZs5ZWz8jf3FZ0HbzxoxDsfBcs3ijj/r60jzXf/ms1qNZyPuVbVwF/P74A3UGnUZw
         mIUc8aTncPV0gAkVkx2lwHF62zpAht/1SKCV6fNqeyPj1Kyti5N0DRgAg00zV3nsy4lP
         JMsBe6YLo0EPmMNxhRnRmftjAHFifWgWgFanXvoC2kOdp7TDyNRbxDF1Qr73k+FADjqz
         JFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757146; x=1796361946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mA6QiuILmzYuZAEVobBo2J+8o+30ookoao4wSAO7N8E=;
        b=fTpEWaiFOVlazh9Fw8/nRUlc4PMncX2zCELm/qi8Cj7TcnEyjVFc9c+auQe7g83l7Y
         nECMCp4Z+LU6psP8j/MBXfZkSS0wsNSDPHVys8dD8RCf/ZF8YnpRnoiJd4C/LCxulsND
         2c5V+i4yCXYIXZoA5JA0/X3Rbe4KbWx4P1rUbreL3Wh42EvULlqwPEeXIeXtuDLV2l9t
         bFfANi1kAQnXtnOFtoZbRZdLSvwsjrhltZ4kQxATI2sRXB7l7o6QBPovSZwdQDsGxXIC
         4AbjWcdCuIPlmLHkYdg3urCQbxoD2eEISXESY2Hr8ggr3te+g36TKjRG1PpJof4czOFz
         wuYg==
X-Forwarded-Encrypted: i=1; AL+hErGHe3H7FJ2rgguBmvnNLNNYUNsciRtqMSFPmWhPysPZ7hA+/oLCzLj0mpb4OVj22VnzPoIsenOW23kbYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SmeFUE2CkqEatHS2ew+fg87FPzE0TQW7AvAodgVdykkuafdP2
	dQpb2tYs+BH/WxfCctglmpFL/kgc0JA5TxjXGVcr1GvDDTMRLPsl1MT5
X-Gm-Gg: AZFdTZcJnqY0QrutbyQpSnE9uKKzxraH84K58XmSlQmjqnW3kktI2bapZ6AGqsaWUdX
	7uWbwAe0XCzW3QEg1mA0wJqwxbIqxeruSIxiNgGAsx+H/IIGNBJ8jqOZo2Dxn7qw2YBup/B2HQl
	V/3sSvzMxSsuUBYYhAUwZ52kLvW1oBVGbVOQjH2u+M1zxCu6qE1twuI/nA1woqPpOynVcefGjXu
	uCwfksTHSl2K5sjudFp/LuJ/iUA0mhaH//MHMXJ/Dw5mPGKuH+/MW0+F0UujPoWK1Vl9tLhxksv
	r/uIinxoC1wuM9pjrV8TxiJ5ORjE5Wr5Ut9x8cCJUV2cFE52zHzRM4mqf7BQ37Q245tEgTDPV+l
	WEuY0zznQmJPrUfuMFoobjY8VkEUKNneH+O7RNvd7fPLaJqUTELIGqcGOn3iV3JA9M25wKmCHuz
	s3DTC4RCV3YoQKTtllXLvoQdHxyKb1vK13O/k56bZ73kXOiprEJbG1B1g8wOsCNDCgz2aluC/cj
	IuRewfcNtNrgqAsY8LzE1dEDRIY9UUy5vB9AnUNx17YXN9gcW1R8vjgUh2wP8+8JuTOnfvHlfex
	wkfI3wzVO+qx8SUGotAm26V/XFDt4RAaCATizPbZLlD65U9sO77SIwaUX/bl2I5hpY3Cb2k=
X-Received: by 2002:a17:902:e88d:b0:2ed:916:2a98 with SMTP id d9443c01a7336-2f03f23e4bcmr265847965ad.45.1795757146399;
        Thu, 26 Nov 2026 21:25:46 -0800 (PST)
Received: from [172.20.10.2] (114-137-215-192.emome-ip.hinet.net. [114.137.215.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm115245545ad.5.2026.11.26.21.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:25:45 -0800 (PST)
Message-ID: <9814e94e-539b-4729-9cbf-4642ea15e64d@gmail.com>
Date: Fri, 27 Nov 2026 13:23:25 +0800
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
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
 <20261118084214.527804-3-YLCHANG2@nuvoton.com>
 <179518986191.6016.16828944387493140658.b4-review@b4>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <179518986191.6016.16828944387493140658.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/26 23:51, Mark Brown wrote:
>> Add support for the Nuvoton NAU83G10/20 audio amplifier.
>> The NAU83G10 is a mono boost Class-D audio amplifier with
>> integrated DSP and I/V-sense support.
>> +static int nau8310_hw_params(struct snd_pcm_substream *substream,
>> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
>> +	struct snd_soc_component *cp = dai->component;
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	unsigned int val_len = 0;
>> +	int fs, ret;
>> +
>> +	fs = params_rate(params);
>> +	if (nau8310_dsp_active(cp) && fs != NAU8310_DEFAULT_FS) {
>> +		dev_err(nau8310->dev,
>> +			"For ROM Code revision 00, DSP only run at 48kHz.");
>> +		return -EINVAL;
>> +	}
>> +	ret = nau8310_clock_config(nau8310, fs, nau8310->mclk);
>> +	if (ret)
>> +		return -EINVAL;
> As previously noted this hosld return ret, not overwrite the value.
Got it, I will fix this in the next version.
>
>> +static int __maybe_unused nau8310_resume(struct snd_soc_component *cp)
>> +{
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	struct regmap *regmap = nau8310->regmap;
>> +	int ret = 0;
>> +
>> +	regcache_cache_only(regmap, false);
>> +	ret = regcache_sync(regmap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = nau8310_dsp_fw_load(nau8310);
> This will set the clock back to the internal clock and if we had an
> active stream nothing restores it so the audio will be broken.
I will save fs in nau8310_hw_params() and restore the previous clock
settings in nau8310_clock_event() (PRE_PMU) when a stream is active:

     case SND_SOC_DAPM_PRE_PMU:
         flush_work(&nau8310->load_fw_work);
         mutex_lock(&nau8310->lock);
         if (snd_soc_component_active(cp) && nau8310->fs && nau8310->mclk) {
             ret = nau8310_clock_config(nau8310, nau8310->fs,
                            nau8310->mclk);
             if (ret) {
                 mutex_unlock(&nau8310->lock);
                 return ret;
             }
         }
         /* Switch the clock source of DSP to MCLK. */
         regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
             NAU8310_DSP_SEL_OSC, 0);
         mutex_unlock(&nau8310->lock);
         break;
>
>> +static const struct regmap_config nau8310_regmap_config = {
>> +	.reg_bits = NAU8310_REG_ADDR_LEN,
>> +	.val_bits = NAU8310_REG_DATA_LEN,
>> +
>> +	.max_register = NAU8310_REG_MAX,
>> +	.readable_reg = nau8310_readable_reg,
>> +	.writeable_reg = nau8310_writeable_reg,
>> +	.volatile_reg = nau8310_volatile_reg,
> Does NAU8310_RF000_DSP_COMM not need to be marked as previous?
Do you mean marking it as precious using .precious_reg?
>
