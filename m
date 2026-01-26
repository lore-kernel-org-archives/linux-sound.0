Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110E20FAAB
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438784; cv=none; b=lORgIgMAr08OAAl1gt1QU43LdAVjdopfpCWVZjkzJMXwyXMnLkVjSIwkwtz0uwlVEIYLezKfPYi+hUSTEnOfxreEyb6yviiqu1PccaG8Ra9IBmKnCz6wd6bpO+7aKrsVJJAGGn7+5fl2TSXl1JOUvoUoVrRT0M9Tqn9HBmMLerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438784; c=relaxed/simple;
	bh=2IbRV9YOig8uEtdAcRc53kp6dqCuCW21kS1SlTHoqkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8LjXICqeB9plTKNwF7CRA7xPtShzEk7Ew2JSdSBGwtR4P7nMwn1Qiz4EtsCQZqpz+AreMk8KAPBKh1Eoa9p1vBCtx3KD+Fs0+oNrooRu07bey7qQDd4SJFAN9MAWspyp5kTD3/BKx9gApDZ/tSehyZRPhU0aQG5as+R2Z7b3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TDASyS/7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TDASyS/7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso46320315e9.2
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769438780; x=1770043580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pm0AyqOIj5dF9Te7g3FRe5p926c2ixXy2A4BKSh5SP8=;
        b=TDASyS/7sKqz1cSLh29SqZ8cACfCu8S4ziTR8DArMLfvIVesEYns/z+FaNQ7GqmP88
         1y2JUK/8VZz0AvJ1XTREdw99JpKm41AFHJB2Lr8mG1V3TJWACUJSPKxUY9Vr48eRtk3b
         CHrM+fVzjZdhhQgwrNqBqPl6TVbWmtEpG7JqsCKQeLWxhSDkDC0fqu3VLWoT/blb/iL+
         Ery4zo1UK2j3SSbCdkn3hTuuwFkUn2i6IlCWgsyKz/m9vkJ4o9HMGDLcDDcy0wjyJSku
         hSsHzMtPNtwza0RM2IiIOZMOvwAQG/1Aqvx9GBGT6p4Fu+1Tb6tRreswnXNQjV+Q/ZtN
         TSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769438780; x=1770043580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm0AyqOIj5dF9Te7g3FRe5p926c2ixXy2A4BKSh5SP8=;
        b=oY/MBaQpgk+TNtyzEumbD5gSnu6+gd/caDUtqJbJDMAvbHpcGvoNFkbXAplOy2NO4K
         FpBVJRHzG5HjdFkDS//6siQ0A8o0wRI+BboSSc6mBh4vNKslTytgbfs18sMejEUvS/FS
         vCBmwXPWBnuIGti+QQKw3O0U2XNlgITdLF+2OEI0jr+no2wGaAsBESNHBpO5Tln8wbEd
         evTHi39b8kq96+k0IS8AtHETyosJHV+cMmkIBDpTXARYGbO0Vp6L/6qiEQPtkpd4zc+u
         Ej2l+QS4OY2c3UUDdh3Ycky4ACwBliDiDfR5gdCzO4nAEjLa3RIl0J1l2mlZKXj6w8lP
         fsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWkUEc5QPg7Qg/In9lV8+dH7V5qfHO5ywwywXO/0j4U/Y3DazXhX2274mcRsgdUEwDKi1xEAqWkDLF6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLt0VIk32Vma59A6KJsAWslIZZsvKu8UPbJgvDoDJlh4Cvevk0
	SAiBtBy00XwFtR1f6ZHQa/njVn6fzNbikU6p+xeO0epCeeEdiFCu76rvsggpcLO1c+s=
X-Gm-Gg: AZuq6aKdxeVQC4Qxr4CyVX3c73tk8ina0oaHdHtSSsJEoWnlXp2He1rh+pahSj0P3hy
	Yet4iSR2Pl0GijrTK5tjsPbpEdV48QLG1mvMivZU0Sw2PHaCdXszipwnYbk7SqYZWBO00s4iUdq
	6SS4SPsfJjVaSfbStLysEOaBufaFgSlQx+anr/wNo3Es4bm1XoNNNejWUIPTOlUJN7U8244hcjy
	SLEfKnys5iR+p1zFtgcQaLsuZshOdpC7ZCDoSzxPa3h2PBcCOE9nKobczGLniy7J1hZlcd5JyCR
	K+HyDVqvRF6c4p4LgtLLjR8DPAHiCJ9oRuj9JSe3IuFyE+jAzb6M+zCksKdGL5AqGTs6OUooGad
	8AJ52KtDEB0vRwz03klws6ltxa0wR+9Kzj0g52tSkWAU+QJaow08EuTN8Y8T/VwW1IBWshmnptN
	Tcqto7+KDTiVaf7+F4oQ==
