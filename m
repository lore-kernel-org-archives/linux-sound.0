Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887135;
	b=BvZOC6JJhQoKmKfcQlWHMVrw9LPae8MliGWQaRORD1IObsDE+jcv6NDN+iOunrgh+FhX
	 DTS4PMsJHWRO5UOJ7QVw+TuHK7aNjCL2L8s7l5oP/+L56nTyubMw88LJSPFBSqPilfxBE
	 iXTXTIrcmn4ZaGz5LX1Dr8FvjHUWT7SogZZ2fAXNppwoxz23LuFYNljsl8TtQpxrQtCM/
	 p3hT4LoE4vyaEriM2ILut0BNYiZdpG4YEEAq463LAMGjcvxsGdOHCsyOq5o/F6Gy8CQiQ
	 y34wY/I13BvEvbSF2wyz+EAUqtWWs1uUzdUFOYk58euvKlcLkd+SgGA/KTTMQVob3ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O/hLof7T98UFzgwiFM30+8SkQ46zhWKH/5V6aesQdyI=;
	b=mHFgbXM+yDZV+G1eymgH6/xXCT3BN3fwh53EXPWyDRNSsee8/sodWAbh5Y3e6engtXX1
	 /dcdMM34WejtnJeO39yp0Y2AG40JoF+gLcE5biXlXgjvPbN9nUsObM5fsnXgO9JsIyId6
	 RwH6onHLwK6CQyjQKu3+gQM8bx4QlBx3/JhYhOFzMk4AovvHDbHwHIagOUljrafaXIYvP
	 2Xn/ILAiOczhyYhDbDar9S283BzQmAeYdZ0/D9YBAfjN9II8DyQGNGE3i3+xROFbsEf6Q
	 6LHM1XsIkW4PvBbUl7dEvbQyVk/6kK0GwgkhEjkowmQu6DzCqp+j4zoIxB7GjIE7UFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGUizyGi;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEF606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGUizyGi
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5048144a91.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 19:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887134; x=1795491934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/hLof7T98UFzgwiFM30+8SkQ46zhWKH/5V6aesQdyI=;
        b=aGUizyGiGi3uLcL9QQvTy5AA2VY6Qww1sA0A4hfG4VuL3CIU9790SlCWZpqPh0I/oK
         LpJ1tBmhfFuUCQ6c/xm7YjRW1uVOYGMoJvwsDL9um2eNP0Wi+xSM7bIS0PH9rP6BhGWP
         I1VI1E2UPiBJbeF++JWJ82Ebm1q18pck+r1GrQhZp7Fdyb+QRvQhQ6E0HYfjpxuReQfE
         XrFbs/eBaTPKn/nkzsgya0Tull4U1RZ47oPCVk0skQCkkFzzx2qmROkDPf5UXmex199q
         jEH82FFZCy0c6Ys2BBfarQUYb08ijHN0Vb3oCBcFM36Vmj05KmUQN36a2gumZHN7vtAi
         zRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887134; x=1795491934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/hLof7T98UFzgwiFM30+8SkQ46zhWKH/5V6aesQdyI=;
        b=cvKQKNNBuiH2rOJjiK26LA7YC/FGBltnDtTjkft1pgzcXWGQu3sljPBazRPfHcHCp/
         QxsK1RKbFCqPJ4eGXJ6Aw9jUZpGC0mrfbyZLfuwbGdXItDuhfhag1aB3Ca96MMg8RE0e
         VLrwFYvbAYNcGIIhO6KRHTMc2G75n58q+mfl1jpaYBviNuuMv8pSccjX2zjlPqD6jjwI
         x54268/ojreNV8wOsTWsYXy5eZBXJRV9VAb+xU411MOk2OlFSD9617tWhq3fKoX9guJl
         pxV2k4anJuFEZv3mbwEcBVFa8iE5862NPLnJ/JfjCGzyxejvMRHB6GQYKufCgQqZ8S6l
         gfsQ==
X-Forwarded-Encrypted: i=1; AL+hErHngAB6aXNJrC1MwFQwOVPXYOExl65kjlpaKwWilGIVGWh8skYNXrkYu4/KR1snoHRmnrOkoUzMqMX0rA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fbw922/2KiWKVDPwEpnGThWHR6SWh/HX14BQyYQVz001WAsLg
	FV6jerMuKjmS/cmikwKeYB+0w8rAMjKRSUvytkD6Ccbs4m/ChkTmzV0S
