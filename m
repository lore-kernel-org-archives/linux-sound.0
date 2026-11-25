Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645581;
	b=sqIkrOzsFqpT0HmyGEW3wuUZSMqejaOQdvlEDBuNrI8WXse/1m8NgxiLtd44EFL5TdAX
	 Nd7fodPM/2swUBPYuxiNL/fkDRC/dDuGYFCYckkzwgTb/5kQolZSIUnWNXbk+6qCfBTyi
	 i/y6u29o024bVbWEdN+GSOV5MusGCBb3dm4pVolL2UBu0ckYcmIu4C6BYgbZUqigKOrv9
	 tqNoyrGczhIyEeo8SqkAo0PLBBY077UqiyS+OtudyzxOB9hDrZ9tVjchUVxgMokRMIuEF
	 YuLJBEBsAvxNwkHuyH4stBsgAc+F/umpGmSP3vPbCyxgUA5ZOTaH7zEh4H/mB+kCkkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
	b=aiCSTlO19K/Gz3hCutILeAalsKQaniRrYWsCpeGlmUIZENmL9KUBJWixuFKULq5/GEii
	 aSPIzhJYbp0TjZN1lM4p422xSzP7Gbkn7EsULm94W73SOmviOVv3q3tbJZsrL7Km/sNCh
	 gxSVYmPYTdt4OBvZiHiBDPB78AS/gNtevrJMuRuZcogQ8TeboVwwfOHE7nufAf7FHz7eJ
	 LFzBt0ye1TmUFJyY+RJAKGMEO/EbS6SvDv6KqbKCr0uojJK/8SVgT9usS3+L+Ur1+fTVK
	 OjrUM7SEgrHwK8De6j8ljmaZ8iaRstdN1QRq8F4lVqDntg78t3vmluu2lWEMr4YhQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fQ8M0RhK;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B14606A326
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 22:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fQ8M0RhK
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4429842f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795645579; x=1796250379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=fQ8M0RhKyNOOnGhbnCuZJSsdvS2ywplR+VJH77h36xzfLAoT3Sb1fcj39NGzdN7SOz
         sHINKC+II5V6KVhG5xSsQJ+Q8cQ0XKfaWd2nsThoPDyslc8HBUSckEQtbdCd/PwLHJ3Z
         eoY4Ake1MX3eat1bX1YMIQouIi5ote4mChiP52hP9yjC+4/zKuXTCiFvosNAwEzpKd1I
         2SLuDdt8vTCG0NePsvFu/VNnU7BI9lO2NHQwIh5qixP9Smnv7rWosZSCrIcBVpOXS6rc
         NHCTmFN+St5noQPvtCFeT7chk3Lwp8CMF4+QvhFsJ+CKCJbwaLZ72oft7IRQZdbdsBry
         CXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645579; x=1796250379;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=rp3tQZDXHMshbi6sFeUBsAuxLfjlGqtEbbGUlIl3hrPs1BwaNEb4EsfL0c2aNHCzZ8
         cs9YRbC7O05Xb9JDkG/l3vfojMiXDali6oXg75buRABRbvWifun8lykBKdwToz7SzEp9
         NjHosBqZK/qdN5lRbUie5hHg96m4VS8ig2zCUhWml8Tmxzxm7lDs1znEg/nNWKceFvGj
         bY419bl92ccTvyVOGq/wi2L73CorSs2uzfDo9Lg0gseJaqTXbOl6/bODqYkfBuFVImKQ
         wqAJkaoedDw7xjHyENfOgP/1FgL+O730URDlk/G2+IGgogyZz9l5ZnOH9Psb4T9mkbPL
         PBcg==
X-Forwarded-Encrypted: i=1; AL+hErH8LL/POew7TxV8aG0cX2nngxAencX12XY5B+0wbJ9DPUzM3C868WfBd7vIGHZVniNTv+fQU9jvBoC1HQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n3B+EQrFg1xR11rVU3SbhNiAlzaoE6H5G4y7Zpe2vE4lTWma2
	KsigtatWxGkwJ5p8pGU0f6QxBGdthx8d+8L5lq4xFhr2YVuzG7tiekZ9B3gtsIL6J9o=
