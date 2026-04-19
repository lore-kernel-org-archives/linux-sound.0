Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2522F19D092
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 23:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776640654; cv=none; b=A7O002OexBtpKSmEjxRuGefhbTe6pIGIE9UA7mashqaNhf7b45LqrsW7FGGhX33pn3WnidIY8KIYwa0m0D430W7B2uj79kXEOWdD1+gjuZogtNkPxa8VSc5BbypZI1hm/ucflKi6sZN+Z8CKFND4z0aqCoutjVU9iCqXvl/GeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776640654; c=relaxed/simple;
	bh=re3JCx84d9+rhmZ7h2RA/DqQsl+qcG1FrTaMQ7qUQJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqjy8UCXV/VH4oUMRCDxRDriHZUFokuUFUOB8EE9IXLBHVNgC9LMtrf4kfqT39PMxtkjuOAmO0O57wWlqZSF+iBwLvW23yqjb09ezfmpn9nXpbGa1eVao6yvEF7EiDyqFHeOHSVGmE7R8HTGc6HL2ovF23cbUXPhCIPQLaF8T3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=kXPvPEyI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="kXPvPEyI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891cd41959so3116895e9.3
        for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776640650; x=1777245450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XuBQKvXNK5+webbjEv2fpeV1So3IXoLTLJe+5+zXCM=;
        b=kXPvPEyIuMazfgX1qtfRBdugXSacAWI2G+zzRmfuLGS7aS/oBZPHWUl8hEZMLai9js
         ww4qblbmZWsVWJWZ83lMkKHwmfiuQq7+TSdMBdA2WHxxYke83puxnANRluh60Y9euwnl
         0bMldz3rm24caQpnZ2ww474UDes/J6na+zoGxfBUMlP2KKICXx5fQC+ORg5IYnUx4ayz
         1aCknSmkDnjVKbzw124yDHFeNwZcAxEU2aWmMYaKbe8CjwGFL7jnhwa/78HYRp+yeZko
         PaTqlpxNYcWSGAkdOkxdLrKP8olTSYWNxOYupTYbfgmEFMBezlM79tJspQzn08TCJ/d4
         sEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776640650; x=1777245450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XuBQKvXNK5+webbjEv2fpeV1So3IXoLTLJe+5+zXCM=;
        b=g9YLruDWM/jBHoQdroirrQEK+dYN35JVdfxVYjOclPeshbyGGr81tx665Og8y9/pd5
         NHwMDWWTkTDN8XGrhaRpRTAJq0ZC05CHMrlQVPk1P7gyFsU8dd8/sQM4sQUkne4cLKFT
         w2dO+QCrp2za0lPCBGz6oo50q/ZzpT56bDO4gisgs0jP8hql3xhI7X8wmSMs0NLC3ByV
         TPjqMzLJD4yFfXUJj+Gc/QzZ3v1T+GCDG/UfL9dydTlmQZ7A/kOGfnsgBRe0SIVoP9tC
         3y5QwGXdidNcjhWrTZGM0qC98FXYy2bFzEp5pn3pmKmRIuNGmY3Ov7aAgOqMhOgBqPHL
         Xppw==
X-Forwarded-Encrypted: i=1; AFNElJ+5KONI3XSQ9HIxVCByoLr1rVmsPvYYX5qqh/DN3ZZrDpYtH5Oxy2PQe7tSVyf2cq8F7YCzYV9AM9jamw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwOy/ONx1ZXbxyftoQKxiEJgyRUV/7ZMg9dhRd40h+KiH6cHH
	kT+4wt+K5mYDGgvXt4GUTPm4E3uSGdzAVsmfsgG5Nj4lt1m8xXTwcT24IX/wCtk7hy0=
X-Gm-Gg: AeBDievKcQtaGvPUrUHAHhpMVGq0IAnAn94CLhiZkbEbW3P4gnCpSKwc0X5osdG5Ofs
	e5H6S31eyTLw9OBU5FTKBTq55omtcXxR+cjK5BUlbqKx7YrVKbBXwxRJ3pQBlo6tFOKJ3TywHOi
	Pe4ucl2rDp9FMrMC7oLDwIQlxQW3LdadJr9W5za62y2p2RRQcBJ4HWUE5MPgSLu10PhaU6EikBI
	9kt0E8Uuo41L6Thrk+mO6u6qrF0ewR9dhj9JnusYAXpHgcQ9DctZQguG9HvZZBb5g+4fqRjQx5d
	WbFIhL/iQu8ogNAsiAjCBFUQE+WXVVIxA+IEg7kBW1YEB2fj/+H/BvJxUJwY7FnWr/nlVPDsOpL
	L7nzC5vBKjrOCTHiVYXIby48w5EEqe0b54oBmdbZh5roIj1VRk1SWVk4HYFxRWdp9sNwUMBTRoR
	WTkmXNXJOY6/CQF7g7u3LudKYWYdFdubwAiyE=
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr121458935e9.9.1776640650424;
        Sun, 19 Apr 2026 16:17:30 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.218.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm296195175e9.4.2026.04.19.16.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 16:17:30 -0700 (PDT)
Message-ID: <463ab3cf-2ef2-4ba1-9f3b-7dfad523d91e@baylibre.com>
Date: Mon, 20 Apr 2026 01:17:27 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
 <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
 <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/26 16:28, Jerome Brunet wrote:

> 
> Huh interresting, I had not thought of that. Valerio and I discussed the
> clock part a lot for this rework. It is the crux since since the
> interface and clock setting lives in the AIU subsys but serves both the
> AIU and AUDIN subsys.
> 
> Valerio maybe you could keep function above just to set the rate, but
> enabling the clocks through a DAPM supply widget ? This is kind of what
> the AXG is doing.
> 
> what do you think ?
> 
> (actually in the AXG the each formatter widget call CCF
> clk_prepare_enable() but a supply widget poking the register would do
> the same thing)
> 

Hi Jerome,

thanks for your review and suggestion.
I took some time to investigate it and I think I have a different 
proposal that reduces the amount of changes compared to the current 
implementation, but gets to the same result.

The thing is in "axg-tdm-interface.c" MCLK is enabled/disabled using 
"set_bias_level()" callback which works fine because in that case the 
interface driver is also a standalone component. On the GX platform the 
interface is a DAI which is part of the AIU component, so this callback 
isn't available. To get the same behavior I would need to add a new DAPM 
widget in "aiu_cpu_dapm_widgets[]" and then add it to both 
"aiu_cpu_dapm_routes[]" both in "aiu.c" and in the device-tree for AUDIN.

What if instead I add the "prepare()" callback to 
"aiu_encoder_i2s_dai_ops" and enable MCLK and I2S clock divider there? 
This would match "hw_free()" calls and it would be a change only 
internal to "aiu-encoder-i2s.c".
To support this I will:
- remove calls to "gx_stream_set_cont_clocks" which are arguably not 
very useful for the GX platform;
- use the "clk_enabled" field of "struct gx_stream" (unused after 
removal of "gx_stream_set_cont_clocks" calls) to track the status of 
MCLK and enable/disable it only when necessary (ex: prevent multiple 
calls to "prepare" to enable MCLK multiple times, etc);
- keep using "snd_soc_dai_active" in "hw_free" to know when to disable 
the I2S clock divider. Or perhaps I can rely on "clk_enabled" also for 
this one so that I can manage these 2 clocks uniformly.

Is this an acceptable alternative approach for you?

-- 
Valerio

