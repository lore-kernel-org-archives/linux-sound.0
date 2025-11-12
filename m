Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA323446BB
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968069; cv=none; b=LMd2t3T924XLIgYQbJRIZWc258EmjFPjOrhHJ0p8Fjq8NFv9n56MCACt84M7iA1yVfKi4nRNCLXSyfV2DxWS/LzesYndL4wNi0SxlumyP9q4r9HMNMwe7deiVmkZsGUnwh4Ua5bwngsD3Set31Dz+1PJyznB2CgvvZ8Qqd8Sbbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968069; c=relaxed/simple;
	bh=zGm3bjPIXNlAXsn923/poaK7/h5DdSgopChHq1KIJug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=MLtp2URSXTOtOh51XY/AMPCX443ckk4RL65/amx2GhU70yidz4QREdnLH684HEUeUdvfK/q9wpb9hkah6vNbA0OAWKY5HkF6M/3O3VpJVI58nNC6Wr0MbabYmIIumhI8/fE4KVfTubq7ir+f5Hcx2tz/Za6yqZ1rV4N+IvX2qlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9TrqFbN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9TrqFbN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b312a086eso816947f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762968064; x=1763572864; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D8BoUvcqK/7rHl2L0r4XdY6giRmTPN9ngtKeR3ez90=;
        b=S9TrqFbNcrP3YS5Uc7rdz6PzAL3g54MeF9cHf4b6VqPeDafcgVsOwmw3sVcAxW+SYf
         +kYZ8G5A1zVPRayt8sMogwJOaPtvzFRjp83uHjY4bmuhyPP/ULvORLZSyu5rRukDMrAv
         oe4Mtob5tFI/QAhL8K4A08M6tRgspAZr9rFNkqKY1CuEyuwiRzlmha0ipW1jef88mufh
         HtUdnYZGD29e3ULyHYB1AJmA5sxwYg3TX4ME9YuPK0B3SXLXHMIOCCKL0iDeU7NUoyZc
         6RXESpaWDJd3iV94l7X2grwZG3XtoyE+63VFil56xuS/4XFFO9EM+x/SF0Bk/4MevcWB
         Rh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968064; x=1763572864;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+D8BoUvcqK/7rHl2L0r4XdY6giRmTPN9ngtKeR3ez90=;
        b=EU3xybBDjRReaxhAaZoIku7DK4W5kegrACCUFglBGPQMILlNoZbqm2WdznI2TSIsFf
         T4uQaB257txREbmAwKuNDvJtIaD9CRRU4tbMj5eP919lLHUtHhu3ANWwDcvG31zLfdIh
         eJtcn6IYRtZ6P+uadb3fa6BSAQ/eIthlqCj3dv2iftmalXGkqW1kHuzR7gqJ9ihHdl6A
         /JYZTM7bn36upBQPolXNEEsaHfFCbGaKuIyEYwc7KUrmoNUWj1IZup22SR98tpZ28hyg
         ND9SpfYemuhqyoUG9D4B3KCARc+RqnsavCBVy9tK2vwQ9HskoeC5WNJ++IcaUyXHLDam
         thnw==
X-Forwarded-Encrypted: i=1; AJvYcCUUNvkZDXn17LuTQSbCV2sNHXoyxohmuR5jm5yyBQ2KYW7j6olhh6RbkH0pDbKJ/OCpdLq1RvKzep3PUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywnEd7rBsL4fI9N/kLP9bnJDkBA6L6AAUPDNYIGZunyCWAnaEz
	bdwkI+VIbyqfoVsTjPi+r7bj9jkTg4Cxw+s9UBzLtjXov605FatsMIAEyajs1VlXLB0=
X-Gm-Gg: ASbGncvIGGZfNqACCkxXBJf9ZBZ5XJ2n87Ibygtvmpy4UXXlkdAgA8x57ycAnaCQK5c
	+Ero0X9mT7xPdxzL0ovgzKgYBFgppzNatx6holiKRrAZN7dnTglkrux0gLKsHbxjWu12SucMu0F
	/CngCNovR7ebrl1+TB77fvjlVAYGNKkOgK3bP/eQMCt59w7+CQAo80rRGzmshQ702FE2zjT8eZ+
	QV9UnpqJhmSt3rK1JPWu4+aTz0ojVmpRpzrWxx9gSbwM+tQ4axpsmfC1hFtWbyTlJq0WDJlNU6v
	q9sXqi2c66r1TDfhzHN+ngrrEI/Q/iExk1t5ovoVx3p/AQYYbpINT72oWiAn1429wXGSE8sQXI7
	sJ7zp0CihWUZ9jHICTCwRj2xy8RDotztmAHdyf59D2832xb+W3Zeziq1JFila+hHSeIW3MvQzOs
	1HWq0uxE3ivo6SN6Y=
X-Google-Smtp-Source: AGHT+IFOnruwkehrKtiSlIIluNpW1jCcNK6zjknkUp1TXGQBb3IO3OG62+bnEz116c3kPlLyvXv7bg==
X-Received: by 2002:a5d:5f53:0:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-42b4bb90b60mr3558763f8f.12.1762968064363;
        Wed, 12 Nov 2025 09:21:04 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:4fbd:5c9b:d8a2:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b4789896esm9558995f8f.38.2025.11.12.09.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:21:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 17:21:03 +0000
Message-Id: <DE6W0RIF2Y26.1MENYDV2RIAIP@linaro.org>
Subject: Re: [PATCH v3 05/12] ASoC: codecs: wsa881x: split into common and
 soundwire drivers
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-5-9eeb08cab9dc@linaro.org>
 <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>
In-Reply-To: <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>

On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>
>
> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>> This is required in order to introduce wsa881x driver that works
>> in analog mode and is configurable via i2c only.
>> Functional changes, if any, are kept to be minimal and common
>> parts or parts that can be shared are moved into wsa881x-common
>> helper driver.
>> The regmap config structure now contains 0x3000 offset as required
>> by soundwire spec.
>>=20
>> While at this, also fix the typo in WSA881X_ADC_EN_SEL_IBIAS
>> register name and rename wsa881x_set_sdw_stream() to
>> wsa881x_set_stream() and update registers description in the
>> header and use the new defines in wsa881x_init_common() and
>> in wsa881x_digital_mute().
>>=20
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/Kconfig          |   4 +
>>  sound/soc/codecs/Makefile         |   2 +
>>  sound/soc/codecs/wsa881x-common.c | 193 +++++++++++++++
>>  sound/soc/codecs/wsa881x-common.h | 458 +++++++++++++++++++++++++++++++=
++++
>>  sound/soc/codecs/wsa881x.c        | 493 +------------------------------=
-------
>
> How about we have something like wsa881x.c wsa881x-sdw.c wsa881x-i2c.c ?

I am totaly open to suggestions. Splitting to wsa881x-{sdw,i2c}.c sounds
good to me.
I kept the original name to keep the changes minimal.



[...] (the rest of the patch was quoted and sent but I didn't find any
comments there, please let me know if I missed something there)

Best regards,
Alexey

