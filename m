Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB9C28150F
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190832; cv=none; b=qm7sPRm0UPF6XasyXmDSwUvg5fzP/+D58yetXbX5ayEXWIWcsOhuQADJ9Jl5smuYtmogfIunvkvzMLF4rSQMxrLray4I5ETlFd4uWewebtLfNj8oKTDe3rp0j6q0qDEo26njuPUEeAxw4hCV4lRvvoerwxVqy28oTdNPx+oWg9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190832; c=relaxed/simple;
	bh=AflhQFBgc37bMRjfFcASFJsk802GPFoaPSKkHuJhnLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2AOmlkRR4F3yPgw85YdqKVHRYr2QigXq2vHqOjrwsqWO6SqTg8j/nLd1bqaoejKnsqqjQbI1Nz/yoec9jcW3mRkD0PusoJQ8eROP7czRkrWReSry3pdzfMisLCODGWLSatkEKd7/aiQOrICqWLx2y9jVvPy1CJbZYN3AZk2xoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrUDlNTH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrUDlNTH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso1083895e9.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 13:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190827; x=1764795627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1ONlkYfuRmCv7jjHWqcvxcQvPGcz6nvvbcRowdhEXg=;
        b=ZrUDlNTHdzayAZQjMeQI37NyUGtylx/EkaHMDGUI73ZDLPPsE1pdO0Hb8y7JCFaR8H
         OiD4gvArzn543B5r1wJXakSDOxENBdC/7Ignvf6VMLgcG+Vbp/F6/oKyrGcDs4gZ+HAf
         w229s+lLp/YD7ZsvDRAWEGVEn0+MkKA9KKuB5Oy0H6KEg/779Iw0sSrGHjkNWxZJXQ2Y
         P07LNzC8sgC9z4qQldln0g+31RmYqYW0idD/MLrfekDYCRXlin38L8CqsRsvtJWt0JIh
         q3dvFsk2wR0o/F/CqgKzbtZEg1JhCj1hJspiz0C0cQV2M3Heq9cOaL8/96lUZ48gN0L/
         QtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190827; x=1764795627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1ONlkYfuRmCv7jjHWqcvxcQvPGcz6nvvbcRowdhEXg=;
        b=ILXM2Klbjose2QXw0Uc5jnYWTtkigzcxkIH183PT0WhVIuva5jey1DNcucmCn9uiHx
         wLePdoyQR1J43+9MI5jUJMMXwS/ABi2eObiO+TR9OVhnHvNrGncTLFbpTCdqxDF6AQwz
         C+PdKuEojq0+iVyNFl27GUvUtc6DbixfbMM1xMAs6o5dLF1ATptnsMJ3j2SDC7e8cARD
         wntWxMMGPoCVYyiTIMI2IjMBoSFHn4plRXapD0u86DBeATQP/SwjtwoZrr842EnNSDlr
         B6CRySxXWF/rOxhwmcukFrHYnZgvYaJ9GJIV7cRr/qzHRHjW7rUziw0vWleimg4PApQ4
         aysg==
X-Forwarded-Encrypted: i=1; AJvYcCUAXs/4CQCT3TRnwQ0NhP+0qYJsnAJ4fEMqI0PaSZeOOwO2TUr9mMRjdC7hX7i+d93rDlFSXwNMW3++tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3xO7dbdEGrn3Y5Wc72aG2gi7/ds0l+1lUEKY/jypAWGu3IbTD
	+HHCbd6FUZlfJpafdUN12ADChL2X0Qo5+xhSUcFCVyhVhw3wSKsbUqEH
X-Gm-Gg: ASbGnct7m+nF6g9uzlCPmLe/kTpmMGzp/MZ/eK6acl+fymphrLASSWO1PncwO0wRO7D
	WqMpBCBQYKiWsZfSt3GGUdgmRIWn+BjvyJ9VeMFL/qFh0T+Pbux2xdwWtnN15+cqHeYxcIcYWVU
	TzspOJVp4Lt9WM8Gxqeji3GO4zAu41iMyvIEDMN0T8rGLPEwiyYvLvh3AHkGa63JIq/2ZFJVRrX
	925ad4njP2I3/quoRI3w8S3Hlvof3MMunfuTMC0hyZAv7q9gamRUOwj4ZfCMdSA0UaMvXqs2GAi
	LloOgZ7E0coPM2QaSQ4XS461+cGvmsPWYw0vyrLcCI07j8ryc3yfaoPuct2j9GUB+9gzbhHa0wc
	6IW0bJVNL3YP13ZMODkw5C/9qBNDqBa6fmx7i7fRfD9oVqSiKphfss2hNebAEP393mIpP5KzqSl
	zXkRGGkum34dZzXQsLLgnLR6bIEIDqYOrlfN0gfQdr1N2BeW+BNyM=
X-Google-Smtp-Source: AGHT+IHAo8lSdxxRlYI47eI4OGQJTUP3rnYMhEpvlfvlBtzAp6rRaEQW3LTJv9z6WtfnU1XhfMx8Tw==
X-Received: by 2002:a05:600c:1f8f:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-477c01ee3camr206252285e9.23.1764190826788;
        Wed, 26 Nov 2025 13:00:26 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm49395485e9.1.2025.11.26.13.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 13:00:25 -0800 (PST)
Message-ID: <cc5a90b5-553b-48bc-9c20-7e8510c7658a@gmail.com>
Date: Wed, 26 Nov 2025 22:00:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: stm32: sai: fix device and OF node leaks on
 probe
To: Mark Brown <broonie@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124104908.15754-1-johan@kernel.org>
 <176409854967.84790.16552995327264561748.b4-ty@kernel.org>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <176409854967.84790.16552995327264561748.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Mark,

2025. 11. 25. 20:22 keltezéssel, Mark Brown írta:
> On Mon, 24 Nov 2025 11:49:04 +0100, Johan Hovold wrote:
>> This series fixes device and OF node reference leaks during probe and
>> a clock prepare imbalance on probe failures.
>>
>> Included is a related cleanup of an error path.
>>
>> Johan
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

It seems that the SPI tree is not the correct place for this series.

Regards,
Gabor
