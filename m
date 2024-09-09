Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21621AD9EA
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886357; cv=none; b=MNBIOcx1yoQ68faqwaHN14d67Gwj96311/lHKU+A+n/P+2T/ft91NVJsBkLkauQ/kLKE3OgMk4rqg+EXl4vzFgT+B5msdvWoy+rtJmXscljJ8iSDf6hIL8ve9tW8AAKxQWhSeeJc8341iFWrMdlcP69nnl8runAgDLR2Z8cL1Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886357; c=relaxed/simple;
	bh=gbLhjuLOV4dSl5SZR0/h4W+ihlZ414WDToIIW5JUPE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAEV9Q0iXAlpRssZGAF2hgiKjLGW/HLoj0NAMnECQAVlx6SCM183YP24ZhPF3kwmEQMqtwmgXkOTvAqgdu3ucyVbV0KHmLO4c0XtcULs7Dbr2rhNU177DaUrWrBIGxo4q/7p8trT3i6FP7y0u5oQULYoSBKmRmd6YCOiGx3AtdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DGalyXbX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DGalyXbX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so36980915e9.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Sep 2024 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886353; x=1726491153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFicSaqQ6o1dPU2dGyJmmfBGCV2JI71YgMB0tplFuwY=;
        b=DGalyXbX3Gpj892CKKG8qOT9zPbeP+PKv/kGs8fhx/SR7VSt4xIR0Se0lPWignvNHI
         DBi0tUPxN8luCBM96HZmMBTKCzgQLQtkqVkF3eZ+L9y/8fVgudmM8Er10rx+gfb4tV84
         0BL8itSuR+OlXXNjpuqvQ8B1hdWhicRlJdJ5j8psR35e4u1aGyPOMSxR2EizQlcsyRIT
         JbAczzMTHjQ5bRsTCOPH0FiD1UaTozTLLwm8YXzO9SAS0bCT4oMNrCJnJfKUZZDC64z3
         70RWaub94bqe9N+fMbMSRYYb9P1pnJZszku/BNcUnXHGwYFuWDlTu30OmUy4m7oSJWEK
         ezjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886353; x=1726491153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFicSaqQ6o1dPU2dGyJmmfBGCV2JI71YgMB0tplFuwY=;
        b=JvQyyCGGxJDtAbDlTyLpSzoXANZz6+Cs1KQ7H+v5CWt/IfVNTHITHrnrk9yi+EXYCL
         NtURvyAUCVwT43adHGLvTTKiBKEJYHprhEwlaV+KTbFR6Yp1XGDIInlNvZh6VIdM7Pga
         wSNUWamwfgrHr0N2Zl5y8e+YxlnWwAfOmoIgopJee0JZj0goSbuLyp0LmrPY8w4p0t8d
         A/28Z5gfEcvG0nzpfZgWkAlaFQKVhyymPgRcnOdMcgdHUILXWoq+i1hxOPv4PpFLDxlL
         W3q30enOACCS6Dkptupq5BKJGYMQzZmtSDUdAdsDzXLp+TOBpIibSNj8FM4Gaf/QwY+Y
         gZxg==
X-Forwarded-Encrypted: i=1; AJvYcCUnTrQUVOzvj1GoAYbrE+vqRm3f9Va8JG1kr+hRRksEe04NMapoKMK9yCblh9XgnH7AQk4av757IPguIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypVI5FhcKJPTjR7dEfMNtRL5v/z0BcN+6DjMrgZeriqwMnOADi
	c4gtWZPUS2xMY08cFk2BBn9N0FoiPe0467OjYT8u1fC/sTXL9UyWkjOMTbbvwo4=
X-Google-Smtp-Source: AGHT+IFTcy0mxR3YY6Sm3HpQ9Kysw5PbxY5CGwt/HKjrLl33HsGAZy2gqrlfBru7RTJbn6lfqIoOwQ==
X-Received: by 2002:a05:600c:1c06:b0:42c:ba0d:c766 with SMTP id 5b1f17b1804b1-42cba0dca47mr11409125e9.6.1725886353012;
        Mon, 09 Sep 2024 05:52:33 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb742d0a1sm37550115e9.2.2024.09.09.05.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:52:32 -0700 (PDT)
Message-ID: <95cab48e-989f-42b4-8f31-0fdffbaface4@baylibre.com>
Date: Mon, 9 Sep 2024 14:52:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ASoC: mt8365: Make non-exported functions static
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The compilers warn if functions without a prototype are not static so add
> appropriate static declarations.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-clk.c |  4 ++--
>   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 12 ++++++------
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> index 300d1f0ae660..8a0af2ea8546 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> @@ -295,7 +295,7 @@ int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
>   	return 0;
>   }
>   
> -int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
> +static int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
>   {
>   	if (apll1)
>   		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
> @@ -307,7 +307,7 @@ int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
>   	return 0;
>   }
>   
> -int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
> +static int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
>   {
>   	if (apll1)
>   		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> index df6dd8c5bbe5..54d2112d2e92 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> @@ -170,7 +170,7 @@ bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id)
>   	return false;
>   }
>   
> -bool mt8365_afe_clk_group_44k(int sample_rate)
> +static bool mt8365_afe_clk_group_44k(int sample_rate)
>   {
>   	if (sample_rate == 11025 ||
>   	    sample_rate == 22050 ||
> @@ -182,7 +182,7 @@ bool mt8365_afe_clk_group_44k(int sample_rate)
>   		return false;
>   }
>   
> -bool mt8365_afe_clk_group_48k(int sample_rate)
> +static bool mt8365_afe_clk_group_48k(int sample_rate)
>   {
>   	return (!mt8365_afe_clk_group_44k(sample_rate));
>   }
> @@ -496,8 +496,8 @@ static int mt8365_afe_configure_cm(struct mtk_base_afe *afe,
>   	return 0;
>   }
>   
> -int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
> -			  struct snd_soc_dai *dai)
> +static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>   	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> @@ -714,8 +714,8 @@ static int mt8365_afe_fe_prepare(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> -int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
> -			  struct snd_soc_dai *dai)
> +static int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
> +				 struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>   	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> 

-- 
Regards,
Alexandre
