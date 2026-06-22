Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12D23BCED
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108768; cv=none; b=nMnf0EoFBjm8yVfR/2n1sZ0u59lr3Fnlu5qVgmZePXOyQnjzW2cnDhB9sg0QmP+/s6JZlT+7KDS+Uh/D96fkb6ppxgx33CtnppaK94nTD5gzaF0DmKmIKa2ozTepOdhWqIilyEJpxwgyH9aSwgFWqxqAZAxbVjTCgk7UEShMvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108768; c=relaxed/simple;
	bh=k/jKiLG5T7SlsMN6SZ5eXOClaqTNEE4Ub90SlxnqtLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgtCW2hbRSrXU/ch4KFGhnmgEDTXbjsBTu5poYtidCD2ykb/wyD2lG3oz1BeaTkxmAJJj1D3YweuPsLRng/uqIGjRweukbH4sxiuByYvMlg3Alnm17lWLGrpr8zJQQaxyunA5zTjDYuOCBQz1xykLvx3GYMbHVda65YBbvM4/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TE8RA6w5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TE8RA6w5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c855599a77aso1591952a12.0
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782108765; x=1782713565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UYItOtv5cbHbHn81xG9uaSAtTwXvVojgVomA6lyfc4=;
        b=TE8RA6w5YqNkXmKd3WVzp7oH+SmOdeHrvFUVhfeNk1CcTWPjAGChWh4gEuv4iOdPUA
         coBLHGv2sv5vCKeSzjwZAlz4S8erDo4y7+Xc91/+MdHGQECBplCi7FNcgvynedc3uA5I
         UVnusFWkm7nfbLo8skp/f2Y24fbBZV0lvasUhe4aDKlM5ZtbQsxmtDUPMykXCQJSijrq
         ZYfRaRINttOJnJJCmsDMgQ0WPIH19sy5L+0zCf5Vb+3KGuRA2djCLndD+9GNo+L/0C01
         TP9QN+QFL0Prkb/fus6+gKSxNYqtL1CRs5Vujcqg7sLELQ/NgHJVgesBubB3wCSMs0px
         gXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108765; x=1782713565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UYItOtv5cbHbHn81xG9uaSAtTwXvVojgVomA6lyfc4=;
        b=LiFExvw/sNBfn5+fZXqLAI5fb3iPq7l/jqXzGj5+2y5F1VrRNPsYWR4oPPB2CRVvTo
         oIp5MOKbLLp5VlIjQ9rB9wQSVYWbIWU42q7d2wEab1p5cB2wM2yrYVdcQd1Y0C7fAxv5
         P1b46NBU+DdftEiMC5Dl7niY/Yrm20U0aDzY89ormTf4dCyCI4nOW6Pa+2XoYl9zeTOe
         dRF5bDbC+NmhvduHVrMZli8bPUpA58KWmWG16/wlm6BqO68MzXpj2fXbk2aD6PGTgtb0
         q4dzRhYvvwg2NblTaVvZaMf7//TpB/PSQQHev68I7axf2cI5E/GM8H/l0JWJDZxuVtB9
         faXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YX+/Jk4I85trNiFcawHMg7C0tSsSX+V2jN0CRuLXJitwfbVWCS0QkaEPfPxJKP42t/pQAmRjfMS/clQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCI099vTQhC81EjRbEmVAh/TEeMlkXgA7GhCX6haDCyV6jmYNf
	9UMHxWezIkfrJ3N4m3S2sgaF3B0oFNE/6Q46KvzgK3CQr6Z4onyrmDeb
