Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B31716193C
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719390607; cv=none; b=Gfrm1CWKdgHyvMkNq/N1fQlGTEysANLRjMK8I5hnUck4HSiD/FoK5OOQSIElo5WPBNFR5c8EKpUCG+Z+Q5ddWXb+7ubvo/qlp5kUWTYvmh1pPHn5gLnC0SAQLY0x7qOsJsBcUC1Pcemny4WvJSWjvQX4LChza0Du1LTGq4O8Obg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719390607; c=relaxed/simple;
	bh=QeqkQtniBpxvd+UitRjWWYVFy5iXjPy7xv5fji8+3L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKX2k4Cb8T1VJA9AOwVWOgz6cyUUa1w842afFHo9k+chH3z3L/a27nzs03PGNutQQrY0Z2bBG2K67JzGbBaudnr6NkwdtpcPX3aEjOKMs/niqUchjlLiSGHjWqT/mbtbhWLKtTdTfI9oc4tRMX1TqZ4pNy0akVchscaQSyyeAVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dud3sBF2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dud3sBF2"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so5675774e87.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719390603; x=1719995403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
        b=dud3sBF2tVPRThcYciFuClucski/fMejwvP58nN7PA2C4550Bo1BWAmdARVLHwVjwE
         iG/VckS1SBkJmwhbUhUdrTvAXJa+qUkiUvwTUbwY7JDSg6nlUbhVGjV0lzJQfSBsWl7t
         AJbsBQHNfkMxtODpUfkOdbbmC5LdHOE2YbM/1zX9IQm+GjXcAzEnR1Z7KPWP516s9y35
         SWqG/skTT6LKFroJwByr0mw4jxtc5bvFQL2GWGqMKF6U4LBQLf7fwKM9+PjfzENn0O9+
         m1wQXj+ZuAtRrWRqMYubFa0aj+njwlJO76nffH00lHmh2ntyx6AAOpjQdprKcvep0tCW
         AKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719390603; x=1719995403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
        b=IAZVdg+Ar5eMHZ4Yte9SK2X5MzStMHZME2+aN1qkmzm3/xDSB2m2ciprX1qH+qitFj
         ITfPaxdI6WkC5PrRdZZqOZADTElNJoUG4OGeLVoR5BGlKM3W76+EnF4MU/nhUygfY/dr
         Wf/2oTRkb4u+xJQCD4eM+7zFjfrK5MCJ7N2wbcWnNpV8RLqJkHWDelH5l3jejtYZCtsu
         xAM7D1lzWdv7sloeglpshzROFPq9hGOcm9QPGMc6fO/iIw0ZB7dVoiQ/usvTg+rrhcDX
         FdH/9/ceENOjUZ1jLiVW0nCdeP9cpeFc88+s0YXjUoghVWWtQ+2ozqYFHPdRWriBgNXy
         jUcw==
X-Gm-Message-State: AOJu0YzqdWPtmKmwt5QnTg7e6Zhlp5NXfarCu5SnfJR5NkjkokcSjyaF
	3LK9I9rydVgTaNQtx0hb5lc2O+gdJmFDFLjQT8kpB8esL3luZmN94rraBHo0GFA=
X-Google-Smtp-Source: AGHT+IEca5cJU5ZW212x9C2okoEwkWZvRgPivrrUuJX0Y9+4JhwZuZye4d1Yr/SDCtFZrF/eM34AgA==
X-Received: by 2002:a05:6512:607:b0:52c:d84b:93b2 with SMTP id 2adb3069b0e04-52ce18341f9mr5698467e87.15.1719390603394;
        Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245f0sm16687705e9.33.2024.06.26.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Message-ID: <79811fff-4fdf-4121-9cea-6ed7e1329dad@baylibre.com>
Date: Wed, 26 Jun 2024 10:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
 <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
 <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2024 15:44, Krzysztof Kozlowski wrote:
> On 25/06/2024 11:23, Alexandre Mergnat wrote:
>>
>>
>> On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>>> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>>>> Add the audio codec sub-device. This sub-device is used to set the
>>>> optional voltage values according to the hardware.
>>>> The properties are:
>>>>     - Setup of microphone bias voltage.
>>>>     - Setup of the speaker pin pull-down.
>>>>
>>>> Also, add the audio power supply property which is dedicated for
>>>> the audio codec sub-device.
>>>>
>>>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>>>    1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> index 37423c2e0fdf..d95307393e75 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> @@ -37,6 +37,32 @@ properties:
>>>>      "#interrupt-cells":
>>>>        const: 2
>>>>    
>>>> +  vaud28-supply:
>>>> +    description: 2.8 volt supply phandle for the audio codec
>>>> +
>>>> +  audio-codec:
>>>> +    type: object
>>> Still not much improved. You do not have any resources there, so these
>>> should go to the parent node.
>>
>> Hi Krzysztof,
>>
>> vaud28-supply seems to be a mistake that I forward port.
>> In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec"
>> sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as
>> power-supply.
>>
>>       pwrap {
>>           pmic {
>>               ...
>>               audio-codec {
>>                   ...
>>
>> Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of
>> PMIC-audio-codec subsystem. Then:
>> - The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a
>> power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
>> - IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to
>> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec
>> substystem, beside mediatek,micbias0-microvolt
> 
> I don't understand why do we talk again about supply. My comment was not
> under the supply.

Because your word are:
"
And now you should see how odd it looks. Supplies are part of entire
chip, not subblock, even if they supply dedicated domain within that chip.

That's why I asked to put it in the parent node.
"

My bad, I forgot to link you the old message in my previous answer [1]

[1] https://lore.kernel.org/all/6d21da37-8be7-467c-8878-d57af0b0201b@kernel.org/#t

-- 
Regards,
Alexandre
