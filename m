Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847273;
	b=om45vQpcpFj7P8kI2Nmp8jmNawDnH7vjT2dTc0lDJ52gieKBRcCySuNxPrROcQ53nC3z
	 HLAxzhpbLQUFXwfiXquOniOoMBEaRMBQBbjBVtNJZQrF89Ki2ZvVBdrbi/6QsAfooj4ch
	 7u7mX6Pv8cL2Y9DfJGYYwP/jJa9pk29sqz3UJoe+9MVukyw+U9F7Dejqjt1l5+6dOl3m2
	 eW49t4sosHYjl8GFfnbsKogPzsS5mkAe85XUfpYLFsCT9SsJGZri4mBRHjjBqFS/ClrKu
	 impcVoFLbN1oAaXDR/AGtCCp4RGlNbwZ3PR4ApLfUWHrHenOTUeIb9nRd6OvxRw9n5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
	b=XVgirhzL7l6VEBW+KgH5dRThfXs5z5NCI7Ka2hnEPDSNN33BK1kU5IYSl2yOZoEPJJ0W
	 gzxrMBicu0zEOpK/Tvxnx/TLHpFgv+yS5RrQw5AQ3yL85PHU1PvRLffCoPBjAsLK2KSIq
	 w9Ltlo4fSEDeUskiztshRZ8gwuAyuszGcJLSpCnoVjg43888/nYbKPqG0vT2HMYE2br6A
	 J0k/xk5TObhHjlxHEIidGRl1jrZeW02LvEkhf3Hr+AMZgwIN9S0Zd55l1is0f6Ys5YPum
	 4bJWOW2pl6mY1mPsBrcTicmCzWmS41ythghufGqFGSbXH90GsBRBLkS+v/eVZyiulqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V29fsNcR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82A606A33F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 16:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA82A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V29fsNcR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso29971715e9.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794847271; x=1795452071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=V29fsNcRoT+kHjA/1NgagaHF1FWALzsDmm3hWscsySkBhszGabODRevlhTC0yVyoA4
         s5WpF8LIAA+ASvyLwlzN95LtYaxvmAkhMm1t+UVMyhOTpIJXZ7F3CnKrO0vugySdFw+l
         /Sy1AucmfS/hf/lumS6MmQsmJmlfKeBbM62aAJdQ6RJbYO5s14O3uJdVlHkzh07+J+Zx
         +xCwL17WqOe9D66UjthUMLVdO/A4jh+Gg36jfqbt9Mpryo8ynrhlp4LGtA8Zbvd4YLJs
         yDD4DYf5zqcp8HBGoBIErVBVeRZS1Qp2zw4q57l0dGHIlSOB85C2G4Ppby9E3wIXXDKS
         +G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847271; x=1795452071;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=Kc4bxxHWxEVEXnjRPlGn+CjqJshKjPJEMr7ZqJqSv4bLpbof3gaKyLfFoy9oCS7REl
         bJn4Sk5KDPdiO2QvtNFGYngNkr3a36njWIzdlzYofiVFtjhcmMjHdKPf3px/uEeKVlul
         0lPoyjvQFZb9Wfdvs3dVo1rlrbp3HKTJ1z2bHDsRaQyfDcLLxc6ab74Vc8iyL5gCA3Q8
         XYvcSOtpfdZq8GbXo9NloYkJyJEIaBsHMYsafa7Fd7d/s2HE26jYLjPiVmFPc6LWRw/V
         PGramVYIFxWV4Wp7NA2uhcutY3i8yZKaN/CIu9MoJXVY7jhNTPk3NUODQfoHxfssP5om
         jKZw==
X-Forwarded-Encrypted: i=1; AL+hErHnIP53BDnmCt5hPXcGW1bymQW4qlPkAPFXrS2Xh7MxavF8BDpisBYorJgp8rTlaht8v+wfB5Hm7I7/VA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+L/tLwS1nCfz281FnzoVESJx8cuCwlHaoFVa5ykgHPWeDUwAh8
	9Rcw09JBb+3YqeDoBJbzw5tWkMq9Q1mE71yBM2oxqrIQ9PPn6CuFF1hh5NMY3i/vgFE=
