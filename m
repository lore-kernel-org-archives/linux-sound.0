Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60718CC0B
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 05:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728537519; cv=none; b=pyZIiviYLVSoMm4yF5RRHTpS/QdgdrUrTf0XDdTqH7w0CMzvYz/0+979DNdfHcP/Wobxl37PphX6I39ZKqDokhne60LPpPY6LoQPvSQCogEcJirSH3VvnGArMUyHlX62ushmKG+Fia9gBFMTMVFmbZWEoPnhDfWtxsbUW6DbF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728537519; c=relaxed/simple;
	bh=NAaLcb1c56IZx8lzNsfJTIM5stUx1s5veN8SL1v17nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vl3DyfIWowPzVzHZYII5dCYOMzq95YqeXVSO7HH+Am8Z3RFtkY5wRNbBcHmd1ALd8NCOqtvBGFTArSoje+gaYiw0bGi0NsLPhRmErE1YfrXxdjG5mLD202uvnPs4RJ5+k76ILQ79SGQJAabQMpKAwp0G05jcTWAZj1LAUGjVMDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXSoDP4q; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXSoDP4q"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c8daae8ae3so84162a12.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 22:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728537516; x=1729142316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fKhs0S0gUj775pvsh1Bp/mrfRNzAsV4s0aKSxIUIYeA=;
        b=jXSoDP4qzTaT6QwLQUdt0MZtywKA3AbYiXjmZPreVgriubqBCl1FsrFMlDCLVbneDE
         xtpLZ5QxEryzLIAoCN2hPoBvFfdRKngftyTsH9gjkwQp/GdKXPT5qiZLWTlGna4mw4x2
         Ng7JDaPd+q7pO5WIGTQSFJ68FVfDi98nFm3OL16hCpZwE7C/F+TJUzKZRcqPOBASgemZ
         t8tfZAFdR2vEv2EvIeL5V4+3u6bwB4lMMzIlwKIjryjTeh69iM+44zLjWzgSuaueRjjv
         xQFPXtHtmYxd3bH0I98AqGfqvmn5XNcLggFY7u10u5JDZ2OD1lk5WDyxfAWlWny1+uqn
         ygqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728537516; x=1729142316;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKhs0S0gUj775pvsh1Bp/mrfRNzAsV4s0aKSxIUIYeA=;
        b=XVJx/AKoJ1X84zKpPt1349QQbrgK5WvCgC29mcUM3kS54Xg0342iFa+0P6e7/m4W/Z
         bmDLGUIU2WF3B5e9rzy4p6AiMrV3ac9SYyafSplCb69inrQU5ahpXjuI5kyip/Enow4/
         oLxiSa1rcm0sXHnm1e/DIXzx3Kxog7pY/QGa3VGfCrk1c615E0XEGOd90Xkt49fWs8Ov
         4KknEOrVFmBbQW7XrIwhox1pYaEe+GkEzYUDRDSLMFhJa1kileCPwztFCD7FFoBh/qPX
         exkZNEzon9V1nGuB1VklsTj0z3UNi2UuCBUHDILnJofxH7PvvIhtyth4c0TXeng3856w
         FjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE1PDBpH3+FDe5Mu8pyHGfQ1CaglVxmZC/dZXYdz8CVTz+JdT4RmbuepeZgaTvNfYn6954FQfHynXfpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWPmQ0bdkz/psWsm2nK/kKIeiBSHiAJ4vIcaURQcwKHvRJXRHp
	kysj8ePlFQxZVpqkRwxxKlVFeErNkqRtwlmwrU6XvfFmqG9IBfCT0ErC5cg0N1vXLIT30kS1h9z
	A
X-Google-Smtp-Source: AGHT+IEp/yBMUunQRs1yALlfTSfnv5vE4xHYwvDb67zuYa6DMR5OjTvZRFRSU0fQnp3CPhCUkuiQbA==
X-Received: by 2002:a17:906:c151:b0:a99:482c:b2c6 with SMTP id a640c23a62f3a-a998d1fe04dmr202804466b.8.1728537516271;
        Wed, 09 Oct 2024 22:18:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f27bd7sm32218566b.74.2024.10.09.22.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 22:18:34 -0700 (PDT)
Message-ID: <f46623f3-b915-42db-a1e5-0427df310b8b@linaro.org>
Date: Thu, 10 Oct 2024 07:18:32 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime stream
 alloc
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: stable@vger.kernel.org, broonie@kernel.org, dmitry.baryshkov@linaro.org,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241009213922.999355-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2024 23:39, Alexey Klimov wrote:
> During the migration of Soundwire runtime stream allocation from
> the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
> soundcard was forgotten.
> 
> At this point any playback attempt or audio daemon startup, for instance
> on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
> NULL dereference:

...

> 
> Reproduced and then fix was tested on db845c RB3 board.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: stable@vger.kernel.org
> Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to soundcards")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

We should fix this everywhere, not only sdm845. I'll look at remaining
sc7280.

>  sound/soc/qcom/sdm845.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

