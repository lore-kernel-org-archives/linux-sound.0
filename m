Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206451DD885
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164980; cv=none; b=H7jy9Hpaw2xoMkdrTBuPEbPvDuhbJaVgz+X3SWcIwhNFGincOaCBW5uSAdtsNYFP6qEotWx1+9wvPmaSWfUdyVZDPFAK4y9B2XgUEjDvg6S/vt3bEraY6zw63NU9t9jh5vKz1xCabsQ7zlBoVRffgHAVL3Y2EhD66RvcVtE7Okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164980; c=relaxed/simple;
	bh=tI3JisUUZqv+yYx8ZH1yHQ51IEvfFrNUfANNeJcP6PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXnlmb00UqfA59PyJyCFy2LU5zx2we78zcQAX7TGPv6JG23lb44btAu1DZFt0W7f0PyRzqIXSbniBo7EFNdvNdZzoULlVTXJ1fcE5/e/y6aD1FOx9so/GK82GmeHRP4pfD77pPOCI7CsTZDlzJttgPDyDAw/6THBSqgbqBm/gwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zasYgAVz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zasYgAVz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4363299010dso14316145e9.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jan 2025 04:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736164976; x=1736769776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzXFqoXqPeZGihvup/K1NfREk7G96+/CIyQ/UfFxcFQ=;
        b=zasYgAVzCTNkd3vn/FuQXS3jRDhStTEGRvWygxrI9sz/08KwRX779C1NkbPyMr2t1r
         vRuk4sIot0RpLJz8O4XE+wWwcKhtV7Uym18QFQgWlYRuam3xNaBfQnnuPTISsOknrbKk
         rR1iinGeRXpM7Fme2IP2vRWdNRKkCyakN4KuV1SBeRdndgDOn1rj63Qnezzb/zG8mFZI
         Qg+AQsklMh39XTB6SDqtDb68XdtN+aJrFayFxXtESKfuBij37K9Q3tkJ7MeH6YNsiytQ
         Qec8SsB0itPK2PqtjCdI3PWj6mIYDG/S+URnTBHG9x27SED/FkfwmvHTc0gp8mUSH+3x
         IP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164976; x=1736769776;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzXFqoXqPeZGihvup/K1NfREk7G96+/CIyQ/UfFxcFQ=;
        b=ISbwZIAw3I/cLG6ojn3Q2ZzXGtxBsoiiLcCiUscKWgk7Jsl/uB3tJ7AoYYa0d847vZ
         ovmY7+8u1QVWepPaGL/hCp7umB+26H814MJJTFse31U6WRN839lszYDkBLMHf4a/VzXH
         GqzcPN26ebuXj/swnVXAI8fkp97q5FYR/oZzWdHXqdFnuSCCkZLEB/meRcn8+J/4LEEe
         Z3JR+tOji9buDgRWw/qFjDwjtcQbMDxHTFkgdq9oMThqzLHyFc5UCvD6c6EBWkZljK8R
         +sI5NJczpZlrGiuXyycoR95ITJ82+9Rt4b91uBHl7W/aQ+BacrQ6yCsB883L8hUlMsdJ
         3L3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrf8MO43L7hTaeizYfdtWltXaqDdGSNyFL6xzBqiqbIMezoVj4m/ZK7Q+lhLFJIEk84w8tOnWy2OzW7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1yFE2VYESTg/i88kP/GU/vasYXUVcn4GiY2TPZs9XHcqMIVws
	gqAHdvpqROe5k6uKcLSft27AOA9s5V0hQt8YqNmjvVmzxlx79prck0sLoJGnLFo=
X-Gm-Gg: ASbGncsYrNIwsDYQ3rUrG118GF8EKlFnifRMTly+2lz87a+Cf2JQP8ATi7iAdl1ky00
	eZJuI8fXTf0NnALJAf6qeACmFvAS2z+XF67J4TFMQJBxu2KyK/33cwOtlVdkTDAbjtlborx67Z3
	DufYq3oVQIJDh8tb9ELqZzOwYi/DJmQfuMUyNt5uexh+Dh7TfxEI7JAhOXt3NNEJt7ZI/Yy+5AJ
	P76oI5jaTG8w0Pl+rR9r9+GeFV8+CEjt1sTw1Pn0wkaY9Xe6m/IBYVDmxK7+0ueMj7QUtwOI/rS
X-Google-Smtp-Source: AGHT+IEGX8sgAfoexYfQwZ1bi3fe5bj/JteQLkwvpGCJUzk+i386H+5bqXijrus4rgkiGH6AiTmalA==
X-Received: by 2002:a05:600c:1d07:b0:434:f335:aa0d with SMTP id 5b1f17b1804b1-43668547269mr207373935e9.2.1736164976458;
        Mon, 06 Jan 2025 04:02:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acabbsm47372769f8f.93.2025.01.06.04.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 04:02:55 -0800 (PST)
Message-ID: <236ec8fe-b562-4242-a1db-48d1744f9d51@linaro.org>
Date: Mon, 6 Jan 2025 13:02:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] spi: cs42l43: Make handling missing spk-id GPIOs
 explicit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
 <20250104205437.184782-3-krzysztof.kozlowski@linaro.org>
 <Z3u/PNryXkda7GyO@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z3u/PNryXkda7GyO@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 12:32, Charles Keepax wrote:
> On Sat, Jan 04, 2025 at 09:54:36PM +0100, Krzysztof Kozlowski wrote:
>> gpiod_get_array_optional() for spk-id GPIOs can return NULL, if they are
>> missing, so do not pass the value to PTR_ERR but instead explicitly
>> treat NULL as acceptable condition.  The old code was correct, but
>> misleading because PTR_ERR usually is used on errors.
>>
>> Reported by Smatch:
>>   drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/spi/spi-cs42l43.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
>> index ceefc253c549..90180662c4c2 100644
>> --- a/drivers/spi/spi-cs42l43.c
>> +++ b/drivers/spi/spi-cs42l43.c
>> @@ -237,7 +237,9 @@ static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
>>  	int i, ret;
>>  
>>  	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
>> -	if (IS_ERR_OR_NULL(descs))
>> +	if (!descs)
>> +		return 0;
>> +	else if (IS_ERR_OR_NULL(descs))
> 
> Should switch to using just IS_ERR() if adding an explicit case
> for the NULL. Otherwise looks good to me.
Yes, of course. I'll fix it in v2.

Best regards,
Krzysztof