X-Received: by 2002:a05:600c:4fc6:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-4805d06a5edmr62679165e9.37.1769438779698;
        Mon, 26 Jan 2026 06:46:19 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm283271695e9.6.2026.01.26.06.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 06:46:19 -0800 (PST)
Message-ID: <74692e8a-220f-4248-9481-81bb331597f1@tuxon.dev>
Date: Mon, 26 Jan 2026 16:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 fabrizio.castro.jz@renesas.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <20260126103155.2644586-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 1/26/26 16:26, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 26 Jan 2026 at 11:32, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On Renesas RZ/G2L and RZ/G3S SoCs (where this was tested), captured audio
>> files occasionally contained random spikes when viewed with a profiling
>> tool such as Audacity. These spikes were also audible as popping noises.
>>
>> Using cyclic DMA resolves this issue. The driver was reworked to use the
>> existing support provided by the generic PCM dmaengine APIs. In addition
>> to eliminating the random spikes, the following issues were addressed:
>> - blank periods at the beginning of recorded files, which occurred
>>    intermittently, are no longer present
>> - no overruns or underruns were observed when continuously recording
>>    short audio files (e.g. 5 seconds) in a loop
>> - concurrency issues in the SSI driver when enqueuing DMA requests were
>>    eliminated; previously, DMA requests could be prepared and submitted
>>    both from the DMA completion callback and the interrupt handler, which
>>    led to crashes after several hours of testing
>> - the SSI driver logic is simplified
>> - the number of generated interrupts is reduced by approximately 250%
>>
>> In the SSI platform driver probe function, the following changes were
>> made:
>> - the driver-specific DMA configuration was removed in favor of the
>>    generic PCM dmaengine APIs. As a result, explicit cleanup goto labels
>>    are no longer required and the driver remove callback was dropped,
>>    since resource management is now handled via devres helpers
>> - special handling was added for IP variants operating in half-duplex
>>    mode, where the DMA channel name in the device tree is "rt"; this DMA
>>    channel name is taken into account and passed to the generic PCM
>>    dmaengine configuration data
>>
>> All code previously responsible for preparing and completing DMA
>> transfers was removed, as this functionality is now handled entirely by
>> the generic PCM dmaengine APIs.
>>
>> Since DMA channels must be paused and resumed during recovery paths
>> (overruns and underruns), the DMA channel references are stored in
>> rz_ssi_hw_params().
>>
>> The logic in rz_ssi_is_dma_enabled() was updated to reflect that the
>> driver no longer manages DMA transfers directly.
>>
>> Finally, rz_ssi_stream_is_play() was removed, as it had only a single
>> remaining user after this rework, and its logic was inlined at the call
>> site.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
> 
>> @@ -1116,15 +936,19 @@ static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
>>   static const struct snd_soc_component_driver rz_ssi_soc_component = {
>>          .name                   = "rz-ssi",
>>          .open                   = rz_ssi_pcm_open,
>> -       .pointer                = rz_ssi_pcm_pointer,
>> -       .pcm_construct          = rz_ssi_pcm_new,
>>          .legacy_dai_naming      = 1,
>>   };
>>
>> +static struct snd_dmaengine_pcm_config rz_ssi_dmaegine_pcm_conf = {
>> +       .prepare_slave_config   = snd_dmaengine_pcm_prepare_slave_config,
> 
> This fails to link if CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM is not
> enabled (e.g. renesas_defconfig):
> 
>      aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o: in function
> `rz_ssi_probe':
>      rz-ssi.c:(.text+0x538): undefined reference to
> `devm_snd_dmaengine_pcm_register'
>      aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o:(.data+0xc8):
> undefined reference to `snd_dmaengine_pcm_prepare_slave_config'
> 
> Adding a select like this white-space damaged snippet:
> 
>      --- a/sound/soc/renesas/Kconfig
>      +++ b/sound/soc/renesas/Kconfig
>      @@ -56,6 +56,7 @@ config SND_SOC_MSIOF
>       config SND_SOC_RZ
>              tristate "RZ/G2L series SSIF-2 support"
>              depends on ARCH_RZG2L || COMPILE_TEST
>      +       select SND_SOC_GENERIC_DMAENGINE_PCM
>              help
>                This option enables RZ/G2L SSIF-2 sound support.
> 
> would fix the build.

Thank you for reporting and proposing a fix. I'll take care of it in v2.

Claudiu
