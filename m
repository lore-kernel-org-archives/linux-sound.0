Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05C41B358
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770221070; cv=none; b=FnKg0VuKEmGYwLXey2fNjNxR2Dzfpj5v1NdtJs1T1KA7LBMmEik9M6KT4EFoZWoRRACfJPQ24foxwSX6FLQaT0Au4xpxRNTM+/fYwcDXW96cS/R7C578RTxIUwIxq3ljTVHLk30rVVaPeKAVwyFRUtIk0bPHmahVbNUzqiabLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770221070; c=relaxed/simple;
	bh=zWCABr+ACI/eCGjS5iUspzLSxrwMGXCkg8c7lt9/2S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqdTUV6wVf62K+SH4DqrrTHxnpxWMsV4HYJ34oUo/+0Q/B99ZInTvRT2uxIgmmKAiihhIz3KH6JoIpW7aQS1++dStSCOEHHZASfpmo9bWRJxSK0bmZ/WnqwjnMpnkHvCcUfRsoYuNmmgfQsRLHFKGUoLlICjQhCxxVuGG830XlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atVwjVMv; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atVwjVMv"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso14182e87.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Feb 2026 08:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770221069; x=1770825869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+r6NDajxJtNRB9NrOZoRQuvPv0+7Fqzn7n0uynO3D0Y=;
        b=atVwjVMvosTTgNtGVE2vySPS4oC4yF9z+D2t+tCCyReCWPYja11VDfDxcp4tXo2grv
         8GKTSxhQSU9R3pIuToiRwZfKIdIzfC9W7qYp70+WWo0u42fx7i+kMV3KEFxKXY8Ax1oj
         OtE+qlFcCrcLDR13HYnVMjBdUhPMW0YKq5xOUq0XrIKt6FN2i/tDCdzTwnVC8esdOS6L
         drBRIW3jM7PwkeiD1c45e6MJ1iOZjNb+jSxXeSxTXOavbM22vkX7KGB/Re6YVd88oIj5
         /hsuB+lekrG3C87M25tDCgTa3ciKovWw/uR+9RGnbCw7PbUyYrowqD6WGsuvl+e4b0my
         1DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770221069; x=1770825869;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+r6NDajxJtNRB9NrOZoRQuvPv0+7Fqzn7n0uynO3D0Y=;
        b=h/xPf/beiQZdNVZZneuMuOefXbVQAf/q0ipA9QGNQ3RZQu6lMz1olWU86eknFIsMMs
         oTju4T7X5dWzFtMfpD66ZTNRfliaj8Q+OViVzZzjT5gPbqPeD15JvYbIRfu+9DaFzdoE
         MEBtu2/DLHPToJt65C/31o2dbQN8KgulvgfJ5nKN13JKDHntksBlTOS30Q+RumI33uuE
         Q6CpeDknXostkIExnB+6qQC/7WIEM8udfQbr2Emjaj5Lr/fVx2VwHZf8+nkxMwSscYYr
         v4cxjNC3iOO0/kCJPjyQi2cujxeKGkkIAQy54dz1WwaVbUcCVC/JN8BJsH60ImDYXGTy
         0yMA==
X-Gm-Message-State: AOJu0Yx2/AMSZ5bnnuseR/KZ0Y9s3cHVByun1dPFpp8Mb0taayx4QhyR
	cL+sgGDCrdqOGJOEWJdTV7+qcAn0XA0L1efZp4/0lzKNJkvGHqunQnO8
X-Gm-Gg: AZuq6aIZR34nCXFM1jYF3kt9uYHJKJNB/hher/nacG4+xmbPzPLyk3AleOlgaJFhrbt
	rBMsZimjUxwqapZ9hTtqqhJTRicsOh2sSDFB+gMfC/+IGeahMPtEdddrk/PfW26KqqH7sfJyWa6
	p2Q2JTM1LpXqEys55Gxmo1iI0QEV/NMEo/8qVGz/0CRJ9RNCzaoh5CN8ftcfNqo3l20H6oMpj6r
	fukv9ewdTHcEqvlaMhfnS2L51PzHCWrtht6uRlhpIDcWtJjxyQiCAKaCGYYgvu98FxnwszEz+os
	ymE02FywBUp2dZABCHUD+NeNCPxAmDdmrkUHikd8YC0uLQaBGTMGa3OMKkzmE0j1ANXtF3fkKq4
	w6UL7wdYIZEneUOt6+nH2eEMroP3GVARkkGryGdr35R8REqeAtzB0ReU84DLU7WTjEmbpSqS5wc
	86zB+imFcWOB/uTRm2T/hyTAgpphgDE1tkYNGSIgtORSNp2WyXa5isarCZcYkjKSWyX1mChwO5K
	y7PBm47ZOl/SEtR8Ty1X3szhieJ6G7KXeE4
X-Received: by 2002:a05:6512:158f:b0:59e:13e8:fdbf with SMTP id 2adb3069b0e04-59e38b6d5f2mr1362993e87.23.1770221068362;
        Wed, 04 Feb 2026 08:04:28 -0800 (PST)
Received: from ?IPV6:2001:999:700:7c7d:ca87:d71e:154f:6316? (n7ka2o5f47ode54rg9i-1.v6.elisa-mobile.fi. [2001:999:700:7c7d:ca87:d71e:154f:6316])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3881b1ebsm755812e87.62.2026.02.04.08.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:04:27 -0800 (PST)
Message-ID: <2b3e4e63-907e-462c-ab90-0a1a94d91e77@gmail.com>
Date: Wed, 4 Feb 2026 18:05:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: ti: davinci-mcasp: Add asynchronous mode
 support for McASP
To: Sen Wang <sen@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260203003703.2334443-1-sen@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260203003703.2334443-1-sen@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/02/2026 02:36, Sen Wang wrote:
> This series adds asynchronous mode support to the McASP driver, which
> enables independent configuration of bitclocks, frame sync, and audio
> configurations between tx(playback) and rx(record). And achieves
> simultaneous playback & record using different audio configurations.
> 
> It also adds two clean up patches to the McASP driver that disambiguate
> and simplifies the logic which avoids the async enhancement from being
> too convoluted to review and analyze.
> 
> The implementation is based on vendor documentation and patches tested in
> both SK-AM62P-LP (sync mode, McASP slave) and AM62D-EVM
> (async mode, McASP master, rx & tx has different TDM configs).
> Testing verifies async mode functionality while maintaining backward
> compatibility with the default sync mode.
> 
> Bootlog and Async mode tests on AM62D-EVM: [0]
> 
> [0]: https://gist.github.com/SenWang125/f31f9172b186d414695e37c8b9ef127d

it is a shame that I never had a setup where this can be tested.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Sen Wang <sen@ti.com>
> 
> Changes in v2:
>   - Corrected patch 1 subject title
>   - Retained original order of operation in patch 3
>   - Corrected code comments to use inclusive terminology in patch 4
> 
> Sen Wang (4):
>   ASoC: dt-bindings: davinci-mcasp: Add properties for asynchronous mode
>   ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
>   ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
>   ASoC: ti: davinci-mcasp: Add asynchronous mode support
> 
>  .../bindings/sound/davinci-mcasp-audio.yaml   |  71 ++-
>  include/linux/platform_data/davinci_asp.h     |   3 +-
>  sound/soc/ti/davinci-mcasp.c                  | 510 ++++++++++++++----
>  sound/soc/ti/davinci-mcasp.h                  |  10 +
>  4 files changed, 481 insertions(+), 113 deletions(-)
> 
> 
> base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465

-- 
Péter