X-Gm-Gg: AfdE7cnlJo71s4pjDB27WakbkfRb4s/2qyIrbM2UqXjwr0dVBMkcbPKEFrxG4BPFR22
	EkP6wFepcZHEnr4OL++GRtk2ALu6pjaBv6hMrMHfDWbqcdwGupgka+Fd2Vbk88p+Wn3ioCxbC2c
	df0CldGy/LQF93x/3n7oL9fWgNMxbMiCqf/fcXKscu/oOz1tOdsNDsuoGN2ZYz1JjOU/w3icV+y
	YNFozzrhRGuDHR5vvHAUbsJ7uCmNTnRBlXA2CZhOa8QdJCACbTUcX+btfrRU2LpAobcuFD04sdY
	7u5y6fE9uPTVl4pflZly4CEU2Rx0HmjXCeBPj+J4y9yjK2Yex9xdhv5hAz6UDnWUtQDSTX1qLC4
	A3d1NONVwPnhTsGhm+qLBLHn78qVAjuNJW84L1utbSiQ0ZTFgriVlFU9F1aVj5CRXlu68B2KXBa
	Kj1NqICT9HCJaihfJrvUBcJJXaOs/RE56tOKQ9veDtznfjpZCf+W+jDMU=
X-Received: by 2002:a05:6a21:a395:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3bb34e6a0cfmr14815480637.39.1782108765381;
        Sun, 21 Jun 2026 23:12:45 -0700 (PDT)
Received: from [172.20.10.3] (42-79-6-161.emome-ip.hinet.net. [42.79.6.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5ef74ecsm6497888a12.29.2026.06.21.23.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 23:12:44 -0700 (PDT)
Message-ID: <cc417a12-a327-e63e-020b-00650a22d6d9@gmail.com>
Date: Mon, 22 Jun 2026 14:10:28 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260609024128.585938-1-YLCHANG2@nuvoton.com>
 <20260609024128.585938-2-YLCHANG2@nuvoton.com>
 <20260609-hysterical-rhino-of-resistance-d7e1da@quoll>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260609-hysterical-rhino-of-resistance-d7e1da@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/26 15:04, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 10:41:27AM +0800, Neo Chang wrote:
>> Add device tree bindings documentation for the Nuvoton NAU83G60
>> audio amplifier.
>>
>> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
>> ---
>> Changes in v4:
>> - Refine the `firmware-name` description to clarify the loading order
>>   (Left then Right) and the PBTL mode behavior.
>> - Remove the "dsp bypass" option description.
>> - Update the example node to follow devicetree coding styles.
>>
>> Changes in v3:
>> - Remove colon to resolve YAML build warnings.
>> - Fix 'firmware-name' property definition to comply with binding schemas
>>
>> Changes in v2:
>> - Dropped the word "driver" from the description.
>> - Removed runtime/software configuration properties:
>>    nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
>>    nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
>> - Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
>> - Removed unnecessary '|' formatting from single-line descriptions.
>> - Fixed typo in firmware-name property.
>> ---
>>   .../bindings/sound/nuvoton,nau8360.yaml       | 83 +++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>> new file mode 100644
>> index 000000000000..2d19aedf1419
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8360.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton NAU83G60 Stereo Class-D Amplifier with DSP
>> +
>> +description:
>> +  Stereo Class-D Amplifier with DSP and I/V-sense.
>> +  This device supports I2C.
>> +
>> +maintainers:
>> +  - Neo Chang <YLCHANG2@nuvoton.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,nau8360
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
> You want |
>
> Or this could be just enum of addresses, no need to copy paste address
> decoding from datasheet.
Thank you for the suggestion. I will modify it to an enum of addresses 
and remove redundant description in v5.
>
>> +      The I2C address of the device. The address is determined by the external
>> +      hardware configuration of GPIO1 and GPIO2 pins.
>> +       - 0x1a (GPIO2=Low, GPIO1=Low)
>> +       - 0x1b (GPIO2=Low, GPIO1=High)
>> +       - 0x4a (GPIO2=High, GPIO1=Low)
>> +       - 0x4b (GPIO2=High, GPIO1=High)
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  firmware-name:
>> +    minItems: 2
>> +    maxItems: 2
>> +    description:
>> +      Assign firmware filenames for Left and Right DSP cores.
>> +      The first firmware is for the Left channel,
>> +      and the second is for the Right channel.
> Drop all above and just list the items with description
>
>> +      In PBTL mode, the Left firmware is ignored and only the Right is applied.
> Combining also this.
>
> items:
>   - description: ...
>   - description: ...
Got it, I will format this using items and merge the descriptions in v5.
>
>
> Best regards,
> Krzysztof
>
