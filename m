Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAC197A89
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722336140; cv=none; b=iDTvq+Sp5LFd1EAY2aW22zR8nLml6ZPAA6O/DRPjREDNdus5tJoB+nRBRfhZeAEC65KZlzyVUh//+ywBZflUdYaRw+4kpaAVzQnVEMbwnIlSXz6kx3C5+F7r0Y85e0ZjNCYNiYUHIqcRCtx+7s3mcPtWjzc54W/ra2OQnhLXNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722336140; c=relaxed/simple;
	bh=1VRZiR2rqVPNl8VRXfZPLhHjOtvzuPO1/pgyFLT/s64=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cWV0jx9EUV36obab6DRmUvIbFoItoeANhw8sIsUI8BnzMFQpg9X+xZt7INCJ/h4GYBHeOqO8DZNz2S6dfUcGtdyMQNOii9iVvIfTNLEdWjxBYsw22+I4jIzv/EBML8I7tcKwXM06Sns7MVeUjPO4elmqm8uzfmNBaaFKZG4royE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zK9Zf+/c; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zK9Zf+/c"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280c55e488so16677355e9.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722336137; x=1722940937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6deSvIqqsQyDChLYyOgrv+pIRLeJpzpJBJQ+0ud0A3s=;
        b=zK9Zf+/cea/tsg/V6vw3S9elTwXNx9rNPEJMinKymKrMQDUjmzHvKzqhtrzgTw9MJR
         iGcMZbGw6cH4q5sO3NuPTp1g7pqin9G6EAj5v6wed3t7VfrtwzuOEl/nLh8yo3YI0I72
         +eEOtqM5wx7+HCqFhwNFkt6E6PLqbLRMZHgMuR0XJmeF8pnOzJH77QOKbts4gJqXmbvG
         vLEPiocaUH0wopz46uryMYACX9tTHm/T056F4AtcRoOw3SWjn/BpPHBV7SVN1PLq6Xtt
         +5mXof6iZihNlPEX8XDUlZtcFBETH/J7+u2Aj70Y8JxdK61DDQP7CvAlIt8FTNXwKQhR
         /ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336137; x=1722940937;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6deSvIqqsQyDChLYyOgrv+pIRLeJpzpJBJQ+0ud0A3s=;
        b=hWIKEmq0mH6VZ3Daeb8fKjV08vE/596DAGgmBxpFH1rTZIS1b6e2kPUVPsjSRfuHO9
         NuEJRzHkY4BQqvX+PDTta9HmouPOvnFiG97SCU3U6IjE9GwuS7zTSh/1rH/wgmYneBd1
         7UP4yX1rjk8TPuujAanlfEPINKEAmwtfWDGBkkXASb/v7Q9PB6wZEnpRjDOve66jddgg
         QXS6MFvBsJ3J9csxtP3h2bUyoceOq89xgEyoHxQBJRuqHCm8FX3zEMwHdWGdFDy5/ZrT
         PW8KHFISnbZh3bRrXxXZ2Fd/iAF0cDe1K/yjVLayRLHHEHL/GN2FgaiiEn8ePLjcHquk
         tP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAlLPN0ufsOmsfgh/Sqddtx7HsEq3LxOvgdHJwC6Y6deL4NVi1NsPoeHIcyZrN2029T6BHkdYcAMwR/j2D/nA0vIKu4AWdmGHAJ8o=
X-Gm-Message-State: AOJu0YxoDO1Yq7SlcjnTrCayJfnVT2zJhkdY4P0KpnhsvXTqswRydzCi
	g6UIY2bgLdoldGBD/scDsO4mVrAFK4y+YhcD42+cvuHj9xcQaJO4ft/Sics3kC4=
X-Google-Smtp-Source: AGHT+IHeXHY88suE4ewnhsolNXbKjO152PQ5psGYhMg2+jD7tzsUInVGMCmfVitO6UqhI4G5TKjqiw==
X-Received: by 2002:a05:600c:474b:b0:428:b4a:7001 with SMTP id 5b1f17b1804b1-4282445c599mr9828245e9.15.1722336136694;
        Tue, 30 Jul 2024 03:42:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9372e99sm248611245e9.16.2024.07.30.03.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 03:42:16 -0700 (PDT)
Message-ID: <6acf132a-fa8a-4737-88da-23300755f410@linaro.org>
Date: Tue, 30 Jul 2024 12:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm
 sound drivers
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Banajit Goswami <bgoswami@quicinc.com>
References: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2024 12:35, Krzysztof Kozlowski wrote:
> There was no active maintenance from Banajit Goswami - last email is
> from 2019 - so make obvious that Qualcomm sound drivers are maintained
> by only one person.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not moving to credits because lore does not point to significant
> contributions. Just ~140 emails:
> https://lore.kernel.org/all/?q=f%3A%22Banajit+Goswami%22
> ---

I forgot cc to Banajit. Sorry for that, adding here and I will also
bounce the original email.

Best regards,
Krzysztof

