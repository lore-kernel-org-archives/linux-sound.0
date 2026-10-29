Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240818;
	b=XW3yabsvj+h1nHsdOTyvLD9e2iMKMe8V5OnHM0WA4koceSj5BM4KmSUWhDmEXyNCuajy
	 ImClEfvxRUaGOi5RM0BvCJLstm37vkSNRmr6N+ArvijGjO95MNldTVarsxX70V0OiQDmX
	 GqQRh0ay5/hvqAC3yw6N0LevV+zfkazk1lpifWfC1U2gQHQ/7Gm+i4WawC8JkrJJboNid
	 Zc/UYl5KkerR64XBsuDURrTMxdAZV4KurQRrEoB+pFBNGIJ5gtYycqSGgpMGmJ+dZkWz0
	 FjmYi6tjW6C3U/LIKSUP6a5kxYxQY/wI/eZpVB7A7Nb0mH9MBznwSn4x+TIbAgaRcfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3AQIVWKkCVoDQO4krIZozOYGjgLAL/sNPSz96FkGeQQ=;
	b=s7zOVPuxh2GkM0rAvkVoDXTiHWuxsyWclcGBF32uEPqGbX8+fHJUDyoSrNoxLjtXqDrV
	 06I55FvKvkVeswj5QyzS9dUgoHWbOAdbznKAViBoA5jzWemNxs/wJk3h7IaK6fNSjNqtC
	 Zp9mZAIm59WGLjZeDMiQ7i2ZiIO2qky2cOWwURTHL3rFeN4hLifVABDaZQEERkzDeW3my
	 W+hix/fXZ8/e2Iv4tawahFolizNbbGCPUdp36kfvf8Gh6toB9t5DZ2NTSh3/YmmsW5lK8
	 egsUzbSpRUdMYgsyBPDA1Yx9IwImhu/DWXd8PWwm6B5tHFijGaxR+NAoVUcZ/6a/FEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYCs5a2Q;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634A606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 02:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4634A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYCs5a2Q
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3000142eec.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 19:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240817; x=1793845617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AQIVWKkCVoDQO4krIZozOYGjgLAL/sNPSz96FkGeQQ=;
        b=hYCs5a2QpeI/JDuPb6nWYmfPm1zkKWbG5Rj+68tdSyrFPHJx8TjNgnQcQpKfJV7omu
         ALqqB9NACqE+2UR0AMlIeslx8TGv5DAQUstJ1uVkelrNmMQM3DVCnu509p8S8om70+Yq
         0LprqcsGYFmHvBro0dBFYxH2uhmt4iJrYgQEMAiqS4u51/+OM+oVwxLTZhqMQHWNvp64
         hUomdJDe5HjM1xa25hcGau5Z2LNsAcZpXmHh2Oq0vQvfk45po57TDIpPd93WIyprCN1V
         zKc0xJUk0kIFleiGdwHOB1/Y4aqjBlM8Rc/+gru4z927kmBXdf7pHe/Q2ZMBRLmJRCSD
         tKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240817; x=1793845617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AQIVWKkCVoDQO4krIZozOYGjgLAL/sNPSz96FkGeQQ=;
        b=wpd6BUi4x1KZ6BOxvSn6LV1SdDy8985Y5KhVBxx0qbH5CtM/5CqmdYnKIW6buWGFlk
         yucaI9UbW/qIaqVFuK/YV+4UnjuixAHUb5Q5DKPAOOR3HXqHZC/KQlIy/1S5xpYZbMZ5
         P0+O99raNQ2drXcvvfN/HmG2tWPhak7iV3TFtrEbMT0LKkMTasGlMI8TZFD+gZYZgSzi
         /0UCa+P3oNnQrlXfoQ0MTsI350V2OtISEJ57wG8nbNnwMBcMzSXTU7+vyXeCDENZVKZc
         DjZrqmSLEEeS8+ck0BEVuZnxyK8DSnaZx19SEpNliZ/ZEPla3fuKSQkfsQ3DN+5lIIh8
         +/kw==
X-Forwarded-Encrypted: i=1; AKwUvBxSnN6/as52ALlrKAWOdjSGbkyQrjFe5XCbY9q/wKQUTt5FgYAmNPZCGnwXTsDIhMXsotHRUK7yAvRCtA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ721ZhDpcglX/OZ9NgakMs5AorJGESiAOX9KiXqTxnbQHof1mc
	O1NXrDaAM0AqmVyS7jpLN5OLANu7U+rIaJzg/l0weAe9RSzttDwRMvIi
X-Gm-Gg: AYBFou09ZnI7ZQhv+FJk6rloVEoamgQT8tjOyhqcwZejFGOLurn9FwzCkwADdR3XZQn
	bQv46CqZRoKmFFPB9oZXa/QIkeJXZOi00z/+HQmkNhWHtQgRKv0Uc9p//fBt8l2ybt7J1tprROH
	Z7nl6oKALWeWt+8Hrf0AWO/hD1VOyvSQQTrpCjIOAX0Wm6HodvcTtg+k6DXsekwWALivqPT3e3K
	UGUzpkzVxa6IX87BvbjgxaERrNlsJyn1SJtMz5Oi/wm9SOX1LjpqufYI2fJXX2D1Eqy7sjr3iyO
	K1SNfzuCQfGEzs2+t0/u56twRHtaqlQAJXY7SfsYB3RCiwtm5B4uCrKwlMainOyLVwu7qcSJ6da
	OkPeCitoJ0xAQ6P/RfX2UKRPTd0gghs4db+vEGfJx74zZ5SnqCcVYSu6ii4MmAEo9vqBIwq/nim
	VPiWaeyVQJx4VIRJmSJ0de4kH47gkPz5qRyaDMPt1l7+QbSrSJebDyslXllSmK3WWUTQYaLWtxb
	FkP8nL6evIadRxEYOj8P2fSt3uRPs7i21CemdrJLaW8bvRCnw4kQT/qiLGz9U4UAkyjoxU/Fnyg
	YrLSP3Ls/pjIX0VqaP+gXhD6lr792/2G3zPYApBTs9SU9X4at8ItKFuF1UZ8ZrLL2af2Q1/8goc
	1riek1kkpGOYPdQ==
