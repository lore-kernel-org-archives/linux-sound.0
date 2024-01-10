Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D113EA76
	for <linux-sound@vger.kernel.org>; Wed, 10 Jan 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6h2n4+E"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd7e429429so2276981fa.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jan 2024 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704879220; x=1705484020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIyXnYKcctaYHup1ciTg5ROK6sWFOrm09NlqM03v8ME=;
        b=f6h2n4+ET3+KdBK8SpL7i7F2yAdRfVY66OY5blpYZXb01DCpkHe5Kv+EuYs69PI0RX
         3tX23XIwfwfkFdP/+cEsmfGuk0OcSpVTBzHCcxmDIZMmM1vepaPv9ahBhoxBIz/5nRF3
         XkVRkR9qNsu3ujCiiGno0tCCIx7wXekEb86D23xOc9Zly9xQwsmrjIW+EgBd7F0GWF6t
         a3J19tsYfKMrNl7Emm86tyZ6UygiSANP5W9MWeZUXWLxbUCPTqsduQbe8voHv5TIiWyG
         xPXnsZqcfrrUxxhUrFosjKW/PeTflOxY3TTcu2zias3zv8pjMu9nzTIQgsMZSFLUc7QI
         eGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704879220; x=1705484020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIyXnYKcctaYHup1ciTg5ROK6sWFOrm09NlqM03v8ME=;
        b=DGPkIWcBQ6W9DgUu6yMVEZiKQ3yfMuBkUVwQbIXJg2gypPaOWnvvKKzKg1ZEvuVNcA
         L88gPTiIw760y/S9PCe3h8vddDVFFmmFdyPKKbvHzKvrUGLwZvm/mBjbPU9UIeAzPsJa
         rTqdvs39khBsjDJ0FHiZxRLYcFeng6Hw3e2LBQtu98Emra9xEsMoZACqtPxfNsIrGY2S
         Wr62Ui0W2r4h41FvXPEZhfcgHVSz5Uc60p/s2OsTvTIYcDmAQgxLBd4mR9O1KhEHFsto
         EhBUY27EhYkTRnEvM/MDvvsFjShaPqc2dNZw1xpEtP0txpXOAA0pDzS1FulIEqI/CFQt
         ZKWA==
X-Gm-Message-State: AOJu0Yx5AkPQI9X32hVXYR6NM5A9FpdhjdUQ1bI8OE3221YWs/QXHR8C
	o0A5dVwgKRAyeT0YJRT1Ei9go1eG6xwd2Q==
X-Google-Smtp-Source: AGHT+IG+xmdrk3GVI5jbOnWSvA70mmRnjeStL1rMYH2wMujd6ZplVaCGJQpDni9Xaci3dpTgk3GX5A==
X-Received: by 2002:a2e:a4b5:0:b0:2cd:633a:e1d6 with SMTP id g21-20020a2ea4b5000000b002cd633ae1d6mr430367ljm.13.1704879220194;
        Wed, 10 Jan 2024 01:33:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d44d1000000b003377e22ffdcsm857890wrr.85.2024.01.10.01.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:33:39 -0800 (PST)
Message-ID: <2d0f4a77-cfaf-47e9-839a-f5929fcdcbd8@linaro.org>
Date: Wed, 10 Jan 2024 10:33:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl-sai: Support Rx-only SAI
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com>
 <20231219122957.3358149-2-alexander.stein@ew.tq-group.com>
 <e97d0273-0827-4510-ba23-3d09642a234f@linaro.org>
 <2928386.e9J7NaK4W3@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2928386.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2024 10:26, Alexander Stein wrote:
> Hi Krzysztof,
> 
> Am Mittwoch, 20. Dezember 2023, 16:48:34 CET schrieb Krzysztof Kozlowski:
>> On 19/12/2023 13:29, Alexander Stein wrote:
>>> On SoC like i.MX8QXP some SAI IP cores support only Rx path. Allow
>>> specifying only an Rx DMA channel, while omitting the Tx one.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>> The feature list in reference manual IMX8DQXPRM Rev. 0 05/2020
>>> section 1.1.2 "Features" explicitly state that SAI2 and SAI3 is
>>> receive only.
>>
>> Why aren't you constraining it per variant/device? If only some have one
>> DMA channel, then I would normally expect allOf:if:then narrowing it for
>> each device.
> 
> I'm not sure I get what you want to constraint. In the very same SoC there are 
> SAI IP instances supporting Rx & Tx while others support Rx only.
> The feature list in RM IMX8DQXPRM Rev. 0 05/2020 states:
>>  4x SAI (SAI0 and SAI1 are transmit/receive; SAI2 and SAI3 are receive only)
> 
> An actual example can be seen at [1].
> 

Ah, that's fine.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

