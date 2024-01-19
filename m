Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD44DDD4
	for <linux-sound@vger.kernel.org>; Fri, 19 Jan 2024 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705650351; cv=none; b=pIf1OTwPpYjBatpPSrGLJ53f+0NM0CGIoj90AJdI31wNiZLFdWUEWsgSyC+A1ZEAKAFGZfjWD/jmuoKD9urS9dd8k8a/jkdzT8vrJuebIOS5SBOr9Tq/e/HQHsWfQ7yYs8xx8naKfxzfGkJoc02vlUsgmNxAjKqUv23yWg2UfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705650351; c=relaxed/simple;
	bh=Q4LIJG2y70z4o4cUYu3Cup/EpTdk2M6eRV1q2WORKVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfKprlZMzU+LD4Jn4j1qGzYrtvqkFpcnZvlEyJn8RRNoN7LawKD/FN1YtQsgQdWyJe77xXUy50xBXAU2WHSrNcPq07f5GsMTAR0pJMaRnVkZ0DCB/0HHZzeb6WOgkEexf1dMhvpSjjIMCfUV1ZwSrGN2aj4AjpIJuTB+8fA5hYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L1XXYsT8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L1XXYsT8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e80046246so2502865e9.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jan 2024 23:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705650347; x=1706255147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axlxMn3mKxrZ+z0NjINZroTLytSc1sa1mWx0FPrBc1I=;
        b=L1XXYsT8dYS1hVglZuzYBiRt8v747GwbqwRhuaFYVzMelUvha9CtC+vDeTp4n7jE4e
         qUbfy9N5XcRmfx6KwC71y6/1Xt1wqVFVjye32tCddB/8c+QDMlsToQf4LwXNFeiIxRqc
         zMWxMywgpESrmFNb78GkNqCWLB4bFz6wDur+Xw7EbILe9neMPYeDPFsYSBr45s4d8m92
         XvI0gdD0x3RFuoyMYRTM/LJ1QgMaf1SZyEdWdh3ZNKav2+yj/J9qdf89SNs4LPpS9JwV
         kZWSRBBf4ZVSBGk/QakX5rsogiKLc7GJ1C/Wu0hqFQmhEXwqkQYOUrO/wORIuaD9vDv2
         1PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705650347; x=1706255147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=axlxMn3mKxrZ+z0NjINZroTLytSc1sa1mWx0FPrBc1I=;
        b=XwAQ7uYQEOIcV9wdSjYaq2JPf3z9SpVm+PFNrACDkC4gVIoAupnPL/YHyzm/YorgxE
         2OscjQsbScwuxMR1Q3Vu2ZxiWgS+mzu/QFoNLZKIz8qBSZgGQE4hfGzelOXCtnXa1AT4
         74dUEujMoKZiujIpjTR23079RF3cwBVTd2bU2AMHWai6aIJeC78Xo4eocK3f00YJrv1D
         T+zjmJZrpkNMoYrJe/EhiiBJfe1nUBuvuoYAfds/aabTWl7jptjkWurCFH1CdV8byrZm
         vL65zvSTJLlXbgJUYj2UNqMv+2OQhSCKX2sFuJ5dhzu7JWLSAlBg9Axs9HeyzwC9AxjH
         RSQQ==
X-Gm-Message-State: AOJu0YyvkXUWhjQwD5cUZL9aEgssiaXJpIjgPyo+AvfmmbAg00MNPA2a
	u83hOUiMd55zSDnI19H1GGkHhDSnF4uCRc4IW40OEh2d7Nay+RUNOqdvMhYW15U=
X-Google-Smtp-Source: AGHT+IFDofa/AFb3zEbQS9BWqodcUqjTtN/sp/WtGUkdrc4wTm5faoFC+sDHVcwObz4Ml2d7rzEcEA==
X-Received: by 2002:a05:600c:4248:b0:40e:4380:c8e5 with SMTP id r8-20020a05600c424800b0040e4380c8e5mr261612wmm.49.1705650346897;
        Thu, 18 Jan 2024 23:45:46 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id i6-20020adfb646000000b00337bc2176f6sm5800237wre.81.2024.01.18.23.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:45:46 -0800 (PST)
Message-ID: <6d8f77e2-7257-4a6c-96de-fd3f1c821b51@linaro.org>
Date: Fri, 19 Jan 2024 07:45:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] ASoC: codecs: lpass-wsa-macro: fix compander
 volume hack
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-5-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240118165811.13672-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/01/2024 16:58, Johan Hovold wrote:
> The LPASS WSA macro codec driver is updating the digital gain settings
> behind the back of user space on DAPM events if companding has been
> enabled.
> 
> As compander control is exported to user space, this can result in the
> digital gain setting being incremented (or decremented) every time the
> sound server is started and the codec suspended depending on what the
> UCM configuration looks like.
> 
> Soon enough playback will become distorted (or too quiet).
> 
> This is specifically a problem on the Lenovo ThinkPad X13s as this
> bypasses the limit for the digital gain setting that has been set by the
> machine driver.
> 
> Fix this by simply dropping the compander gain offset hack. If someone
> cares about modelling the impact of the compander setting this can
> possibly be done by exporting it as a volume control later.
> 
> Note that the volume registers still need to be written after enabling
> clocks in order for any prior updates to take effect.
> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   sound/soc/codecs/lpass-wsa-macro.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 7e21cec3c2fb..6ce309980cd1 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1584,7 +1584,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   	u16 gain_reg;
>   	u16 reg;
>   	int val;
> -	int offset_val = 0;

TBH, as discussed in my previous review we should just remove 
spkr_gain_offset and associated code path.


--srini

>   	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>   
>   	if (w->shift == WSA_MACRO_COMP1) {
> @@ -1623,10 +1622,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
>   					CDC_WSA_RX_PGA_HALF_DB_MASK,
>   					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
> -			offset_val = -2;
>   		}
>   		val = snd_soc_component_read(component, gain_reg);
> -		val += offset_val;
>   		snd_soc_component_write(component, gain_reg, val);
>   		wsa_macro_config_ear_spkr_gain(component, wsa,
>   						event, gain_reg);
> @@ -1654,10 +1651,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
>   					CDC_WSA_RX_PGA_HALF_DB_MASK,
>   					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
> -			offset_val = 2;
> -			val = snd_soc_component_read(component, gain_reg);
> -			val += offset_val;
> -			snd_soc_component_write(component, gain_reg, val);
>   		}
>   		wsa_macro_config_ear_spkr_gain(component, wsa,
>   						event, gain_reg);