X-Gm-Gg: AZFdTZfJi3kQtVNk9uHAS93VU7G/2um8k97bTAp5YqL5Rk863fRmP4yvhs06SuNfgXJ
	k0A4esgP06xaNqFxA2SelBVjiLiEEJxaDt2Y1f3c3GBLmYdfysGQI5joaULsk5UZciaAuRKELdK
	KgBhHQbDhwv1psAjGzMt/jhhJ9M3djoZ3AIsWA1suWDIPYkt+dYHRuF5Jisv8xAOcHMhD6n0M27
	xtv0i1n+zoLJxzs0fVSLfHhFfE0Fb8PitGWClaDQkaQV+kB/8OnJW7vYgSXNGEP/zxyGh1gocST
	VMe1KjNMkfExqc8Lo6RPq//hJOI++G99Qa0ZwuZ5Jyd3RgdAgzbfB9PyC8l1f3fjvQPciKDr1gf
	xBqy1hhOW3EKj8Q+K5IE3F9Of8k4oR2DmQkWMiGt8syIs5wXqAsZfz16tLFJxFOcZu46SQwfi2F
	fs3wPTOIztQV07kHIsbtaoozBLQ6oTNWnMMdJ7hrNFIVqpzIhN7C0yRNUAjNtt+cE9XqzEz/uLD
	E2xzhYIwH0NgZOPjWQjMKFj/auxud+hjwr96gsXR5o4k9h/yX4vf8GGUEBrGdo9MKh8m2ymOS5p
	8PMQvWj2fMPwvnNW+/IXjae3chgUiSR78OfFpozv8uMXfDlCdOhQ+YbLguqS
X-Received: by 2002:a17:90b:5105:b0:3b0:d0c5:c10e with SMTP id 98e67ed59e1d1-3b1b0b546f7mr12821409a91.17.1794887134435;
        Mon, 16 Nov 2026 19:45:34 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm1720814a91.17.2026.11.16.19.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:45:33 -0800 (PST)
Message-ID: <e87bc85d-c9e3-44b5-99e6-007944d75200@gmail.com>
Date: Tue, 17 Nov 2026 11:39:57 +0800
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
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
 <179425369963.3711751.8538085283431158098.b4-review@b4>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <179425369963.3711751.8538085283431158098.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/26 03:48, Mark Brown wrote:
>> Add support for the Nuvoton NAU83G10 audio amplifier.
>> The NAU83G10 is a mono boost Class-D audio amplifier with
>> integrated DSP and I/V-sense support.
>> +config SND_SOC_NAU8310
>> +	tristate "Nuvoton Technology Corporation NAU83G10 Mono Boosted Amplifier"
> This handles NAU83G20 as well.
Got it. I will update the config description to include NAU83G20 in the 
next version.
>
>> +static int nau8310_dsp_idle(struct snd_soc_component *cp)
>> +{
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	struct regmap *regmap = nau8310->regmap;
>> +	unsigned int idle_pattern, timeout = NAU8310_DSP_IDLE_RETRY * USEC_PER_MSEC;
>> +	int ret = 0;
>> +
>> +	ret = regmap_read_poll_timeout(regmap,
>> +		NAU8310_RF000_DSP_COMM, idle_pattern,
>> +		idle_pattern == NAU8310_DSP_COMM_IDLE_WORD, USEC_PER_MSEC, timeout);
>> +	if (ret) {
>> +		dev_err(nau8310->dev, "Timeout waiting for DSP idle state: %d", ret);
>> +		nau8310_sw_reset_chip(regmap);
> If you need to reset the chip you should probably also resync the cache,
> and there's some redundancy here with nau8310_software_reset().
This reset function only resets the internal state machines without 
clearing the register values, so a cache resync is not necessary.
I will remove the redundant function in the next version.
>
>> +int nau8310_dsp_init(struct snd_soc_component *cp)
>> +{
>> +	struct regmap *regmap = cp->regmap;
>> +
>> +	nau8310_sw_reset_chip(regmap);
>> +
>> +	/* wait for the power ready */
>> +	msleep(120);
>> +
>> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
>> +		NAU8310_DSP_RUNSTALL | NAU8310_DAC_SEL_DSP_OUT, NAU8310_DAC_SEL_DSP_OUT);
> NAU8310_DAC_SEL_DSP_OUT is used by DAPM, you might want to solve this
> the way nau8360 does.
Got it. I will remove NAU8310_DAC_SEL_DSP_OUT from here in the next version.
>
>> +static int nau8310_biq_coeff_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
>> +	struct snd_soc_component *cp = snd_soc_dapm_to_component(dapm);
> This is the same issue as was fixed in nau8310_clkdet_put() in this
> version.
Got it. I will fix it in the next version.
>
>> +	/* Boost Control Target Value Limit. 0.16 V per step. */
>> +	SOC_SINGLE("Boost Target Limit", NAU8310_R17_BOOST_CTRL1,
>> +		NAU8310_BSTLIMIT_SFT, NAU8310_BSTLIMIT_MAX, 0),
> The binding describes nuvoton,boost-target-limit/-margin as having
> 0.19V steps - either that or the comment here is wrong.
Got it. I will fix the comment/binding to match the correct value in the 
next version.
>
>> +	ret = nau8310_clock_config(nau8310, fs, nau8310->mclk);
>> +	if (ret)
>> +		return -EINVAL;
> Just return ret in case it's more descriptive.
Got it. I will return 'ret' directly instead of -EINVAL in the next version.
>
>> +static struct i2c_driver nau8310_i2c_driver = {
>> +	.driver = {
>> +		.name = "nau8310",
>> +		.of_match_table = of_match_ptr(nau8310_of_ids),
>> +		.acpi_match_table = ACPI_PTR(nau8310_acpi_match),
> We don't need the wrappers for these pointers these days.
Got it. I will remove the wrappers (of_match_ptr and ACPI_PTR) in the 
next version.
>
