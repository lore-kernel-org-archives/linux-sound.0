Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9072A35979
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771793407; cv=none; b=BaQQ4f8BNORjKRygSLll+KB0y039Hd4ncwOkXi01Idh/AA28DF1gDLR2qEdHbgoR7u9wpEiolPuZxIWE8yAaCqHNxzKj2YFX5ffE6vmCvvE5ofGQEMbgBAiypjdAAlClfku9mGQ4scgjBWkP32lB8oPR0jOuS9dQEyJ29xy7SLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771793407; c=relaxed/simple;
	bh=NXYkNlkh/pUwechfjHkC5Cl2yWGrJMsxbf25WftJvGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wa/xsLqVWOekX7zNPv9G9IeINub0oF4JM869NaVDwFpg3NJzgnZjyR1OiuPsdUFE6KOTbLBip77KgVzr8a789S2R0I2Vl37sy7mjw5E3zCbgAIOG5Dx1dkgWPfLo/IHGUZ3/cpPEU+M++TgxzXbhSz6d8uJlt0J2rQJ5M185/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=WjZpqGGO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WjZpqGGO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4833115090dso35125165e9.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 12:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1771793405; x=1772398205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+mFLg7ZCeZQN61EVtF5m/JRnFQnYeC5i4D37s1x55/k=;
        b=WjZpqGGOBKlUBYDj8V8JCSyJyiPFuwbjaVydRKcZxu2txTitWCtt1tNFCk/Wf30ZSa
         /csjWBEuRGgiooXs5riSU8fOU1Rlv+VAg9ukhbPC1t6x0HINga7sYiwm/2qpkd/iktDH
         MuEE7H+M5ZKHCpSa9jGUJkRA27vZ0O4XR3i10i+x3RVm+RPkcfieWn6/TCfxtXkrXHww
         W2kpE9oS/dXj/LH3GXEv5BqpnJT1/qjo8INOaXofYvep+si0PIdGlgodb7uQ/lY7UlLb
         OScFvOESC/Ge+PohC9Sy7TZLoaDh2owdI7oecba/NSV7t+piKIeY/MxgptCsZyoXYA7H
         M5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771793405; x=1772398205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mFLg7ZCeZQN61EVtF5m/JRnFQnYeC5i4D37s1x55/k=;
        b=oSXxePWq7ETquCmGFq2ZY+HCMqbqYBNvDmaTY2Q7oL0MBQF47NXY07GWtzT6SP3L1N
         XEBCAuy5CQq+obzTX9HB2P9eK7TiVj9C/+3NqR6hKeXsBFKP8Q6ScZ02V29GOnGew+ou
         atO4dy2Ppwm713503NCasmUEgYczxxzishDwUM3Km/qhNaQQvLFALONrot5SdL3weZ7Z
         PL5N316+KOResHD1fc+Ix1SDW00FbAGP295ciaVoNLjLtGWIw2F2r7WnDvl+1jGBo//G
         yyOrnE8boXkxKQfE2gjKvRuCCIQN/oYFKnxwsDBPnzC1zdUB/9002dKCwLHoeDwWE+eI
         r3Rg==
X-Gm-Message-State: AOJu0Yw1yEvLhRdMVHXnwcWI2BgPsLD35zQthhs9kb6+84Dlkjg4Q+ld
	DE8QbiK1NB9hIsEGzG7AGzit501PzQWjU1WLUER3wvuz5WYVaop575ue
X-Gm-Gg: AZuq6aKkW2Sd5bXTxjux3S7f9+NLhOgD+5UyFZ89p3X1Vtgh56Rdx4XoRC5JqSsSRq+
	Y/LlMR2lyVkKAuo2IS9kyBcmnNaz4TBGD86eE27C3koNX86Eg7EtUAc8Fx304hiZGOvlDVrYasG
	CmbJCS1NjSx4Yawy2XMXvLyAZqljlnGLDgOBW4xekAx8ZChiczB/b8o88R2w85LwNPh08El33Fj
	kQHaAyFb5cC4nN8XjYms5PREEzhX49SLZhfowYtz+bFxG7zzV0f4TfCZixJ7PqP+c10p2l6SJoE
	rAA/ENBaJXW358a4X5b1brGaOmAzdERDQYBmY6xMVFipj628SKZZ0UvVsGyonaPzBlvSg75mHJk
	QWLJW6eYBwhzCuN4kcuhwJbu3kYx9zuhmvcShPqKCLVErspmNsC1LXZdQHiI4QuVKnSrzU9YFra
	HyxYvoQOkKihERgXBKg8AzbqzpN+ZsZ4nsyyJyOGHwwgQG2J+DsWQ//rR+dt4getFqlxQycB8Td
	TzMp04Mv87WYLTRzfONOwUK68rctG6RxhMTesz4TLEfPdBSSGPZLHvxb3NfrD3PZCsiFtLc
X-Received: by 2002:a05:600c:528a:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-483a95e9570mr103963175e9.17.1771793404708;
        Sun, 22 Feb 2026 12:50:04 -0800 (PST)
Received: from ?IPV6:2a00:6020:9cc1:100:d125:77e3:407b:9cd4? ([2a00:6020:9cc1:100:d125:77e3:407b:9cd4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0370sm377534475e9.11.2026.02.22.12.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 12:50:04 -0800 (PST)
Message-ID: <369087da-2469-4230-a3c9-e7a59eed953d@googlemail.com>
Date: Sun, 22 Feb 2026 21:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51
 (2025) 0CCD SKU
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org
References: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
 <20260125195435.9221-1-o.freyermuth@googlemail.com>
Content-Language: en-GB, de-DE
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
Autocrypt: addr=o.freyermuth@googlemail.com; keydata=
 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
 fze6jkGoKl/JP9K8o+RRag==
In-Reply-To: <20260125195435.9221-1-o.freyermuth@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Takashi,

gentle ping on this patch sent on Jan 25.

This adds a quirk for the Alienware 18 Area 51 (2025).
Please let me know if any changes are needed or if I should resend,
I am a rare kernel contributor, so I may have missed something.

Thanks in advance for your time,
Oliver

Am 25.01.26 um 20:54 schrieb Oliver Freyermuth:
> This adds the necessary quirk for the Alienware 18 Area 51 (2025).
> Complements 1b03391d073dad748636a1ad9668b837cce58265, which added
> support for the Alienware 16 Area 51 (2025).
> 
> Signed-off-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
> Tested-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
> ---
> v3:
>   - Fix signoff, add Tested-by.
> v2:
>   - Resend using git-send-email to fix whitespace/tab corruption.
> 
>   sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index c013e31d0..f486bd74b 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -749,6 +749,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
>   		},
>   		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
>   	},
> +	{
> +		.callback = sof_sdw_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CCD")
> +		},
> +		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
> +	},
>   	/* Pantherlake devices*/
>   	{
>   		.callback = sof_sdw_quirk_cb,