X-Received: by 2002:a05:701b:2702:b0:151:ece6:b16b with SMTP id a92af1059eb24-1a6cd499c0bmr5014472c88.7.1793240817266;
        Wed, 28 Oct 2026 19:26:57 -0700 (PDT)
Received: from [172.20.10.2] (114-137-68-118.emome-ip.hinet.net. [114.137.68.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm11838778eec.5.2026.10.28.19.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 19:26:56 -0700 (PDT)
Message-ID: <0752dec9-2de8-43fa-931b-27e1cae6e1df@gmail.com>
Date: Thu, 29 Oct 2026 10:24:39 +0800
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
Subject: Re: [PATCH v1 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
 <20261022084037.259983-3-YLCHANG2@nuvoton.com>
 <179304693306.199157.5210648249546181520.b4-review@b4>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <179304693306.199157.5210648249546181520.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/26 04:35, Mark Brown wrote:
>> Add support for the Nuvoton NAU83G10 audio amplifier.
>> The NAU83G10 is a mono boost Class-D audio amplifier with
>> integrated DSP and I/V-sense support.
>>   	imply SND_SOC_MT6660
>>   	imply SND_SOC_NAU8315
>>   	imply SND_SOC_NAU8325
>> +	imply SND_SOC_NAU8310
> Please keep these sorted, same in other places like Makefile.
Got it. I will fix the sorting here and in the Makefile in v2.
>
>> +static void nau8310_send_data_payload(struct snd_soc_component *cp,
>> +	unsigned short dsp_addr, const void *param_data, int param_size,
>> +	int *frag_cnt, int *padding)
>> +{
>> +	const u8 *data = (const u8 *)param_data;
>> +	u32 payload = 0;
>> +	int i, data_size = 0;
>> +
>> +	for (i = 0; i < param_size; i++) {
>> +		payload |= data[i] << (data_size * 8);
> data[i] will be promoted to int which won't DTRT for values with the top
> bit set, cast to u32 before shifting.
Thanks for catching this. I will cast it to u32 before shifting in v2.
>
>> +	struct snd_soc_component *cp = snd_soc_dapm_to_component(w->dapm);
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	int ret = 0;
>> +
>> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
>> +		ret = nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_CLK_RESTART,
> This needs to take nau8310->lock to avoid races with firmware load.
Got it. I will add the lock to protect this in v2.
>
>> +	dev_info(dev, "Algorithm of DSP is ready, status %x", status);
> dev_dbg(), this will get run a lot.
I will change this to dev_dbg() in v2.
>
>> +	dev_dbg(dev, "Request firmware and wait until finish.");
>> +	ret = request_firmware(&fw, NAU8310_DSP_FIRMWARE, dev);
> We have a firmware-name in the binding, shouldn't we use it?
I will modify it to use nau8310->dsp_firmware in v2.
>
>> +err_loaded:
>> +	regmap_update_bits(regmap, NAU8310_R13_MUTE_CTRL, NAU8310_SOFT_MUTE, 0);
> Shouldn't we leave things muted?
It's redundant here. I will remove it in v2.
>
>> +static int nau8310_clkdet_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct soc_mixer_control *mc =
>> +		(struct soc_mixer_control *)kcontrol->private_value;
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
Got it. I will remove the dapm lookup function here in v2.
> This isn't a DAPM control, we can't use this lookup.
>
>> +static int nau8310_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>> +{
>> +	struct snd_soc_component *component = dai->component;
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8310->regmap;
>> +	unsigned int ctrl1_val = 0, ctrl2_val = 0;
>> +
>> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK.
I will change it to SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK in v2.
>
>> +static int nau8310_switch_internal_osc(struct snd_soc_component *cp)
>> +{
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	int ret;
>> +
>> +	/* For internal Ring OSC, the default fs apply to 48kHz */
>> +	nau8310->fs = NAU8310_DEFAULT_SAMPLE_RATE;
> This will overwrite anything set_sysclk() set, since we call this from
> _shutdown() and _resume() we're relying on the machine driver
> reconfiguring the clocks when starting streams.
Regarding `switch_internal_osc()` overwriting `set_sysclk()` states 
during suspend/resume, I'm considering two fixes:

1. Add NAU8310_CLK_INTERNAL to set_sysclk(): Standardizes and unifies 
clock setting through set_sysclk().
It sets the 48kHz internal clock here, but would still temporarily 
overwrite the nau8310->fs and mclk states during _shutdown() and _resume().
2. Pass arguments to clock_config(..., mclk, fs): Configures the 48kHz 
hardware directly via arguments, leaving the nau8310->fs and mclk states 
completely untouched.
Which approach would be preferred for upstream?
>
