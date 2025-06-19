Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209172FE384
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356384; cv=none; b=KLSkvLPkee3faTTtLUx0Xbb72df8yjvgQNRqpqI+IY0wg8Sk67fWQUBck3vXP8CvVqWZylCEXytvytrO1gYcInGlTZ8QgSLxSoyhUurkrvofMLYEiIBSXCb/VRRi3W+0h7JYBBlY1NVDLnmOhS6pJfIYx4ELoMCFDnfeaCft0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356384; c=relaxed/simple;
	bh=8rFZcmFKoB+G9wDyBIy9E1UDrKe2IpqE1SruPDPlznE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFWnTGgy4KgSfv262bJcq1oye5FTQpwuLiCkDvVhq1FtqQXGW5odLVjNEWnY1p97NfhdKq/1TjWWMEzu5wOveQtQ+JE8xpCiPOwWV50Q8JOB0Yv4HVgVi0E+/IGcav/waVUtWqx9zzfCT3nUq4OO/BBSC50g24mUsCwTO5Nba4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAGPj1O+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAGPj1O+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso1227042e87.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 11:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750356381; x=1750961181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4GDLvtDDGSq/Qy+QO7VaqR9d/e2gHqaBWo5/ZVZ0dw=;
        b=dAGPj1O+fwodJH5QMW0tH5Exc3bpPncsisJkhj9q67HUshF7Si9GtIf0JZ2JAL11dY
         0P3OYK2ARR5MquvpiBrmF4upBBL28cCx3b6GTp728lehlX+wjc13Lu4N3H99o6ZT84CS
         4HJrjbtcuN7ggfDeYQ+TxnxuxqB78AWs2TzPXRdP6qz3679/6GgB7yjcoqmCdsJdNw/G
         uvpk7x1LeSOEVzBWMyGPtBu/I19sCCFBjkItxXIqWDt92NtuiZAdJrUgMGwzfYKpC1Ha
         vn1JsilZZFW81WTAvLjMW7CdA2Ny9yXKn6Yi2q0XZzYwF40B0GHEZVc//wKg17+1BQeW
         m3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356381; x=1750961181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4GDLvtDDGSq/Qy+QO7VaqR9d/e2gHqaBWo5/ZVZ0dw=;
        b=n64vWjGNlt+h7qvQF2gnHb0n6kGeg4Cl9Biu8ptHBAjIjQe1Y660RY3RxzpQ78b/C1
         8DD9iJDcXV0eHfdB4T1RfRKn0NMMfOvLS/zZ5OArWx2OdAd48nj5aWc1FF3HZsfUFVfm
         kHJDdQBNxASGiu5vFeFadxprBkac3mO/AI5+b9c4dxARcbW6Y1fk0jn300NrxmqMoOuV
         ON2J2WFtBWLP2DIqUW/2ahcEVtZpAnOnDVmHLE9b6yub1mzAL6UadAjuvAapY2Y3fT/t
         DWpng8jSZh/Dk+jyYsb5RUAuvphZ8HUWiIgPanCKIfwKzrbW8/JGbmMKkTP0xVnDhrRC
         GbLw==
X-Gm-Message-State: AOJu0Yx6Ir50xbiB4q0tDUQ/Qqo10+/0DPF6I4SUqlL+WiqqSoligx2d
	wI6Dwb4wCEV/qPVwOrkT393T7dUbXbyIHQuKR4hzsjOSCzasmo2xe5yJ
X-Gm-Gg: ASbGncu3Vgezx9dWAqIAHG4sEHScM21gsh7cad1MuS9bRP18wP+aASKcDGU6Mi66R9W
	TzqDmcAMV+ogU8jhuhS3SgA2olRjYJyeobCdQCmotibt9T8JgId8TBnOyFGvDSVTswzcEIpRQHV
	GGsond6tyFwvy08uVObDmq8YYKouHX5Nv0laggbQ3OIRMvygR54HL+4YrYtjqi6kY4IoTDFKK9I
	D04ZBatwM4wbMtntHt+8s4KCH/H0zV78h4kC4s5nuefb7z+NOGf25y5rCQuGq3GCuQEsgS9vEdK
	MhFpFGb1mXWBkkQd5uMG3+6WMeMebLOxAIIpzJlZu2J55D2q3nDsU2kqNiPHEvnCSQZXHyRISNZ
	+E7P5DjfxkeGZrHlgpsvwx0PMsJHPpOWo
X-Google-Smtp-Source: AGHT+IHxrn8+YzC2Gym11QFTWAVlTIN4KBCnYKHhwrYGEJWoN2lxoZ8l/K5GQ47Xp/SejkIjNj8WIg==
X-Received: by 2002:a05:6512:3d88:b0:553:33b9:bd3a with SMTP id 2adb3069b0e04-553e3d07f75mr41038e87.53.1750356380896;
        Thu, 19 Jun 2025 11:06:20 -0700 (PDT)
Received: from [10.0.0.100] (host-185-69-73-15.kaisa-laajakaista.fi. [185.69.73.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e3e43dd1sm6505e87.128.2025.06.19.11.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 11:06:20 -0700 (PDT)
Message-ID: <d2883cc9-5ee3-44f9-b3a8-60a1adbb3e20@gmail.com>
Date: Thu, 19 Jun 2025 21:08:12 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/39] ASoC: ti: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <874iwl20th.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <874iwl20th.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/06/2025 04:41, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/ti/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
> index e22e41af32269..3323cf96e3095 100644
> --- a/sound/soc/ti/Kconfig
> +++ b/sound/soc/ti/Kconfig
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -menu "Audio support for Texas Instruments SoCs"
> +menu "Texas Instruments"
>  depends on DMA_OMAP || TI_EDMA || TI_K3_UDMA || COMPILE_TEST
>  
>  config SND_SOC_TI_EDMA_PCM

