Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9A3EB0E4
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456443; cv=none; b=JUQRa3OjE0R4NsrkEGWGI7VffA1A2QDHVxMlPT4cBWi+3Z02aO2rlDdwtSZ1owV0Rkf62kXrsbsdaqPNUfa6pj6qJKVbzwxkjbUOjSyLBftbWVyC1DNomWcwDSHxHh1p5JEJT3OBOz/QH+MdUYEM0SLiaTGuyCvByFWMlbS2h1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456443; c=relaxed/simple;
	bh=7Q2ZE6HLS75wQcm83WzmDpbetkihWwx9rkK1yd3soGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWtUKJYiZ/dANCd+kLWgGApZ5jatgUA6SY88C4sNiSEGX09zAGpWDlruP+BC0S3wnwbQSHbHF+CKPIW5o8F7QS3jNDcwQPJAFaaCrXVbEGP0VpiMapWTdlEJDPHKzK6la30037vHCflF6Apr7DFp3WleRFiNJeAjuFXzA1siUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FUkxT16K; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FUkxT16K"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4758bd3731bso878106f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783456440; x=1784061240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=;
        b=FUkxT16KfwwlT9dDxKb/b/764qMeeDH3rYhqHt94TNH2Jw4qY5Cu1kss0a4oRvX9DZ
         LaD7EjIvX23D49ftXMU+Jt6Y87V/QhgYCnY/m/pbNnDhe30ttwGniJADYRVOabYHih7z
         xtPaU6Atf1B4e1QExmKAcYQrF62BzdiZPXUH4Jqr0b21TfgQj/mxcs/IemCrrAy1Ue5F
         /NyZYLnJiZaKgqDvE567SLtSxUjRShYuqZNntW8gEoLQiYfdeIMf9HM30/vj4+R+C4Au
         5awoQFq4D8aR7U5+Fba8GSfkmyagzShjvSPu+4QDwpJuVeo7L9H34h/yWTb5ir7ZHwbK
         Ot8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456440; x=1784061240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=;
        b=lIeC2Ltv6oMDguDOmoPRFQzPYAk0zPISfzEzQVXaQS/l5pfg3KoF9DCQGuLvsYWzqU
         BIVpVZTizDClITaUpV0JDhVWEyRK5UWrJaMGbbw9fK0pe8sEAN5thRXVfniIHXzhI/B1
         N0IjXfsGByBYdgb16jK6DpNj7HRAlAvVx4lTxw7kxNOwKfBe+6Tu6cTRIVe7wdh/NiXr
         o9vxLs/sEOQnaanQkMUpgPmfJuDQ39H2gS2UL83BtARVRc0BvPlCSTqKIu6GKVBo650A
         0vS7IZabJUmR78dl1IdHjlhy7O1qYOmsfsgZWEB9iMErc08F5UH6rNigC9/OoN40Hd21
         W0Vg==
X-Forwarded-Encrypted: i=1; AHgh+RojGxmIAX+a0WMGpGky1cBRD9ZGp+m4ItCuGFikUelmM/rnF3XofCem+i4yUJNymYD3NIkQCkaXhw3q3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKfn+4rWUkhpxzKOC7X89DOyu0aG3bRm7ezT9iB5XW7GIcUFU
	+hI6x54//W166+DgduIf4MoPHFxsvjQeNffMTzOiN0REkwfB5Ne/JmYYy2AUAYqUU28=
X-Gm-Gg: AfdE7clQ+MajfIHT8Di5AF6dbt/fVgAmvr3zuoVX96R8byeBVK3RwoqRUPGUOxXc3hi
	3Jo6SihwmDPUUzUBnsxCf14RqM/PWLcTGU2KQc/76I9MniQDP2v2Qgxdh9u7t1gLNV/VU+QFm6C
	J8rnd1AGXsyiPwj5l574UWlVDf/7leBuc5bq/+RTpAruCGFTQg0DnCqsZo13VoU9Kv9Fytc//+z
	GPGiyD41J6YIig8q/gShExhbIsvjVltftCaum4fdqMwTTFAdbaPhcZuyq/oPU29ZAzoVE1WKZsq
	A5e9WQMtOaLq9A0lFMyce21edS9386lzqE3nq/SqsWS44phYUGceQncLhlZOlo0O6b5JgBrEX+U
	O4zRlz0QTjSXzFTxbGDWR/wQlpMsiKStIq59HAfYgsPwJZwLmVR+4drsia9+lxmNSVn8269axrr
	RFKaw/1qriIzb8db8=
X-Received: by 2002:a05:6000:2891:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47de9a41059mr5106546f8f.29.1783456439812;
        Tue, 07 Jul 2026 13:33:59 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm36801444f8f.3.2026.07.07.13.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 13:33:59 -0700 (PDT)
Message-ID: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
Date: Tue, 7 Jul 2026 22:33:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
To: Ethan Tidmore <ethantidmore06@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707012424.1661733-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260707012424.1661733-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/26 3:24 AM, Ethan Tidmore wrote:
> In snd_soc_register_component() error path, the aiu-formatter is not
> being freed. Instead of returning now goto the err tag so the
> aiu-formatter can properly be freed.
> 
> Fixes: 83b83024cdbfd ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>   sound/soc/meson/aiu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 64ace4d25d92..d6b644a53f7e 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
>   					 ARRAY_SIZE(aiu_cpu_dai_drv));
>   	if (ret) {
>   		dev_err(dev, "Failed to register cpu component\n");
> -		return ret;
> +		goto err;
>   	}
>   
>   	/* Register the hdmi codec control component */

Technically the fix is OK, but I don't think the commit title and 
message are correct. aiu-formatter data is allocated in 
'gx_formatter_create' using 'devm_kzalloc' so, unless I'm missing 
something, the data should be automatically freed when the device is 
removed in case of error.
What 'gx_formatter_free' does is simply clearing widget's private 
pointer (i.e. 'w->priv'). I think that not clearing it should not have 
any bad consequence since the pointer would be overwritten on the next 
probe. However I agree that for consistency reasons it's a good thing to 
clear to do when 'aiu_probe' fails.

So perhaps the title should be rewritten to something like "ASoC: meson: 
aiu: reset widget private data on probe error path"?

-- 
Valerio

