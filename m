Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D120E008
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593031; cv=none; b=ATzx4uggpqa1tvluknLUtbWCeTUAUbV9lncUoK+8citC4oRlFVH8nKfi5m0b42lFuDZC6uoiv0dAO7JPV1JPcry/SmTXCk/01S9zwuGMeICmdl0dzd5BkoG2tfAwUWpugebENVDKCjE6nxeabfdCmrs2dtrbTR0yArjWnPs0frY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593031; c=relaxed/simple;
	bh=IWZd5hlmNpgXQZ0243k8J0hL5ndXbwMghQLT8bz/dl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kD+o9HreYHfaO+abduQFLnOz3v+i9YGPKo9MWQHc56zwD7jX7EMiYDBH1RsGu654ZhPP20cxLHMq7A4bGYWnbR4mVuzNBtbq3GYbxUGHgzQZyhJ39cXj/qShvBnCfNyPfzeNqXsaCz60ts2VGP3qGL/Aay9B05NXU5m2bVRxHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6t8XjBT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6t8XjBT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436341f575fso52421995e9.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593028; x=1739197828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vWFSQn7DgiKs/FycuACWL8FOOG/NvIUTBk5O9mP/jE=;
        b=g6t8XjBTUXglndFfVqzVdljDbO83j/VyLnqhmpi2yiCIcd+B/JjEO1VX+PSEzhpfB1
         2mm2m3TcpfTFrd9fzqgIcDrHAMEL7FBLxATUFPpDwt68cLnjpvYdGkZSZoNruIsyTNvI
         WEAwBOwKtLarvSMuj9HyVdYnovY6n72IiDUi8//PujcqXANVlmK/NPcL0Ua88hqWv/m9
         N2DQ1WP58EL268ay/gp/QA/MYVysFpwFRtnpUlYlT8XDB0SfP0f84FmgVxkFjv424M2S
         +quj9z1OpbGV2gUERzN2sBjpbAod91jRgKlaTiD7KmUordG9dUCpnYb+0bgQ85X4zEcL
         6OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593028; x=1739197828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vWFSQn7DgiKs/FycuACWL8FOOG/NvIUTBk5O9mP/jE=;
        b=BcBp1GZIAxv0g9kXfSrXuwjMvk7s2L5Wj45HRrpUZFpYV1UUU3ckA5GXEUcZ4ewuGv
         8Uoq7lMHsFLREwl5/fn4AUN0gJvH1APLHPKHxMnuQHGc6gAoR5a1YIPyBnrDZj0D7xy4
         DeT7QwwEa1kgPoByP00sk/VGje6MgyRSfe7nhwePcjl8z/PUtUCU7En9xuU78/NGrUaW
         S3jLkYFBPBhhWHUArKNmzjv4loPKvCmdtuWyvE5oco4YgPziSTcu7KgSe145rlpbCyRO
         4dNllD9pgicWuznBkD1GoUmUoC82znM/q2Izua7KTTBkxy1qr8btoNJKxEBB8OGJN7fn
         hI8A==
X-Forwarded-Encrypted: i=1; AJvYcCVCVPz6G01SkpnJ8d1E9By4xNcSXRrKwsmJMUQKEmYllz+0v9JrIxXhWkMKvvE3t/TDJZ1n6h3mUcF60A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDy+0b3+M3hR4Chs9IRCwNrGbspFqSaKTcmmriBOPWqQdjvG4Z
	VPeTGQ1z/ubt6ZRa99fkLvcilEPEoW6ZcNnhdCrwnSTOgpj5DJ/yX8ep5ff+xyQ=
X-Gm-Gg: ASbGncs3lXTzR+QO2ztka31Lc+RgYrs8/MKcBp3OwjbebHHtyALCCX3lwZ7nja1oVWG
	Sn2oHdmUDnkVr8RA0wM0pwcbK37GVn4hn1DYjgwkPQ3InqDy+ehGS9C1ooQdQRbxcIl4/trXQm6
	zXHSMzs3HIjqBucnP6akYjBE0Hvz4k9qUpQ3Xd6tBhR+8J8mSWA3O6GhHQcaYTwPydKTM9/hdFJ
	wmE5ICwXPy66dIWTNe5HpHJF8dYo0H1qvP/gYqNQXu+1WXtQGzx6ty2LdX/h8rp+QU5SetS6vO1
	ZAR8q3FajW1xPXKjRV/Xg/8bD18HVK0WpA==
X-Google-Smtp-Source: AGHT+IHinY+xh0nJesZnDupVI2Wp4r4N0MF/Fkn9c+8reC2w8xLtTGDIrtM8PVUM9uRToGo6QBxJ7A==
X-Received: by 2002:a05:600c:4fc1:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-438dc40d55emr204148275e9.20.1738593027971;
        Mon, 03 Feb 2025 06:30:27 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc81589sm191206255e9.33.2025.02.03.06.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:30:27 -0800 (PST)
Message-ID: <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
Date: Mon, 3 Feb 2025 14:30:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 14:17, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> With the existing code, we are only setting up one period at a time, in a
>> ping-pong buffer style. This tiggers lot of underruns in the dsp
>> leading to jitter noise during audio playback.
>>
>> Fix this by scheduling all the periods, this will ensure that the dsp
>> has enough buffer feed and ultimatley fixing the underruns and audio
>> distortion.
> 
> Should we be writing all periods or just the minimum number of periods
> that's configured?  Userspace might not have filled the whole buffer
> yet.
Just minimum number of periods or 1 period. We are queuing up all the 
periods to the DSP, so that we do not have to wait for period interrupt 
to queue the next one. This significantly reduces the latency in queuing 
the periods to dsp.

--srini
