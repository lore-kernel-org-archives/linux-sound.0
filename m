Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EA2A59
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282563; cv=none; b=gdo4M6AQcQ1QI08MDr2yOAtMpDzUtUZV8D0EV3iO6aIBlhlB+MkmTDj1hC8RgRPfvySykHewXoH9hRhGOhdd/JG0gB/rKWf9cOiER4vWi00dXSBfQYO1Lfp0yI73ag6xLAjUZ9Ww/Zlin6A80RKew7e7ChXE9rqi57XbovRZffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282563; c=relaxed/simple;
	bh=Ba0f2L0qBaPnNOoB5ZkJeLek3EUUQwCaD5yKAe23nSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlO6gJ5TfcoOioIj7skdV2pOguOwMQMxOey4cHQBYBrhrn80gWFjQVxMvmV0v9qt0+zmGMrWBke2fptWGQaFyrPw8tpGrKueBlcjBYO+WfXvu/Jajzig4nkuWsZvMgBYzs4zQuiap6QX4H7ktm2v3W+aWopMh4e5pVLj9dgrdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcBFu9AL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcBFu9AL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c83100bd6so1070847a12.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282560; x=1718887360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDen0vJUW+xT9L+oF3bv30VDdb8wwl+RQxO77NA+7JU=;
        b=pcBFu9ALlgkRRPXPR2qlqttv/a7kdoHKegtfR7z9gfkNnnPTWRCp90Sr3KUgzRr9yJ
         bffQTofk9xO60KQGTm4tgKZAxzcHt2VHiTA0h1XeLSB5BKJzZWe0n/Ir0BMyBh42O8u5
         xZyXBR+S93IOQonBvoLIY42vuf6WtlOD1AG1XdAZt35ZNn2uvnXujQZ6nnyKrKKWcvfF
         B8vKSB1ARZQ3spuJv1iQXp2DdDYxem0TA+Zq3VHQuZstbmMwdtmvmY02W+8xR9I5Ny+v
         DR1PirsF3eE2jFtKeDfVQtiIrK237taoKvtZ8Afr2Z4PlqQLq/X9j86bjF8QVnLxNIk0
         hk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282560; x=1718887360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDen0vJUW+xT9L+oF3bv30VDdb8wwl+RQxO77NA+7JU=;
        b=cl8Es0gYAdBIAw3MBabxsIMglHYMEnPQ85bVoudRuD4n7tdgQexY51phzb4FDUE9tE
         U1Eeq4fuSEme+M7rYoRnTggPyguvFNzZo73vlxoXUjS9eDZ59osOu4QjEYMkqTNnJssc
         poitCsP6u27AGCvOpTif0hIrBtjVwJGsfeKG8YBvf8xgEju1ehY+bCjwDgDYmTAeU6FC
         9W600aDvwvyoO+fT46FOxONQwTsjhNJtZ2s8195IUFFAXjatxa3ZssMK+rUGH0gW6yJH
         RBnuWHGu+Y1cCotsWMdoFOn4LFpm3LHN//SypuMTD2J7zXqg7M2WeuTFE05UA1CSZF//
         ZQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNP/pZOikENWwTi+tSdh5k1voI56bTVruee7oyJD7RNCR6W7+t0DWN07cwiojdEjCSNaovN161juxHoOm0Tr0PGsDVOZP6y16Sz7o=
X-Gm-Message-State: AOJu0YxKU0Edg+fh7Tpo4w0eWkgHUW7hSqzAvUBeEQkeR+biLjHBPP43
	xZLN/BElzEiEM/PxSods7p25aqycdPnNKARbSb4CQkY3xcQR9igD4wn4NO37g1Q=
X-Google-Smtp-Source: AGHT+IHhniSGyoEipOniastD+bMxg3ST8u3KBQmi75/UrvUJzOGUDP3BZAKq+V+k4xmYl27dFY/zmQ==
X-Received: by 2002:a17:906:dfe6:b0:a6e:f91f:672c with SMTP id a640c23a62f3a-a6f47f8c006mr276509466b.25.1718282559957;
        Thu, 13 Jun 2024 05:42:39 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56fa6a1esm68319166b.216.2024.06.13.05.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 05:42:39 -0700 (PDT)
Message-ID: <4de45d93-6ffe-4357-9aca-b9fadb3850f3@linaro.org>
Date: Thu, 13 Jun 2024 13:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
 <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 13:37, Dmitry Baryshkov wrote:
> [...]
> 
>> ---
>> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> Note: this didn't go to linux-arm-msm, probably because of the use of
> an outdated tree for submission. This commit is v6.10-rc1, it probably
True I sent my patches on top if rc1 which is why b4 did not pick up all 
Cc's.

--srini
