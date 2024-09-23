Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF8199EB4
	for <linux-sound@vger.kernel.org>; Mon, 23 Sep 2024 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727107151; cv=none; b=s9/6quIMFoy6IrQca33+Ey5HcCmBwpag2xITCteURdW2lXtLPITP3+myCsIVfs73qpxy9AWBHUqc+0ECBMoeRGLR7QejuNkv5OoVGwdWgG0F4ABsL/seFjcLywNFz4++glL0xso0l4QpOtaBgAyc2EP2CRt8KS7pCb7A01LLp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727107151; c=relaxed/simple;
	bh=/GlkOidwdJOEopYgUf6eZw8pE3Bw68rcYwCXDT5xANA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0gqttFvG88rGY9AaWxPeSuvxuQujbISQGDUpkOLS2BlnGN7FpGaWjirFVUhkpLazU1ix8GiiOesznHV9TMVpS+E98Krkvfv5Fw9/RXarBBXPNffSlI8f5Gmd9lw4iiwV5WyGSmXXxmTp2RqSczHH2GB7g0qYwXQRgPcc7z2jwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SN2hviSu; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SN2hviSu"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a0cbc08b38so18259635ab.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Sep 2024 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727107148; x=1727711948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ON/KYugrzpyLJZkkkpVr9k7hwbS6LTFgvWJRgJ+w6tE=;
        b=SN2hviSu3JeJSHMgRKq9j1R91Y/IKSRTzC5uX1S0W8uheJwzdpRas8Ha13xufEhH6L
         UGB6KaIA2x5zEnJcfbUITVIVkHYoO23UUXGPyCq484C+NgX3eymPcPRc1Kp89/Al+/97
         DEhl/HETU4aO/o98fV1i37JXDErla60a7fDoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107148; x=1727711948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ON/KYugrzpyLJZkkkpVr9k7hwbS6LTFgvWJRgJ+w6tE=;
        b=b6rGXS32QxFWgTNjohRl55G1ToWhGc6DHDFOzM0Ekqezubf+G2eVv+gIgZBftH29qx
         lbcQiMMdLYBPRONocBHnvRICRuIjmppfv45SSPrfjbWAs+JTgE6M7hMxfr4mkvb32W/0
         4jCBaVNIE4JNW8wTX0NmbGJiG/3lQ4BlXGcSfHAHVvFxVdoreR6I1mRE2JuT33EztzTi
         6pFp8sBR9raKM23oHBvt7zdIHzPHT2vp6LGAIVWOOwIcYcXcaMLvETZsi7knOMsjJ9Bs
         DD5aCRXtID+61U/fbBPWThmJQxNtPi6s8qGYHsG2WuwwH6mKYAsTDRWPuN0CXG6EhLbr
         GrzQ==
X-Gm-Message-State: AOJu0Yx+Dx51tormMgKUZ8lUCDPSQp3WrJ/4ReSN0sUnywUN4RvyAL3y
	j8GbnMAJJ52KKFWki9QMC6yl57QaAr56T5PfpzfIvPnQSLtob2OhNs77bdj66lU=
X-Google-Smtp-Source: AGHT+IGnHBN4o8JvSDpzM6HGewQhcrOG8h8dbNEU69nL5SqQwP6XjWpY6ODOv4sGxMEkdc+THAnf0A==
X-Received: by 2002:a05:6e02:1946:b0:3a0:a224:eb3a with SMTP id e9e14a558f8ab-3a0c8ca77ddmr94722165ab.6.1727107147974;
        Mon, 23 Sep 2024 08:59:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a092e1b608sm61878095ab.38.2024.09.23.08.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 08:59:07 -0700 (PDT)
Message-ID: <a4a6c672-ddcb-4f8a-ab5d-84de237129b5@linuxfoundation.org>
Date: Mon, 23 Sep 2024 09:59:06 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftest: alsa: check if user has alsa installed
To: Abdul Rahim <abdul.rahim@myyahoo.com>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, shuah@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240922225824.18918-1-abdul.rahim.ref@myyahoo.com>
 <20240922225824.18918-1-abdul.rahim@myyahoo.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240922225824.18918-1-abdul.rahim@myyahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/24 16:58, Abdul Rahim wrote:
> Currently, if alsa development package is not installed on the user's
> system then the make command would print a `pagefull` of errors. In
> particular one error message is repeated 3 times. This error is returned
> by `pkg-config` and since it is not being handeled appropriately,
> repeated calls to `pkg-config` prints the same message again.
> 
> This patch adds check for alsa package installation. If alsa is not
> installed, a short and consize error is returned. Also, it does not
> affect the compilation of other tests.
> 
> Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
> ---
> 

[snip]

> ```
> 
>   tools/testing/selftests/alsa/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
> index 25be68025290..944279160fed 100644
> --- a/tools/testing/selftests/alsa/Makefile
> +++ b/tools/testing/selftests/alsa/Makefile
> @@ -1,5 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0
>   #
> +ifneq ($(shell pkg-config --exists alsa && echo 0 || echo 1),0)
> +$(error Package alsa not found, please install alsa development package or \
> +	add directory containing `alsa.pc` in PKG_CONFIG_PATH)
> +endif
>   
>   CFLAGS += $(shell pkg-config --cflags alsa) $(KHDR_INCLUDES)
>   LDLIBS += $(shell pkg-config --libs alsa)


Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