X-Gm-Gg: AZFdTZc/6oZlkkn/IM6RXqRNvgFNXcqN9wQJRGNh3O9OSsTEKR1+/UmniggLpS0uFhq
	14oDu0M98+b3+3TLXXVKODygjOkrCFHsKsKC3/FdPY3NQo4shwp7oMZCcLQ0g0qEz2vPlwu6ULF
	XlWoNuFy82EG/5qcuKVgaL8VV7efZSduLktxZNPR8gg1/UsGuDvpgM8SrrMt+e4cfklkdTkp0hv
	iUAze/tCf6ZgNWHoXww9EcBMq7QHgLAMmT3qXQYILRnY8TpUYfCZ7U5CQRbwrc7iwIlnhM9inSQ
	vqq06xXTer2wJOqmIwk6ry24a3BI3oP0lbwiBmqXRZOyzdYQ33V1fEIJLUrcjJzaaW0hKVFkDq4
	KTkiLMcIRDKEHTGCYh68OZg5UJCKDRVv0/+4sq3z2HQgnFJ52IhMPF4irfD/kb3soq7e54aQqdF
	Er2YRALcQb/c+sTXeURfNhSvBi84g0Nrz6xYwiLIu3J/B/0l/zkpKC3bIEtoq38XnnbwjzGJxVY
	vae+b8kJ92Kgp42rRC4pxl7pYI7gdwrXZVfcvta5JdLYWYfb8le/eB4vmImKoVQOGA5xe764U0W
	trPGPKqRHKrmt7OX87Bcqk+5GxkRkd4=
X-Received: by 2002:a05:6000:4616:b0:4a8:714:7ae2 with SMTP id ffacd0b85a97d-4abb32a3f61mr37314572f8f.29.1795645578997;
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Received: from [192.168.3.100] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm35684687f8f.40.2026.11.25.14.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Message-ID: <baef27e7-93fb-4e6c-8df0-8cd74b9aa533@baylibre.com>
Date: Wed, 25 Nov 2026 23:26:17 +0100
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
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
 <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 10:21 PM, Martin Blumenstingl wrote:
> On Tue, Nov 17, 2026 at 12:06 AM Valerio Setti <vsetti@baylibre.com> wrote:
>>
>> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
>>> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
>>> [...]
>>>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>>>> +               return meson_card_set_fe_link(card, dai_link, np, false);
>>> I suggest using the "audin" prefix. AIU / audin seem close enough on
>>> all supported SoCs that we don't need a SoC generation prefix  in
>>> there to handle this differently.
>>
>> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
>> compatible?
>> If so I'm not sure this is allowed nowadays. As far as I understood
>> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>>
>>     "DO use a SoC-specific compatible for all SoC devices [...]"
> Let me use an example as I realize that I wasn't very clear:
>    compatible = "amlogic,gxbb-audin", "amlogic,audin";
> Does fulfill the criteria (as far as I understand it).
> What doesn't work is "amlogic,audin" alone.

This is the thing I'm not sure about: "amlogic,audin" does not seem to 
include SoC-specific details (in my opinion).

> 
> The GXL example then would be:
>    compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin";
> 
> And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
>    compatible = "amlogic,meson8-audin", "amlogic,audin";
>    compatible = "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,audin";
> 

Ok, so if I understand correctly you would like "amlogic,audin" to 
become a sort of alternative fallback so that:
- meson8 and meson8b do not need to have an "amlogic,gxbb..." compatible 
as fallback
- the change in 'gx-card.c' is more aligned with what's currently being 
done for AIU.

Is my understanding correct?

Krzysztof, since you already approved the dt-bindings change in this 
series (1st commit), what do you think about Martin proposal?
If you don't have anything against it, I will add it.

Best regards,

-- 
Valerio

