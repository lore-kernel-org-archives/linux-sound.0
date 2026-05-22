Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F035E940
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779467061; cv=none; b=eP8hhYWgyALPqF0HUCBaIkjG0kqwDKeozxCt13BU7xQLJPELcEbiXQdozLEijG3rG9kevcYh79/CK/wy/7Kkxe50xe8kQPhd/c6MYEogo1BW/2Ssbv76b7nK+4Guxn6n4hrXcOsDW6ea2kzWKu/m5ITc/aZSvbfTOkyTyUYHPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779467061; c=relaxed/simple;
	bh=dEBjiFnraXpZDoARS44T/1yx4GPXT7YfcKp0uo1xJZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hzjj2yiQCkyuMK15Ht4Uq966x4YIfQchpTk2/UccUDUNbbu9ji8pJl82yuJX4HXqZbJF02fZTiwZdrM0XL08qOs3vKVyNc2lf2MI+vEG5IolDKlqbEHeKasTRRGXVOFD678RlcIRORoQPEAXZoihlN7jb5SEFVDkwqYTpvO92tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cz4+33SO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cz4+33SO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d75312379so6366018f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779467057; x=1780071857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=;
        b=cz4+33SObdvz571vCaUifVzOhs/QTk3/pJZIBEGd+qJSBmgH/z2VkK52BVeVXhxFEn
         a6wszBE2YAf5s3Pf6+QP8ecnUv+Q6iHHxXYJ//Y3tBHdB1Ngd+d8loNuD968a+bFOYyi
         aTYIOHMPIwupB/83KIWrY6mOiBWOplTIjg5ufcMMhK8xtwvuJNGFqeiFQYKFeAGk/aC+
         WQlCDShD8rIw9MJYbG84vNFx8hVpN4ryyYghbD3xlPr5s68X/yaW12XzQ4fS9PlaldaM
         6KEWTjk4BE2het5bj/3HJ+RC+8IzgCPf7gBuHBmpH1brQmULiRYKM+WQkEkW21iCbkoF
         y0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779467057; x=1780071857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=;
        b=ohjy/jlMNzqEcvWnm6yknKW7VT3ucN0XTTWEKIgfVS90PcN4mK8fpmSU1V9EpUWCnq
         YVFksoNgPxPZrvAu8RiomzniQnd6OzFfS74FL+elHs97vfFPSFjbjZkyfyclKkoT73BR
         /FDRydyAymRBD1+Q94/mlvKF4crFjjnbAGEtzhBARBGO1Eph09QtWvZh8MCW4ebSgP8g
         DkdMPyGo+ekrTuV1oVSN7hZLPa8Qu2PtwQ23xDtGIh9zyk1oCBzqPiKWexBMg3M797sL
         vFdDYxLpqTqrUNcD/oScQk5Yfs1ny6M4HX5u/pMoNjkt5Yc3hBLxTu2vYF9K59iyec9a
         lMuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NwdBI2zU1ocALVR9qoAS2sfGT1v2Wp/etZkbjSlxrLpmsTBrOFAaa78jQ7Gx92jjMeTxC3g/5Hcmnqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvX85IyQME1wxopm7FowDG6RMPC5MHukpA9BfhwDyNODpJDXkx
	oV+JkqpE8iUeKGTrhg36maC1/fS6PPa8UZQH0juykMq918U3sTURIS+7w/rNLLyHFtg=
X-Gm-Gg: Acq92OG+fIlL6gKaysKlL+QEWKzFYIxNieNzTyJpDfSE94hmp+ZL9ieHWsHnc07pZMt
	i6X+SmJhmtD6Fxv74Ac2skXWnKKdfuKgHvX0jMhqmVo8tS1WklUAX/erTtRwgdQ0fZyWHMc4nPF
	cZrOCQ18VVWfb8a07HOeNI+/nxqNIOSgxrbcIhhrWdeKGfwnj1l7yGCCYe9tBSABdhdju4EJApv
	gavVQNTvhUuMWUk4VnvYLYqb+RW0LiiqX8A6RetIcLw0V8uN0p3gC/8/URxBLUl251pwXPMrvZf
	4FTtgObJmGnkZhqKSh61dHCdoZ1BMfsSKt25SkeJ7plOseoFsq2tf0tObtsBiMvefwDVgV7SQl6
	x9ncwqMPueQ1tXkZKzD63iIudwyaIA26bWrAIwNC2NX3CqLbK2MFRpJpWRWuY3kdBa21gKp+uFm
	xG2FAdrDA4n20pL4fDVmpfRNMkaA==
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr13404994f8f.27.1779467057126;
        Fri, 22 May 2026 09:24:17 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9dd03sm5868666f8f.7.2026.05.22.09.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:24:16 -0700 (PDT)
Message-ID: <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Date: Fri, 22 May 2026 18:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/26 01:15, Mark Brown wrote:
> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>> Create a new DAPM widget for "I2S formatter" and place it on the path
>> between FIFO and output DAI interface. Remove I2S output formatting code
>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
> 
> This series, it looks like this specific patch, is breaking pcm-test on
> my libretech Le Potato board, the clocking looks to be seriously messed
> up.  I'm getting:
> 
> [...]
> 
> Full log:
> 
>     https://lava.sirena.org.uk/scheduler/job/2786342#L1934
> 
> The prior patches seem to test fine, it's this one that seems to
> introduce the issue.

Thanks a lot for the heads up and please apologize for the problem.
I wasn't aware of these testing tools so I based my testing on playing 
with userspace alsa tools on the physical board that I have.

I will take a look at it ASAP and send a properly tested v2.

-- 
Valerio

