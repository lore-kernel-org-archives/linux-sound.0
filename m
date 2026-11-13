Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574075;
	b=rAsdrtFxqhTUrgmLdcxo4QRAeTMVcQkEaqjNqypAZvTzQeRIdJTD6p0lxRr31d/Zo+2o
	 /+p702Bh680D/EsEuJhTfYyBoUXfxCf7/ORNAw+7Yv83yv/K3ub/ELmI52zIzzll4cwF7
	 9sH+UwjboXCkm2MGyjwdCAmDnIX9varz7t1RljqAtoql8DD9313JMWklWSKEeiJEsk4L4
	 n1NvdzFE4W8lFlTK2NaYqirAh65Gy5wmcvD3/HERuLSnSQLvhccHUJzrJpwWYzp8LZAhi
	 KOae672PMfTPnJHBS4M32wbKlbrEAAdgMtMdSLz9SwNHsFMh0TOuBv4F7dIRQKSeCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
	b=ylcLlxIK1jPsPAAkLuO8JCm/bNhe4H1Xqjovkh04fcgk1Ai7X9zzenFKBZhQZjRQN0lP
	 0RIk8kh7dYs6vr+VRFgLYj1vZo/Y3Ise4gK1Bx6R/dF0YicF2omrxDPZIgXBRYDtheSFL
	 PT3ZCw5qrvLs0ZwACUiO02s5ySmGvXehn2xlrClNucZMcDxMk6EW+Scl6Pwrfz8a0ifxx
	 drxfL55nGhbmer3QluFleYyek3z9/zBd+CulIU41sM4tzUKotiPF6NmMbSnW49u6QwrES
	 kPfmAVQengPcx1cfXqnaYm+yULDU57VagGuQ2dckPDLwvZv2PKRZWQcMf2BDvNEPFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ll2dmfz3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4225606A32D
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 12:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4225606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ll2dmfz3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7110545e9.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794574072; x=1795178872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=ll2dmfz3ZZQqM8p9tvh/cMBW3KmZXtaganop9u8ZdwqRMpn0T+Y7xApwcrpQTwjQ/c
         xsVOA9R5CVimLyPj0nWN1BuvpZbvwc5ypvcVDJdCdKWhJMHWjJvJ5s+zbFUpCkWc/9xf
         kmTuDx0xWFwDvxtFw6Qh1G7JESctUQNORHgPgcrmqWl4DrC8QWliGpdy55ZbmcwhVXe8
         0Ue1Ttey5jf10xnSu4WF9Nwrz5CxU9vokIaxutOI/uPGcuma7oSkCwU4ZCx6hyMofs6S
         /Y1vw4WnWEwY4106ORp3BYUdd9+ioJRodbW8Uww+cEBDOcBgW67QXwT8cS9QLuKWymfO
         ljOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574072; x=1795178872;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=PHpjTu0AuaxtBjuvvpw3dsw07Py65xrI2hQXeHLYR7dtig0YyELlfkmw/k/DfcjiUR
         8yHu0Po426QoIjTn5/Ahr7TC3ukJOOaMkDLFLq2AVsC/9Kyc6s2a+EuIUuCLvg3/tfeM
         H7wUeSRzUAgLTdVRxHQFsnn5Vr8aor48ALaluo9GzJvdiDIFAoZ3opO4P1TXc9q2HlH/
         1pmRuKymJJORIsrAKks1IeetOEM7kHcueuQJ1YqG+auzUKg0ZkKFuUKhDfMUs9BtnBQB
         8f7s6okF+UORdfjbbA74ndrhct8UxwqzZnItR8xp1kFNZmQwagdm3NlI7yzdN3QM9kiu
         Nvhw==
X-Forwarded-Encrypted: i=1; AL+hErGzvFo2NTCmQig6GiOQ0PSIgOuLWpouBHcm2tb/uYP4PyZZTjgOCAlsMGxt7E3OKX+EwdcIyHqJOkt0pw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OK7rekNEbRdTyyJ7V/yFmvruxT3FXJWPcvYey7D7OV1cjyUfz
	QDC0Qz9TsCpXzO5DyjMCTzIpsAyzMoeR+oe44w2gcCFfoBuET2zF90HdtxgkN1+uuVg=
X-Gm-Gg: AYBFou2/yWtXhFoD5tO3cdK0EBetcDK+Jpk26zGHlkTpfv5MeRSiKb+sntnlUgWMt43
	naXAi2tvaj2pBD8J7ReL75os3Ld7qCoFeCRh/fFOM80Bdyiu+U4IzUcJDSSEQSvMvsUz61871Vq
	q4TKPLLLT3CE/eaHlqv/HtsqjpdKMCpD2StJQdd50vR/6UvyJzvL6Cor4OdEF2tYIHi74u4KTDT
	hZWrVvGBu3gwKsHNHyhIWsqeJZFUzseeqUBkI872cO0uiJNtPo9bgMT+7XGb9gTt0LA+XuQURbq
	NLuX0F8N1bqtZ38v7v1nNh5WQnds4x8OimECeuzugozMdSyNKvkNbkP5GNEtBqhygNao+D/4efi
	LYLyWZgMlMDYnwD4J1KVE29sEDFTKlu+5HmgOwE/i3Sib33Y2zrqzLFvvSvczSgwKXZ0YMhOB3g
	WKCVueX+om4uEgnVAQDCipPfxxm3t1k//ZABEf7iLY8bfX/aHlbnYA/PF88B/gcUSor71mEr67k
	Pc5FHxKem7aCZzHUIsj4GDbwzpqv8SmhZ/44CHsGMO8R/nN5ineupkRz6o55vE9QlnkWbFaYl7v
	BzPsb7VYeOqF5jN/+f4aq/++Kf/EmMeS
X-Received: by 2002:a05:600c:1c0d:b0:4ba:59f7:9032 with SMTP id 5b1f17b1804b1-4bb55c5f60dmr58910305e9.10.1794574072378;
        Fri, 13 Nov 2026 04:47:52 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm161390445e9.2.2026.11.13.04.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:47:51 -0800 (PST)
Message-ID: <7a268a4a-692b-4aa4-82b3-a13006e9a3e3@baylibre.com>
Date: Fri, 13 Nov 2026 13:47:50 +0100
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
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin

On 11/13/26 12:05 AM, Martin Blumenstingl wrote:
> On Wed, Nov 11, 2026 at 11:09 AM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>>          struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
>>          struct snd_pcm_runtime *runtime = substream->runtime;
>>          unsigned int addr;
>> +       int ret;
>>
>> -       addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
>> +       ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
>> +       if (ret < 0)
>> +               return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
> As far as I understand:
> - snd_pcm_uframes_t is "unsigned long"
> - snd_soc_ret() returns a (signed) int
> 
> Doesn't that lead to a signed to unsigned conversion error (highest
> bit set -> large value)?

That's something that made me thinking a bit as well and the reason why 
I implemented it this way is the following.
'snd_soc_component_read' internally goes into 
'soc_component_read_no_lock' and then to 'regmap_read'. If the latter 
fails then 'return soc_component_ret_reg_rw()' is called and that calls 
'return snd_soc_ret()' internally.

So my goal was to keep the same return value in case of errors.

> axg-fifo simply discards regmap_read's return value.
> That seems odd at first, but knowing that its regmap is MMIO backed
> (same as for AIU) means there can't ever be any error.

That's a good point indeed. I will follow this design then.
Thanks for pointing this out.

-- 
Valerio

