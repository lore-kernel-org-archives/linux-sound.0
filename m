Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3B30AAB4
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761212459; cv=none; b=iwZFReOMy1haVUqyDF//fZYJziDIPhP2nFpowGKANw35zQgEu1d6TKMR9gyDaHVGDKpuJrfagxc7rBCwzFLI7CzkQem0RPKazzAZQI/sOKyhc+NGdxbrDrOyr/KFZx4R14KNOobFTY5Go4cxCGvQFYbs4jADeVFQOZGE6swKOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761212459; c=relaxed/simple;
	bh=XFs6GYFcsW+Swxxh1r01dqycQAXpAky0WH44+J03lMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5YhKK5Susxbbk58jKAiR/A8g8TFhzC5hSkjV/osLrb0rw9gKIhJXnz4o6JI94JPJkLdcgCgdj6MNilPI/DQmTDgSeBWX/DecIhTO0W2ap8Ul7xeQqtRIKpcz1gbrtBXXZHKozqbd5xPNPpqht00vC73i5gCfuR9lMD2UEBgMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+kq5ORK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+kq5ORK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-40d0c517f90so47201f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761212455; x=1761817255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=54eD926wH0mql4NxC+CJBCpNd7LiNPQ+SiCFUqnjFLY=;
        b=k+kq5ORKm4xUhB4gdvAenM/YSUVBmfhoPunILSKzBKHFncG0VVj1kzyyPgb0nzZXmW
         P2i74pU79vfj1aJGEbzty2MXcJfWPzWOGnW+MawljQfUPE8KdFdAVW1snfvRd7QOn3RA
         bi6wYEI6jOomJ/4sAY3t47HNG9Es04Fc2VwhKPi+zu7WeFD6MwmbvtUrfSZD7MlJa5pX
         W3LgGkQzHetrGEjowoBClBr+cwoyFOwUg2ZVQrO5BBJHIvCr4xKs8yolhsGVgFXmRYDf
         W6Dqf4xLY+3AGapMd3xX6m5NvvVcdfti2iW5RzB1DFLB9DdzijSTj5NBlE1tfvFHcFqI
         kwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761212455; x=1761817255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54eD926wH0mql4NxC+CJBCpNd7LiNPQ+SiCFUqnjFLY=;
        b=CEQnxS1EQLfoyp+8IrVFYtbjztkpc5+RwO9Di+gWZmcmF5lR5xZ/x0XkJqd73wBDo7
         TmYl16RLX7t4FP8FxiuAhstEODEb+fu2S7HUtq85OeK0fAnSeePMdFX+aNwGM3gVORng
         b6N9LQG5ya5SJs0C0bIX6a0yqPlONaL0m7/7T02ibx9fcGz28Crg6sCYfF6eOguwyNto
         ylOwYdMAgV5yUZEaPaBGVAdDg7/Cgkk1ZPvwbuALTYc+CpQBTt24yDb8gjA/rvqXj1cm
         PJhX00v/nbpDTcK82HNy6hbljpnWyhfYAH9KRAIpET2LkSaiz7xj/bZXKJ4jK35uD4D3
         SXOg==
X-Forwarded-Encrypted: i=1; AJvYcCVhNmKIKlTcWeCkIDStB4ileDNAwFpvKkpCrPQ/x35Iw5MCsOB/qZA2R23NY/m5ESBDewV93GJiKLbSpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlVwzYMCvEF6bPdP6Mi8PLuOfDBu/wMb4QWjCvbLK0+ygtn9A
	nx1dvYmSBgDvJFjMEuBR7eiGOj5ITRxV7kiUvP6s5/fBHxEtTBqtAO2iYmYj0PcNYQ0=
X-Gm-Gg: ASbGnctGjoEUyvxXnUvKUSNVgPDgW7dvCvDw5i+PIomZzfzXWRrC0NzbOMDK8Mfaalx
	Gdj6M9CY7BQtIxt+vX09E4KP5j4RxpfynGKWZ/EPvgcJY9dMpPH2LErVg4lSd2DYapjgiiATflX
	2ybDDyLKmpktiWCJJN9Q312/1W68bDRHxb7UQRbp/WNmc8Jaky6kkKbGFVUhzJwS+GYbNKu+gd8
	neya5dVF9tfNIYAknUOcYeof2mRkzvg2rBfaM04kr/SQnLpDmtkk+k2WmlASlEi5ttbfLEpGAw5
	g2AzhYEirt11Zz4y5j9GCvcQLAIqIEFL/N3TYsOIol3+qTf+9nLbfZrgwT8VDQ4bAf7NAlWfmfp
	hDkKVlaOpMmB2R9KXYdy4f1Y+bB97wv7r1mmvL1iQu8TytEth+db7AjgeLhhzUTZTnOiPWosp2I
	RE0gIasxWZoO3AKw4DzkzLkCjOI1kjfl8=
X-Google-Smtp-Source: AGHT+IEOetk0z4M/6d9ebdfW5x8jDx4XZLzEvCka+bNwZq3unLJPpG99NlPBddRaMwqqPNkdl/9MpQ==
X-Received: by 2002:a5d:5d0a:0:b0:426:f590:3cab with SMTP id ffacd0b85a97d-42704ca9e0amr8476968f8f.0.1761212455558;
        Thu, 23 Oct 2025 02:40:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898acc63sm2973975f8f.27.2025.10.23.02.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:40:55 -0700 (PDT)
Message-ID: <72c4a0a6-3c5e-4cc1-bdd7-c4795a4218a6@linaro.org>
Date: Thu, 23 Oct 2025 11:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] ASoC: codecs: pm4125: Two minor fixes for
 potential issues
To: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 11:02, Krzysztof Kozlowski wrote:
> I marked these as fixes, but the issue is not likely to trigger in
> normal conditions.
> 
> Not tested on hardware, please kindly provide tested-by, the best with
> some probe bind/unbind cycle.

The email prefix should be "RFT", not "RFC". I miss here testing...

Best regards,
Krzysztof
