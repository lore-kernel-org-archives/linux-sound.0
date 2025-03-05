Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EE91FFC7E
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741213048; cv=none; b=fQndgrtkUs/NtcEwGSl8NpQyI2FsLSL35lS8COHQ/r7+iMlQ4uUXiUm6CvaX93makt5MBvcmPob89cmhyUe5JrtdVmYXT62PAPqEvxU/MI385TKBr0L6R/VD7t2ImFwhVuCah3pIHIBSHy4zrkOGEDg9M9RX/4ce4yt/HCvjnGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741213048; c=relaxed/simple;
	bh=0EASBjsKyosgnKgR5LYlE5kSUH+MJui/0SdB/Sv1BfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8T2x6hjm7JrINVOLn/0cRInNweHfEG8Qt4vWDbzBQ4aKRl/VieuHQUI/j3HVAOVJHDMth71b00a4x7z+xW+8R5PSWWo8FXFuhNQukB3f6zhEmnMSSx/uTVPplf4/t+4E4mY/TptaOt88s1mngNP0BYleU8p7Zeav8qXXAIUe0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2uq83Ow; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2uq83Ow"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab744d5e567so8068766b.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Mar 2025 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741213044; x=1741817844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05I7Zu62yUz7WtzNJ79+oYpmHE/xDrzeMJzIBYcCoB4=;
        b=b2uq83OwB9ki9tUUbRqfmeWLQFYcDUD68KGCMGgw2qVq5gbwJJNMfyZdHkxeNgku8L
         M5yUcqZjAE3y1nm26Ng3dsyHQO4uTHCGG7xCJxd5/bRchYVFOTUz4GEg2nUua4byZPQq
         hwlaw0CGNMWPIvr9Pj7wof48/j5QUKt4KxM+u6O6QVB1NL2GYmvgJhOPEgiA9Li+7mx4
         vOFn6IKFO/FukHhXNEnwX5a/692UlSL4Cg6DLD0iSbhdwRXjNziBKawlhcMhfeNHGE75
         B142Iifu389obFDsIsCSUzgTd3b3MejpvosPQYKi6pA/sQq2vMIaaNQKnRDBqYq8BKar
         HNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741213044; x=1741817844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05I7Zu62yUz7WtzNJ79+oYpmHE/xDrzeMJzIBYcCoB4=;
        b=rKcfoZd+InIs5/rgI491dzYeZ/fX9eYKmAlcvqJ1iMKN9KnkPOMJWQJD48x2nDRynS
         UkztEFeLSzjrQXIDUfOAy6ZZrIUZ8X3AOhagxiRS02jek0YYyrfdkoFRIOxE3gpGniN8
         kVW429ceLMwl6sGtazAAJs0b/ZcaqSaYboEIJD7l5BpJtw2m8vrET8cqIz5Nre5v36Q7
         FXDuo3I57IJwTHsAzC0pC/qfPPFUkeqwujOqvmdmLokKnwIljpWRPa0irILeAt70xzsj
         0NLcCegN8jIKBD4V6BOoZR8xQiHcOskm+w1/UU/rmM+GEbUNmQfqqxRN2YTk8LSSx5XA
         a54w==
X-Forwarded-Encrypted: i=1; AJvYcCVQAq98qalY1xC89alggEruGIM31F+MzIF/JN2ItnZumI/VWuw7EyEkvYt0LFfmgF67Sxuh0buUZdwfgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjYsLfd5WA63sGlfq8mnQxP7fFVmyvJ0C1lJe6xbMWiY1dFUnR
	Dfu9j2rLCZMz8LVS1G7SvXPeEuy9utjTVB9bt4bpUOdiwUdLhDqYDfDVhjjqFDI=
X-Gm-Gg: ASbGncsyovSmhrgbh/rPxpnqaM/86OszhlXx+b/W0ASqG8WelM6W8yUYkZasgBYx8mW
	+xqiV2PH9I9BzPlaCBiugrG7gMJhrIeW5bUJJIA58T6cOU8p07A9DxD9dvS73yYQTSx1ZHy3QZN
	YZyGCvBu2Awb+jdKYpD68taR/6kZRay/aUxMIqAJMzPLYgX+F5KP1kkZHHFo3J9PNuQRWubVepG
	s3qlbkEyuZ6q2li9nRYWm8RL/iDGSnUtVG2OLqMsWPx2pxgvunu9vsB8T8FiknTqZ4uxSkmSrmJ
	Fyu4LaOb95l/tbN0KVQN7Siey1FIzjJ5Grs1nfihGY2SokJ2fDC8YkGaON7c/gsvMZjIghtstMi
	4nH/4HjdimYqtW95OyIvmtFZA4Q==
X-Google-Smtp-Source: AGHT+IFySJJTv+uF4nFVy3MQo13MAKioll0wB0jIBjyasXh3UmkhJxVLukr73dcjkJKsIaPAWkDHfg==
X-Received: by 2002:a17:907:d24:b0:ac1:e45f:9c71 with SMTP id a640c23a62f3a-ac22caa102emr73495566b.1.1741213044551;
        Wed, 05 Mar 2025 14:17:24 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:1352:bac1:449e:9a8e? ([2a0a:ef40:1d11:ab01:1352:bac1:449e:9a8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac117f39e04sm529347966b.94.2025.03.05.14.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 14:17:23 -0800 (PST)
Message-ID: <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
Date: Wed, 5 Mar 2025 22:17:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Srini,

On 3/4/25 10:57, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see Audio quality improvements.
> 
> Any testing would be appreciated.

This totally breaks audio on SDM845, and often results in a hard-crash 
to crashdump mode on my OnePlus 6.

Unfortunately I can't get UART logs right now. But I imagine this is 
reproducible on RB3.

Kind regards,
> 
> thanks,
> Srini
> 
> Changes since v2:
> 	- dropped patch which is causing regression with pluseaudio.
> 	- setup period sizes only for capture path
> 	- fix underruns/overruns in dsp pipelines.
> 	- add fixes tag
> 	- add patch to fix buffer alignment
> 
> Changes since v1:
> 	- added new patches to fix the fragment size, pointer
> 	  calculations
> 	- updated to schedule only available buffers.
> 
> Srinivas Kandagatla (6):
>    ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
>    ASoC: q6apm: add q6apm_get_hw_pointer helper
>    ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
>    ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
>    ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
>    ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
> 
>   sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
>   sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
>   sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
>   3 files changed, 53 insertions(+), 31 deletions(-)
> 

-- 
Caleb (they/them)

