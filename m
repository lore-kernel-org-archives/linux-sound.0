Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D41BDDE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jan 2024 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275310; cv=none; b=eGkce3kSpKxvRAyvCJYN6xTmxFIpCF6aLowv48tC05Gz5kuG0kdvEupWzLvzvH1065J9ML7EikcS83kLvmzShrm/4vBnv4cwy/dV6A6IQ72+FHH+XXLC7LoiLLYefJZDb1Foc1+i9GCLzzCjaV9TmgB6DmfU3YzyR6OYndB2dHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275310; c=relaxed/simple;
	bh=1R9J06P8/ttwwRvg8nQKlDyvCSA8pRs99L0R7r43U3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WyMORTZJBl3zN0nz2GQRH86RIn+gCO2Cd93mwjj+hNKdbL5syFQyEVbxikSeV6UufF7cX6f707JY/y7A6IXdgyKPq3N9i+iubkVR/Hw48NHcLYIf5VMusYkB+zu8h3vPIUq4Z8aYbcAQ7KUYAl4XYOFWq3uROWAWEuZqNw8x6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVkgNOv4; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVkgNOv4"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cf4696b90fso3364131fa.1
        for <linux-sound@vger.kernel.org>; Fri, 26 Jan 2024 05:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706275306; x=1706880106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LO4L/uqo4fUbqmSqa9g43rknnKsS+IuadX7TcgniBs=;
        b=tVkgNOv4Fxvo6ah4sEw+tVds0xgdZZJpijzbLF3AKd4SkOC6iSVEyw9upki654ODbZ
         hMX2SSzBMr+EEkcYdesK012Zohz8YnG/Wo/Ng9NlxDSlut9eUKMdBm2YSRfmusy3aFD4
         N84R7dT29dw8gTeRf3ccm3d+mVYktSsu8azR5I+11jEgDxNQpVcZipLjfCToEo1M7mcU
         aAWIdIFvvq2V1a21W0YOWDaK2aub0cUjBDFduEVJmb2B6EIdMqCz+FgOCXwaATpztWHk
         nPjDn1QwHphguTk4FKkOxLBgJYd5FkfPLKjpMn7nL+gKWKIJp99bGX8c79VbnQBnGDhK
         CozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706275306; x=1706880106;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LO4L/uqo4fUbqmSqa9g43rknnKsS+IuadX7TcgniBs=;
        b=VKTrICqaig5ZWp6TmMgwpwc5Ds4M9BHc9BFP6dn6zhGPKizruClIOgPnC9fpSeE7ND
         E/8qfYqPQwSWjYXSw2HVcC8jzq+W2jWf9A18oT1xG/jiSaBIqTTYbPo7FMdc+RrCu/KE
         AeIIRMEXWhwDShsKUYoA2mWnegR3W1FSK5X2w0/5CgPAxB68ESqvCdVQby8yxZRL3l2B
         SeFYrgVxnUMec/U4q5B6kYXMCZK6ATsogrCkBjYSwiwnjucY8rSqBm9Ba/beM6wlpsPt
         YRuXdWwECzHhmv6Jom76buMPVaAcKlfhSI5HjINhA9/N5YGtZPdJkeazF0p4VzIlXL8a
         YANg==
X-Gm-Message-State: AOJu0YyYar9+tF4+1dFxMH9bm3TcWdLivL83b6IGhJClG8D2OxLNGX1W
	mfcqUEd85/ZtwiotJEMGgjJoKLh1D9weyoEokX0adxBf0vXBm0Jd+wWAy9O78zg=
X-Google-Smtp-Source: AGHT+IFectoDvTKDWCPxyJpIrX26HU7+8ZDwO0GAD5uqodN7Yfl756aMvZYORY1aJ3oXoJrNbb17Wg==
X-Received: by 2002:a2e:9448:0:b0:2cf:34b4:63e0 with SMTP id o8-20020a2e9448000000b002cf34b463e0mr736158ljh.80.1706275306490;
        Fri, 26 Jan 2024 05:21:46 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id l30-20020a50d6de000000b0055c875c2095sm612168edj.96.2024.01.26.05.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 05:21:46 -0800 (PST)
Message-ID: <4d377c8e-8cef-4da3-9b25-fc91a7dc3d49@linaro.org>
Date: Fri, 26 Jan 2024 13:21:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn
 widgets on SM8350+
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/01/2024 15:31, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changelog in individual patches.
> 
> v1:
> https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/
> 

Unfortunately this is breaking mic on X13s.

--srini

> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (2):
>    ASoC: codecs: tx-macro: split widgets per different LPASS versions
>    ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
> 
>   sound/soc/codecs/lpass-macro-common.h |   7 +
>   sound/soc/codecs/lpass-tx-macro.c     | 666 +++++++++++++++++++-------
>   2 files changed, 501 insertions(+), 172 deletions(-)
> 
