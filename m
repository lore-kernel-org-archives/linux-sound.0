Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDD39850
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216394; cv=none; b=UTBOYbTstg3HvuKFvyTCq7nmTh/CfL3yk5ZGgqYISlbcmmsgTm2BRvPZR22ZDfvxj6JqvW4ul7T3pCyKWrTEMZXZyQJZlGtr5YURQCWBO1Oo6Z3+AAFdDzDcoe7e6KZ/xYTOw59/GtwJLTSLRctSq8yN3i7+mXyF5XQaka5EhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216394; c=relaxed/simple;
	bh=7m0NLHe62plcr+KKn2aUoCMSPm1X8JIzBoTlRPy0rf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mspG82qIpES9QEx/J6m7gxseny3lPJI8hdRsauUfeBvBWRmm+lfECVkRJ4kkGxNanlChZmLbxjaXFPeBqUza8L7nhfAgEifivBavDeIR7mg8Hz22HI3+UEHAhWZcEtRfiXnicWcZxyLyDOHQxEGU88JN5o84YQ25o/JvaipXOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQlfMnEt; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQlfMnEt"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebeefb9b56so1158091fa.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216391; x=1718821191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqNOK6VrunTwe+R6PcjcYFGfe2uxZR6mzT7FM1DBlfw=;
        b=vQlfMnEt3BO1nbAXlsGVb3OW+yEvA4YPkVZiw1osN5BnWh3MkGb84Sk880BdY4qK+l
         J9oiocYCrVWiOTNKG/kgvG8HPPz0d/HRHRdEVfLQeQjUaSq+dnTCog6mWrK/+TXv9keU
         Z0dzi7e7AKnTVNlGcESIeGBCT+7xgvnJC06csY0A4dBA9eIZ3xdnmcB1EkwRRf2+sPZ0
         5UtQ/Pct14TLkkpaSkLTcwjnJZu7YPUEhO5+q4MspKtSTXRe8h42kq2TZArmDZR4Yu4J
         wBsrfxy3k/ZsbIKa8izqi4aLvfLsK20/+Cvo6HkfbDo/ukcenXAF9q6n9w6Cjj+yJKM5
         T6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216391; x=1718821191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqNOK6VrunTwe+R6PcjcYFGfe2uxZR6mzT7FM1DBlfw=;
        b=X1CF+Vwm33l2LxkusHTvv/RMoNudLCqHp6EES2ruRYHN6G/A25EgoMhbKxca8OWIzj
         7ELmP+KGzEn1+hz0KuZdAcTkcBHJKbVCQpMiM0FFbw29fR7Y7rVwBncWmYrwhsR7jNZk
         lLiHCgW46gtm2fC2vuovttiJuyo7zfTFQmR3JvVAPSB6EpztQcnULvIgPjhQP3KEQdUR
         hTINFWjkf+BgOl6g2Dvvhoyp5JgYfPjKoHKE0A9/1vXhBH8o5tJEU8qYpzGXnAq0+V2k
         yvUM5KsWpHEfnM7TGS6snHJHJjPsv+Gg9doWFhRnRQrrpElNIU4Oo9JfYCjm/5y/QOlk
         nkMg==
X-Forwarded-Encrypted: i=1; AJvYcCXbi16s8t2W+aZfJ1+Jhm6l8CxycbCmJyBqRq4xXhVgfEcjbGa9tb47VHSNx+3wclINfjoFmT5wHcVFtlE9Vdg6XoSM5N3cracGKs0=
X-Gm-Message-State: AOJu0Ywk7YmqVv0U20dzH4uCS7T4AbPID6we6n4pBeY6zEyvG8jjl/yS
	Sa+ciXuoSvssYSihD5zm3hKmvOY8OQmS/YMyvcoR6BUuQs2aDWS8lw6qqiUKQus=
X-Google-Smtp-Source: AGHT+IHwWrOxv+6BSvdQ2PNy6rTqJ3e9pBd+N6k30YVyrZHLYYoJG+Hkk1QVviuejSmiogYnavs+FQ==
X-Received: by 2002:a2e:320c:0:b0:2eb:dc66:c49b with SMTP id 38308e7fff4ca-2ebfc99c4a0mr18310981fa.44.1718216391279;
        Wed, 12 Jun 2024 11:19:51 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57c80997d90sm6072608a12.25.2024.06.12.11.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 11:19:50 -0700 (PDT)
Message-ID: <eb551b0e-4d19-4a8b-b9e6-70199029e8c2@linaro.org>
Date: Wed, 12 Jun 2024 19:19:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>
 <dxkgfqxdx4kovs4lfgl6y22chv7b7skmacpttp2z5nzhqj2ijh@6sofslw756mp>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <dxkgfqxdx4kovs4lfgl6y22chv7b7skmacpttp2z5nzhqj2ijh@6sofslw756mp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2024 19:18, Dmitry Baryshkov wrote:
>> -	memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>> -	memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>> -			rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
>> +	switch (rx->codec_version) {
>> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
> I don't like that the next 2.9 version will end up in a default bucket.
> It might be better to have an explicit list of versions instead and then
> return -EINVAL in the default case.
makes sense

--srini