X-Gm-Gg: AYBFou1OjUibf8hHndG/ArnGvBz4XEnzJgi4IuFWIpvHLV9YCExetB1O6qw94IxReds
	SXWk5dPBl7BkGR42n2+kbvczB093bPmYtUeqalGSfNGAsivHtPsZ6hzv8mcDOyhJ4M6XHV4tMi7
	3y98kcRI1HN6fLLQB/jtGAo3gK0I1V76aMl0lE7/TyDc5qoC0HTwKxCJRJASzDNYdBo3D6saUpS
	16UcOD5IUFtCkMhT6nTNHiQfrXp9d9VmkJ30ZKM+XvNc50mAYXMszqIsXCDpR0Ri9wBw5eq8neN
	8pZzg68S5Jbjt13Ubfrq3ru5s3FwuYanS4QvCfKkNGheefiz21f1wedY5ZF/48al6lOOJ8Zf1gC
	1cl6rxg5eIcUeX24nfr+UfzHG49qPnH45Na5jIPXgGFLNwhewZn+GsKfVq4iH7mg/cQMhTIPO+K
	+WOlHCD/FYbwGWFUGWdEjBzLMWTOU/tv1h6i34gMiJW2dF+SS7mN+ZfGQ7OEU8GCidFmP3INiFQ
	fwD2zZMozGSPYlBD5nSZnM4RbB7qg2Vx1/mLOY92LJavpFe/EiEb5K8bXwjC+OV7m6X0HcV9t2Z
	Jxys8W/k+1gJOUZtO4lNJdbXLQKXY1s5
X-Received: by 2002:a05:600c:34d2:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb55ac6cabmr228383715e9.34.1794847271206;
        Mon, 16 Nov 2026 08:41:11 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm154341245e9.4.2026.11.16.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:41:10 -0800 (PST)
Message-ID: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
Date: Mon, 16 Nov 2026 17:41:09 +0100
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
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Manuel

> I have read your patch and have a question.
[...]
>> @@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>>   				struct snd_soc_dai *dai)
>>   {
>>   	struct snd_soc_component *component = dai->component;
>> +	unsigned int val;
> 
> Here is val.
> 
>> +	int ret;
>>   
>>   	switch (cmd) {
>>   	case SNDRV_PCM_TRIGGER_START:
>>   	case SNDRV_PCM_TRIGGER_RESUME:
>>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> -		snd_soc_component_write(component, AIU_RST_SOFT,
>> -					AIU_RST_SOFT_I2S_FAST);
>> -		snd_soc_component_read(component, AIU_I2S_SYNC);
>> +		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
>> +		if (ret < 0)
>> +			return snd_soc_ret(component->dev, ret,
>> +					   "Failed to write register on trigger");
>> +
>> +		ret = regmap_read(component->regmap, AIU_I2S_SYNC, &val);
> 
> So as I understand val/&val is just there to listen and forget what gets returned.
> That's kinda weird, but not an issue.

Well, I understand that it might be weird from a software point of view, 
but it makes sense from the hardware one. According to the manual:

     A read from this register indicates that the next sample to be
     sent out of the interface should go into the left channel of
     the dac.
>> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>>   	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	unsigned int addr;
> 
> Here it's addr. It's not yours, you just kept it.
> 
>> +	int ret;
>>   
>> -	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
>> +	ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
> 
> Similar as above. But why is addr here and val above? I think it's the same role in regmap_read().
> Would it make sense to name both the same? If it does, I'm in favor of val, because that's in the
> kernel-doc of regmap_read().
> 
>> +	if (ret < 0)
>> +		return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
>>   
>>   	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
> Here addr is used, so it's not same as above.
> 
> Looking forward to your POV.

Here I left 'addr' to minimize the number of changes in the patch.
Looking at it again now, I'm more in favor of keeping it as 'addr'. I 
understand that the regmap documentation uses 'val', but in this case we 
know that the returned value is really an address of memory, not just a 
generic value.
Also keeping the name as it is makes the last line of that function 
reading smoothly.

However if you deem this unacceptable I can change as you requested. 
Just let me know.

Best regards,

-- 
Valerio

