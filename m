Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C220551A
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591772; cv=none; b=dhDE3fGubU+XByP10qXXMroF1o/9BKp1zeKVsTDcOjXG1CRcExTeaqBT2kvLKlu0Q4l9yLk+NWOr6/B7goSfeDuqXNTunEIiqEj9oHglFd5Ld+4uLOm5e6dJOrEFHAi3GerGA4wKs1ocySweTeEBAk57mxNIE3CGewOfVUc9/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591772; c=relaxed/simple;
	bh=BhDJSrHYmdsEXplQFttxlJTvYf2TKpF3zvQiKJnEhX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhmUj2fHzkKIk/7pg0+wFiB+Fd3kbpjftkd30DDH7FjN2PRzR7hrJEKMXVtCsGGWuGtAKy+PWAI1YKrDu4g1GPVuFecjmQv/7K2uSEE9i4fl4XESaZiT5FvsC74EMlovKA2Kw8KMPcNlV0F6wDFu3z/qRUm+r6hUr38HpZ/wsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFCn67Mh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFCn67Mh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so6029033e87.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591768; x=1739196568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4pmT0xng8YdhycWRMKJfsqizxwuIDbDyEJ81pc8bF0=;
        b=TFCn67MhkpzqQA+g0ir89xZj7fDZ+gMAKDJ6ThfRd26IrFuYoEEMEAManmrbDbOySA
         rLvIttQGiHYHmRG3dIOOLOvmKpreL/Psv0uJ7WQigmHEyOq/iZ7ToGgPFFFG8INO+aTz
         Z9cATybj4kSx2ndQukfzSiDkQ+5Ef/hppwsj1I57d3ocZEPyH9G5ybFwgqaMZQQ9iMcn
         6CFUbBeryZaVw8XFjZzuHLYHqZN8SgQ2I/L0JAeeFx7qh97Jrj8IK0N4lykGY3mbxfnP
         dDvRMk1+6lohlOxLIyflVzeeaN/++s4QVsUs2Ha/6qSYec4x23o0iu+psk7dq+LnhBiL
         WGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591768; x=1739196568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4pmT0xng8YdhycWRMKJfsqizxwuIDbDyEJ81pc8bF0=;
        b=GQunOSquBv+1rIaeejyUs/hVV7vKbPWEi6I48w3uZzg2Y7czgGbE1gn2sHFjv2xCSh
         HteVU24Tjc5FmW8co9angCpkOPtIwtfPD6t4EnCMeQRfB61zXy2lBXwn0mptgxqPQwZM
         7DlyOb9emSZrS1ZYqvgz1Zfg9w/LjFE3xzaMmlVWLNO9y4DhW//0bzy6PADWMxuiFrTa
         kr1K7YDgC2sHGCpa9CxBFjMGZxuvwelx/I6KgSAEXe68JgGRPxaOqImM+OVfxGyoPzbB
         FQzuXa2r1fVOL2NWnucOP5Qv6MMWk7mCXlfvZ1Hkgdlm1UJkxRmKfCo2zWDW9320mDRQ
         X6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkjEmKWlVOXbshXQ6UQuqTD5ALoArwOiFxrVMRxKGHt16X8Gvl4kFVkqHFruban4W1rMWySTZIxZQD3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3onqnCx3o2P20YwsYMe6g802fs83GMzb4gi+sxt1aPjNiJOji
	KU8qOnFkFfzmil04cYb1yyx57GGn8NDEr5oVJ/RJKeoil6o8OGlFZqyDQvYV2l0=
X-Gm-Gg: ASbGnctftTlNC62ivxGf8W7vhyoh9NTUJtkZ7/UfJiovT81a29yUb/LVm1YcCXtf0lG
	Wr/Jt56Z0/TAbDajS6kkIQIfvqgYUWpkOLOXpJ9klz+/2lp53KWLTq4PyRdWoBXbcx3B+njdZDd
	xpseovE0CT8G4iy1ZA89NuduBbnOyhu4K30uRNXAjNdzhUR12/O6PcA5Fcz3s988t06C5xbpLto
	d47Cfi4ZbbEptn6FNagOqZpEr98OLEc1h9aD8tCDKtis6tOcTAk6FAKn9F3fJ4uiSyvkYDfXH6j
	T71ZkTiiQqHZic4LA4oesBaKbArtZ9GhozmxymtW91mcU5f0Tv9TS5KqyaEtkBQUe+SlDYs=
X-Google-Smtp-Source: AGHT+IFtAcXEaVrswkCO/X2ohPvix6C9anq5aWjz8V/6SOYEap4Iiw/P0CbtbcIo2Z8mkkAhqD9zAA==
X-Received: by 2002:a05:6512:3994:b0:542:8d53:5eab with SMTP id 2adb3069b0e04-543ea3c894amr5745670e87.6.1738591768446;
        Mon, 03 Feb 2025 06:09:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0f97sm1303565e87.5.2025.02.03.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:09:27 -0800 (PST)
Date: Mon, 3 Feb 2025 16:09:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we
 start streaming
Message-ID: <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>

On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> With the existing code, we are only setting up one period at a time, in a
> ping-pong buffer style. This tiggers lot of underruns in the dsp
> leading to jitter noise during audio playback.
> 
> Fix this by scheduling all the periods, this will ensure that the dsp
> has enough buffer feed and ultimatley fixing the underruns and audio
> distortion.
> 
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index c9404b5934c7..148c3fb77168 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct q6apm_dai_rtd *prtd = runtime->private_data;
> -	int ret = 0;
> +	int ret = 0, i;
>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		 /* start writing buffers for playback only as we already queued capture buffers */
> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			for (i = 0; i < runtime->periods; i++)
> +				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);

So, all errors except the last one are ignored now?

> +		}
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  		/* TODO support be handled via SoftPause Module */
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
