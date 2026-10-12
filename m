Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165C49B1F6
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818053; cv=none; b=PLsLwflYtmDD1nSveei0XOPgM+z8rVeMoy8KgGYQAkywpDdWkCpdv8k+lY4nYHNf8m7tlRovG87ZW1YzTW9wPjpeK/Bzr8E/pFotTcc+i54mDed9c/ms+MjAZTpIyitugZ7EWUNKTHOt3q3h/QciV3R1PXTWldAu2uhge1yz9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818053; c=relaxed/simple;
	bh=t6pIrTDi+3aN9kktXkuBxtkAiL1D8YwIdd2Y5FmQL9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDl3TuIAkhM2pHyRRym5r5lsSesOvMZxlA4+HH6nMHQsmAX/u/j2pefWzH4U0WzbuYou/BvWv2XjulvmRddoOU1GBMZjlBr85mpP5XctLzROOTDaKnevLGdn4AZUk87hzVB9cn7BqiZaDwY6nS35BkGrLlohnfc/EUfmC0m3sFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FTebznXr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FTebznXr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1143748f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791818049; x=1792422849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=;
        b=FTebznXrxNApop7fMm72qb7SMn+3bspirjwaJUwU/Z57Y6dFMJ5e9zfz8DKwTAwNPQ
         dwsXD5tLXosljeDdsn1Fl7mUSCF1vdMYGE8Zn3SpefqyEssdD9T2a099qIVboz1VSVyR
         z4zN3XD3tQRDXwOf+FstNfMXPvvBYUwqyQFlJh3wU78X84CpnMiM5sa0qlCDHbIIV5K8
         L2mXK5CRKbh5EZrovBidzMI22mr11kVuqPVb+Wasj7ausAMa3yBrTN4MRugcj7+cqZ5w
         K8cZHC0cUKIuWsmOXN6lJ7zriR+6DdcoW31P+lB3AeFbzxJyJv/opm11NidVnrRIMgvL
         /25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818049; x=1792422849;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=;
        b=qUzuJQ0NtetoTOHeX7lID2Z+L8/6oW0qkfL9nPYvFo1ZIXoTJvapVWHxpz5/kSNryT
         BcnRP4t7WyDxhBcnWqwHtmY06f4a4rdBEGBR5tsles+uIgIAFRYd+NtRzJm+UW/x7jTq
         TSrhtHE2K3vLJYkO9QeDyXxemYKOIN7LoGVDryje1AyuZTJUugomveDzI2lmPtce7nEO
         VxeaQ+DXrC8hVK1QxbYDjX3rcapflZwscACxzID+OT6VSy/P3iQ4Bj+QmO5eWsRFuG0t
         ta7YOgf0DkypbQkapIYuITTeumwLp+YRGg0G1m7Gehrzcpaoekaunr9ZS0LDxM67fLOa
         A6rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDTvWpXd3R38LnbeW6LYA7y+Dsaiitm6jsfBOF7LYk3cgAxfUCZDCfK3C7zxQsRJzA/kmdjpVU7O/QpA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRqoCw57RCW8qk8psz9IY/zqbJXA+1Rxu/M8v4t2Cqhmfy5egM
	D86LsZj7yA8r3OX+4yjeCJVCjEVnGcFG/fHyMtx1zNckUjcwOb0pvLrr58+70BubhKc=
X-Gm-Gg: AYBFou216iGFtWcAYbFYrbSkdzysSgUAGLjmzciBSDsZgFRElJGW8QklVUqC+HMzNs6
	Y2Q26qBQLzGC8uQSJsLaXp9bNVFQbRs0MhiysqOcbcVf4OJiO2sVTRqumIJ1QQz8G756vp1EOL8
	KbaJMr5jJbRThcIKLjfolE54P1J8FiWMyfWVRZOZqhmbWDbdosC7los11OJix2U+W2pwLIsKyEY
	GShlX9H6ZpBpbsrB86pWO79WEX1/DO2JGAtDUjVOYz7GxtW7IAuze/RSFtm2YVeBj73JL/urBCH
	FzgmDJfSuAjGXhKD4Y3ttEAWsAApstYS6DdqTWraZ3eU2Qd0k3UsJtDAOJrolBnlirs9JDEYWeG
	ijMOUBTYnU31feSj3gvNPk3k9wgA/oOTeXoKm5LUF+8sx4i6hMBs0GQHphWL88uek9YwRB58Ajx
	0V4aV07m0z5IAjYmiYD8GiVk+eTJH00XlzrieNOQ+MvBTatYYeKtOTunKOK0EaFiR3DnbdO0JwV
	w==
X-Received: by 2002:a5d:6f17:0:b0:485:a394:58ef with SMTP id ffacd0b85a97d-48dbaaed22bmr16768322f8f.30.1791818048717;
        Mon, 12 Oct 2026 08:14:08 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm3653f8f.16.2026.10.12.08.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:14:08 -0700 (PDT)
Message-ID: <d90324be-c43d-4d28-9f1a-e28e437031e8@baylibre.com>
Date: Mon, 12 Oct 2026 17:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-3-2476646118b5@baylibre.com>
 <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, thanks for the feedback and sorry for the late reply.

>> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
>> index 58dce9f08c9d..70ea39c77b32 100644
>> --- a/sound/soc/meson/aiu-encoder-i2s.c
>> +++ b/sound/soc/meson/aiu-encoder-i2s.c
>> @@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>>   				   struct snd_soc_dai *dai)
>>   {
>>   	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
> 
> Not sure about peeking on the other path like this :/

Yeah, I know this is perhaps not the nicest approach, but it's the same 
one I used for the bs-quirk handling (see the "startup()" and 
"hw_params()" callbacks). Since there can only be the playback and the 
capture stream, checking the other stream's "clk_enabled" is equivalent 
to a user counter in "gx_iface", without adding a second piece of state 
that has to be kept in sync with it.
Is that acceptable to you?

>>   	struct snd_soc_component *component = dai->component;
>>   
>> -	/*
>> -	 * If this is the last substream being closed then disable the i2s
>> -	 * clock divider.
>> -	 */
>> -	if (snd_soc_dai_active(dai) <= 1)
>> -		aiu_encoder_i2s_divider_enable(component, 0);
>> -
>>   	if (ts->clk_enabled) {
>> +		/* Disable the clk divider only if also the other stream is not using it */
>> +		if (!other || !other->clk_enabled)
>> +			aiu_encoder_i2s_divider_enable(component, false);
>> +
> 
> Looks like a race condition is possible here if one stream closes while
> the other one starts.
> 
> I think you need a common structure between the 2 paths (with a counter
> possibly) and it needs to be protected by a lock.
> 

I might be wrong, but I'm not sure a race condition can happen while 
managing these 2 clocks. Here's what I found:
- "iface->mclk" and "i2s_divider" are enabled/disabled on 
"prepare()"/"hw_free()" respectively.
- when "prepare()"/"hw_free()" are called the framework holds the 
"card->pcm_mutex".

So when one stream performs one operation, either "prepare()" or 
"hw_free()", it can read and modify (if needed) "ts->clk_enabled" both 
for itself and for the other stream safely.

Am I missing something?

-- 
Valerio

